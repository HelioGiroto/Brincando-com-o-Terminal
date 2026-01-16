#!/usr/bin/python3

# Script para reconhecimento facial com Visão Computacional (CV)

# Autor: IA

# Pesquisa: Helio Giroto

# Data: 12/01/2026

import cv2
import os
import numpy as np

DATASET_DIR = "dataset"
TEMP_DIR = "faces_temp"

os.makedirs(DATASET_DIR, exist_ok=True)
os.makedirs(TEMP_DIR, exist_ok=True)

face_cascade = cv2.CascadeClassifier(
    cv2.data.haarcascades + "haarcascade_frontalface_default.xml"
)

recognizer = cv2.face.LBPHFaceRecognizer_create()

def load_faces():
    faces = []
    labels = []
    label_map = {}
    current_label = 0

    for person in os.listdir(DATASET_DIR):
        person_path = os.path.join(DATASET_DIR, person)
        if not os.path.isdir(person_path):
            continue

        label_map[current_label] = person

        for img_name in os.listdir(person_path):
            img_path = os.path.join(person_path, img_name)
            img = cv2.imread(img_path, cv2.IMREAD_GRAYSCALE)
            if img is None:
                continue

            faces.append(img)
            labels.append(current_label)

        current_label += 1

    return faces, np.array(labels), label_map

faces, labels, label_map = load_faces()
if len(faces) > 0:
    recognizer.train(faces, labels)

cap = cv2.VideoCapture(0)
unknown_count = 0

print("Pressione 'q' para sair")

while True:
    ret, frame = cap.read()
    if not ret:
        break

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    detected_faces = face_cascade.detectMultiScale(
        gray, scaleFactor=1.3, minNeighbors=5
    )

    for (x, y, w, h) in detected_faces:
        face_img = gray[y:y+h, x:x+w]
        face_img_resized = cv2.resize(face_img, (200, 200))

        name = "Desconhecido"
        confidence = 999

        if len(faces) > 0:
            label, confidence = recognizer.predict(face_img_resized)
            if confidence < 70:
                name = label_map[label]

        if name == "Desconhecido":
            cv2.rectangle(frame, (x,y), (x+w,y+h), (0,0,255), 2)
            cv2.putText(frame, name, (x,y-10),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0,0,255), 2)

            # Salva rosto temporário
            temp_path = os.path.join(TEMP_DIR, f"unknown_{unknown_count}.jpg")
            cv2.imwrite(temp_path, face_img_resized)
            unknown_count += 1

            cap.release()
            cv2.destroyAllWindows()

            person_name = input(f"Pessoa desconhecida detectada. Nome da pessoa? ")

            if person_name.strip():
                person_dir = os.path.join(DATASET_DIR, person_name)
                os.makedirs(person_dir, exist_ok=True)

                new_path = os.path.join(
                    person_dir, f"{person_name}_{unknown_count}.jpg"
                )
                os.rename(temp_path, new_path)

                # Recarrega e treina novamente
                faces, labels, label_map = load_faces()
                recognizer.train(faces, labels)
                print(f"{person_name} cadastrada com sucesso!")

            cap = cv2.VideoCapture(0)
            break

        else:
            cv2.rectangle(frame, (x,y), (x+w,y+h), (0,255,0), 2)
            cv2.putText(frame, f"{name} ({int(confidence)})", (x,y-10),
                        cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0,255,0), 2)

    cv2.imshow("Reconhecimento Facial", frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()

