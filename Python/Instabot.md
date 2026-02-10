# Instabot

- Fonte: 
https://github.com/InstaPy/InstaPy
https://github.com/InstaPy/InstaPy/tree/master/docs
https://github.com/InstaPy/InstaPy/blob/master/docs/settings.md

- Instalação:
` python3 -m pip install instapy  --break-system-packages `


- Exemplos de códigos sem abrir o navegador:

```python
from instapy import InstaPy, smart_run

usuario = "contaXYZ"
senha = "SUA_SENHA_AQUI"

imagem = "python.jpg"
descricao = "Subido com Python e InstaPy"

session = InstaPy(
    username=usuario,
    password=senha,
    headless_browser=False  # deixe False para depurar
)

with smart_run(session):
    session.upload_photo(
        imagem,
        caption=descricao
    )

```




```python
# importa módulo:
from instabot import Bot

# referencia a classe:
bot = Bot()

# faz login:
bot.login(username = "", password="")

# escolhe imagem:
img = "arq.jpg"

# publica a imagem com descrição:
bot.upload_photo(img, caption="alguma coisa")

# segue uma conta - sem @:
bot.follow('nasa')

# comenta ou dá like a uma publicação de uma conta:
link_post = "https://www.instagram/p/abcde"

id_post = bot.get_media_id_from_link(link_post)

bot.like(id_post)

bot.comment(id_post, "comentário... bla bla bla")


# imprime informações de apenas uma conta:
print(bot.get_user_info('contaXYZ'))

# obtem a lista de seguidores de uma conta: 
## retorna a uma lista
seguidores = bot.get_user_followers("contaXYZ")
## itera e imprime informações de cada elemento:
for seguidor in seguidores:
	print(bot.get_user_info(seguidor))	# muita coisa



# envia uma mensagem a uma conta: 
bot.send_message("olá!", "elonmusk")

```

