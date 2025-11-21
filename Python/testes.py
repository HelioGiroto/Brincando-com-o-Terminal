#!/usr/bin/python3  
# Script: Atualiza preços de uma lista ou de um dicionário 
# Autor: Hélio Giroto
# Data: 20/11/2025


## COM LISTAS SIMPLES:

lista_precos = [17.9, 23.5, 8.99, 4.89, 3.49, 4.29, 7.8, 4.75, 14.5, 3.99, 2.49, 2.89, 12.9, 9.99, 12.49, 11.8, 5.99, 2.59, 7.49, 5.79]

# atualizando lista de preços usando list Comprehension:
novos_precos = [x*1.1 for x in lista_precos]

# com apenas 2 casas decimais:
novos_precos = [round(x*1.1, 2) for x in lista_precos]

# com map e lambda:
novos_precos = list(map(lambda p: p*1.1, lista_precos))
# com 2 casas decimais:
novos_precos = list(map(lambda p: round(p*1.1, 2), lista_precos))



#### ----------------------------- ####

## COM LISTAS ANINHADAS:

# aqui temos uma lista de listas que em cada linha é um produto com nome, marca, peso e preço:
produtos = [['Café Torrado', 'BomDia', '500g', 17.9], ['Arroz Tipo 1', 'PratoFino', '5kg', 23.5], ['Feijão Carioca', 'DaRoça', '1kg', 8.99], ['Leite Integral', 'Lactobom', '1L', 4.89], ['Açúcar Cristal', 'Doçura', '1kg', 3.49], ['Macarrão Espaguete', 'MassaFit', '500g', 4.29], ['Óleo de Soja', 'SolVida', '900ml', 7.8], ['Farinha de Trigo', 'PremiumMix', '1kg', 4.75], ['Leite em Pó', 'NutiMax', '400g', 14.5], ['Creme Dental', 'Brilho+', '90g', 3.99], ['Sabonete Hidratante', 'SoftSkin', '85g', 2.49], ['Detergente Líquido', 'Limpolux', '500ml', 2.89], ['Shampoo Anticaspa', 'HairClear', '200ml', 12.9], ['Desodorante Aerosol', 'FreshUp', '150ml', 9.99], ['Sabão em Pó', 'Limpex', '1kg', 12.49], ['Amaciante de Roupas', 'PerfumeLar', '2L', 11.8], ['Papel Higiênico', 'Macio+', '4 rolos', 5.99], ['Água Mineral', 'PuraFonte', '1.5L', 2.59], ['Refrigerante Cola', 'CoolDrink', '2L', 7.49], ['Chocolate ao Leite', 'ChocoLovers', '90g', 5.79]]

# vamos atualizar os preços em 10% da forma simples usando List Comprehension:
atualizado = [[i[0], i[1], i[2], i[3]*1.1] for i in produtos]
atualizado = list(map(lambda p: [p[0], p[1], p[2], p[3]* 1.1], produtos))


# agora usando também xargs:
atualizado = [[*i, i[3]*1.1] for i in produtos]
atualizado = list(map(lambda p: p[:3] + [p[3]*1.1], produtos))  # !!!


#### ----------------------------- ####

## COM DICIONÁRIOS

# Aqui temos uma lista de dicionários cujos preços devem ser atualizados em 10%:
produtos = [{'nome': 'Café Torrado', 'marca': 'BomDia', 'peso': '500g', 'preco': 17.9}, {'nome': 'Arroz Tipo 1', 'marca': 'PratoFino', 'peso': '5kg', 'preco': 23.5}, {'nome': 'Feijão Carioca', 'marca': 'DaRoça', 'peso': '1kg', 'preco': 8.99}, {'nome': 'Leite Integral', 'marca': 'Lactobom', 'peso': '1L', 'preco': 4.89}, {'nome': 'Açúcar Cristal', 'marca': 'Doçura', 'peso': '1kg', 'preco': 3.49}, {'nome': 'Macarrão Espaguete', 'marca': 'MassaFit', 'peso': '500g', 'preco': 4.29}, {'nome': 'Óleo de Soja', 'marca': 'SolVida', 'peso': '900ml', 'preco': 7.8}, {'nome': 'Farinha de Trigo', 'marca': 'PremiumMix', 'peso': '1kg', 'preco': 4.75}, {'nome': 'Leite em Pó', 'marca': 'NutiMax', 'peso': '400g', 'preco': 14.5}, {'nome': 'Creme Dental', 'marca': 'Brilho+', 'peso': '90g', 'preco': 3.99}, {'nome': 'Sabonete Hidratante', 'marca': 'SoftSkin', 'peso': '85g', 'preco': 2.49}, {'nome': 'Detergente Líquido', 'marca': 'Limpolux', 'peso': '500ml', 'preco': 2.89}, {'nome': 'Shampoo Anticaspa', 'marca': 'HairClear', 'peso': '200ml', 'preco': 12.9}, {'nome': 'Desodorante Aerosol', 'marca': 'FreshUp', 'peso': '150ml', 'preco': 9.99}, {'nome': 'Sabão em Pó', 'marca': 'Limpex', 'peso': '1kg', 'preco': 12.49}, {'nome': 'Amaciante de Roupas', 'marca': 'PerfumeLar', 'peso': '2L', 'preco': 11.8}, {'nome': 'Papel Higiênico', 'marca': 'Macio+', 'peso': '4 rolos', 'preco': 5.99}, {'nome': 'Água Mineral', 'marca': 'PuraFonte', 'peso': '1.5L', 'preco': 2.59}, {'nome': 'Refrigerante Cola', 'marca': 'CoolDrink', 'peso': '2L', 'preco': 7.49}, {'nome': 'Chocolate ao Leite', 'marca': 'ChocoLovers', 'peso': '90g', 'preco': 5.79}]

# Atualizando os preços de forma simples: 
produtos_ajustados = [
    {
    "nome":  p["nome"],
    "marca": p["marca"],
    "peso":  p["peso"],
    "preco": round(p["preco"] * 1.10, 2)
    }
    for p in produtos
]
# usando map e lamdda - mesmo resultado ao de cima:
produtos_ajustados = list(map(lambda p: {'nome': p['nome'], 'marca': p['marca'], 'peso': p['peso'], 'preco': p['preco']*1.1 }, produtos))


# atualiando os preços usando List Comprehension e kwargs:
novo = [{**p, 'preco': p['preco']*1.10} for p in produtos]
novo = list(map(lambda p: {**p, 'preco': p['preco']*1.1}, produtos))


# atualizando por exemplo o formato do nome da marca:
novo = [{**p, 'marca': p['marca'].upper()} for p in produtos]
novo = list(map(lambda p: {**p, 'marca': p['marca'].upper()}, produtos))

# atualizando os dois campos:
novo = [{ **dic, 'nome': dic['nome'].upper(), 'preco': dic['preco']*1.1 } for dic in produtos]
novo = list(map(lambda dic: {**dic, 'nome': dic['nome'].upper(), 'preco': dic['preco']*1.1 }, produtos))


# o mesmo de cima com outro formato: 
novo = [
    { 
    **dic, 
    'nome': dic['nome'].upper(), 
    'preco': dic['preco']*1.1 
    } 
    for dic in produtos
]

# com centavos em float com 2 casas decimais:
novo = [
    { 
    **dic, 
    'nome': dic['nome'].upper(), 
    'preco': round(dic['preco'] * 1.10, 2)
    } 
    for dic in produtos
]


#### ----------------------------- ####

## EXTRAINDO NOVOS DICIONÁRIOS/LISTAS DE OUTRO:

# Da lista de dicionários vamos formar uma lista de apenas os preços dos produtos:

[p['preco'] for p in produtos]
# [17.9, 23.5, 8.99, 4.89, 3.49, 4.29, 7.8, 4.75, 14.5, 3.99, 2.49, 2.89, 12.9, 9.99, 12.49, 11.8, 5.99, 2.59, 7.49, 5.79]


# compare com este formato abaixo:
[{p['preco']} for p in produtos]
# [{17.9}, {23.5}, {8.99}, {4.89}, {3.49}, {4.29}, {7.8}, {4.75}, {14.5}, {3.99}, {2.49}, {2.89}, {12.9}, {9.99}, {12.49}, {11.8}, {5.99}, {2.59}, {7.49}, {5.79}]

# extraindo um novo dicionário de apenas nome do produto e preço a partir do dicionário principal:
[{p['nome']: p['preco']} for p in produtos]
# [{'Café Torrado': 17.9}, {'Arroz Tipo 1': 23.5}, ...}

# listas aninhadas:
[[p['nome'], p['preco']] for p in produtos]
# [['Café Torrado', 17.9], ['Arroz Tipo 1', 23.5], ...]


# Usando map e lambda:
novo_dic = list(map(lambda p: {p['nome']: p['preco']} , produtos))
nova_lista_aninhada = list(map(lambda p: [p['nome'], p['preco']], produtos))
soh_precos_dic = list(map(lambda p: {p['preco']} , produtos))
soh_precos_lista = list(map(lambda p: p['preco'] , produtos))