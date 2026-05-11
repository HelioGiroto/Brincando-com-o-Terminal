#!/usr/bin/env python3
import tkinter as tk
from tkinter import ttk
import subprocess
import whisper
import tempfile
import os
import wave
import threading
import numpy as np

TAMANHO = "small"

class GravadorApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Transcreve Áudio")
        self.root.geometry("320x280")
        self.root.resizable(False, False)
        self.root.configure(bg="#1a1a2e")

        self.gravando = False
        self.proc = None
        self.raw_path = None
        self.chunks = []
        self.barras = []
        self.anim_id = None

        style = ttk.Style()
        style.theme_use('clam')

        main_frame = tk.Frame(root, bg="#1a1a2e")
        main_frame.pack(expand=True, fill="both", padx=20, pady=20)

        self.label_status = tk.Label(
            main_frame, text="Pronto para gravar",
            font=("Helvetica", 13), fg="#e0e0e0", bg="#1a1a2e"
        )
        self.label_status.pack(pady=(0, 15))

        bars_frame = tk.Frame(main_frame, bg="#1a1a2e")
        bars_frame.pack(pady=10)

        for _ in range(20):
            bar = tk.Frame(bars_frame, bg="#00d2ff", height=4, width=8, bd=0)
            bar.pack(side="left", padx=1)
            self.barras.append(bar)

        btn = tk.Button(
            main_frame, text="GRAVAR", font=("Helvetica", 16, "bold"),
            fg="white", bg="#2ecc71", activebackground="#27ae60",
            relief="flat", padx=30, pady=10, cursor="hand2",
            command=self.toggle_gravacao
        )
        btn.pack(pady=20)
        self.btn_gravar = btn

    def toggle_gravacao(self):
        if self.gravando:
            self.parar_gravacao()
        else:
            self.iniciar_gravacao()

    def iniciar_gravacao(self):
        self.gravando = True
        self.chunks = []
        self.btn_gravar.config(text="STOP", bg="#e94560")
        self.label_status.config(text="Gravando...")

        for bar in self.barras:
            bar.config(bg="#00d2ff")

        self.animar_barras()
        self.thread_gravacao()

    def thread_gravacao(self):
        t = threading.Thread(target=self.gravar_audio, daemon=True)
        t.start()

    def gravar_audio(self):
        with tempfile.NamedTemporaryFile(suffix=".raw", delete=False, dir="/tmp") as f:
            self.raw_path = f.name

        self.proc = subprocess.Popen([
            "arecord", "-f", "S16_LE", "-r", "16000", "-c", "1",
            "-t", "raw", self.raw_path
        ], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    def parar_gravacao(self):
        self.gravando = False
        self.label_status.config(text="Processando...")
        if self.btn_gravar.winfo_exists():
            self.btn_gravar.config(state="disabled", text="AGUARDE...")

        if self.anim_id:
            self.root.after_cancel(self.anim_id)

        if self.proc:
            self.proc.terminate()
            self.proc.wait()

        if self.raw_path and os.path.exists(self.raw_path):
            size = os.path.getsize(self.raw_path)
            if size > 0:
                self.thread_transcrever()
            else:
                self.reset_ui("Audio muito curto.")
                os.unlink(self.raw_path)
        else:
            self.reset_ui("Nenhum audio gravado.")

    def thread_transcrever(self):
        t = threading.Thread(target=self._transcrever, daemon=True)
        t.start()

    def _transcrever(self):
        try:
            wav_path = self.raw_path.replace(".raw", ".wav")
            with open(self.raw_path, "rb") as f:
                dados = f.read()
            with wave.open(wav_path, "wb") as wf:
                wf.setnchannels(1)
                wf.setsampwidth(2)
                wf.setframerate(16000)
                wf.writeframes(dados)
            os.unlink(self.raw_path)

            model = whisper.load_model(TAMANHO)
            resultado = model.transcribe(wav_path, language="pt")
            texto = resultado["text"].strip()
            os.unlink(wav_path)

            if texto:
                subprocess.run(["xclip", "-selection", "clipboard"], input=texto.encode())
                self.root.after(0, lambda: self.sucesso(texto))
            else:
                self.root.after(0, lambda: self.reset_ui("Nada transcrito."))
        except Exception as e:
            self.root.after(0, lambda: self.reset_ui(f"Erro: {e}"))

    def sucesso(self, texto):
        for bar in self.barras:
            bar.config(bg="#00ff88")
        self.label_status.config(text="Copiado para o clipboard!")
        self.btn_gravar.config(state="normal", text="GRAVAR", bg="#2ecc71")
        self.root.update()
        self.root.after(2000, self.reset_ui)

    def reset_ui(self, msg):
        for bar in self.barras:
            bar.config(bg="#333355")
        self.label_status.config(text=msg)
        self.btn_gravar.config(state="normal", text="GRAVAR", bg="#2ecc71")
        self.gravando = False

    def fechar(self):
        if self.gravando:
            self.parar_gravacao()
        self.root.destroy()

    def animar_barras(self):
        if not self.gravando:
            return
        h = [np.random.randint(8, 60) for _ in self.barras]
        for bar, altura in zip(self.barras, h):
            bar.config(height=altura)
        self.anim_id = self.root.after(80, self.animar_barras)

def main():
    root = tk.Tk()
    app = GravadorApp(root)
    root.protocol("WM_DELETE_WINDOW", app.fechar)
    root.mainloop()

if __name__ == "__main__":
    main()
