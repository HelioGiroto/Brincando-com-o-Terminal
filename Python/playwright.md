# PLAYWRIGHT

O Playwright para Python é uma biblioteca moderna e poderosa da *Microsoft* para **automação web, testes ponta a ponta (E2E) e web scraping**. Ele permite **controlar navegadores** (Firefox, Chromium, WebKit/Safari) via código para interagir com sites, preencher formulários, extrair dados e rodar testes rápidos, estáveis e com espera automática.

**- Documentação:**

https://playwright.dev/python/docs/intro


**- Instalação:**

` pip install playwright --break-system-packages `


**- Instalando navegadores:**

` playwright install `

_(https://playwright.dev/python/docs/intro)_


**- Para atualizar pacotes:**

` pip install pytest-playwright playwright -U `


**- Gerador nativo de códigos:**

` playwright codegen site.com.br `


**- Primeiros códigos:**

```python
from playwright.sync_api import sync_playwright
import time

with sync_playwright() as pw:
	# seleciona um navegador:
	# navegador = pw.chromium.launch(headless=False) # headless=False para ver o navegador
	navegador = pw.firefox.launch(headless=False)
	# define variável referente à página
	pagina = navegador.new_page()
	# Abre a página
	pagina.goto("https://google.com")
	# espera 4 segundos:
	time.sleep(4)
	# alternativa nativa:
	page.wait_for_timeout(4000)	# melhor
	# imprime o nome da aba da página na tela do Terminal:
	print(pagina.title())
	# fecha o navegador:
	navegador.close()
```

**- Selecionar um elemento HTML da página:**

page.get_by_role(): para localizar por atributos de acessibilidade explícitos e implícitos.

page.get_by_text(): para localizar por conteúdo de texto.

page.get_by_label(): para localizar um controle de formulário pelo texto do rótulo associado.

page.get_by_placeholder(): para localizar uma entrada por placeholder.

page.get_by_alt_text(): para localizar um elemento, geralmente imagem, por sua alternativa de texto.

page.get_by_title(): para localizar um elemento pelo seu atributo title.

page.get_by_test_id(): para localizar um elemento com base em seu atributo data-testid (outros atributos podem ser configurados).


Ver: https://playwright.dev/python/docs/locators

```python
pagina.locator('div#main')		# usando seletores CSS

divs = pagina.locator('div').all()	# um tipo de querySelectorAll do Javascript

pagina.locator('input#search').fill('busco...')	# preenche um input de um formulário
```


**- Trabalhando com contexto:**

Para gerenciar mais de uma página daquele site, é preciso trabalhar com contextos dentro do Playwright:

```python

from playwright.sync_api import sync_playwright
import time

with sync_playwright() as pw:
	# seleciona um navegador:
	# navegador = pw.chromium.launch(headless=False)
	navegador = pw.firefox.launch(headless=False)
	# define contexto 
	contexto = navegador.new_context()
	# define variável referente à página,
	# mas, ao invés de estar ligado ao navegador, diretamente, 
	# está ligado ao contexto:
	pagina = contexto.new_page()
	# Abre a página
	pagina.goto("https://www.empresa.com.br")
	# define elemento de um botão:
	botao = pagina.locator('button').filter(has_text = 'Abrir Nova Página')
	
	# espera 4 segundos:
	time.sleep(4)

	# define página 2 que provem do click no botão:
	# (porém não se recomenda, porque
	# poderá demorar para abrir e a variável receber o conteúdo da página)
	pagina2 = botao.click()		# não usar isso
	
	# alternativa melhor para esperar executar a
	with contexto.expect_page() as pagina2_info:
		botao.click()
	pagina2 = pagina2_info.value
	
	pagina2.get_by_role('button').click()
	
	# fecha o navegador:
	navegador.close()
    
```


**- Espera carregamento do elemento**

No Playwright automaticamente espera pelo carregamento de um elemento antes clicá-lo ou obter informações dele. Porém, isso pode ser forçado caso não queira depender exclusivamente da espera nativa. 

_(ver em: https://playwright.dev/python/docs/actionability)_

É preciso importar o objeto da classe `expect` acrescentando-o no momento da importação:

`from playwright.sync_api import sync_playwright, expect`

Um exemplo para clicar no botão apenas quando ele apareça:

```python 
# ...
novo_botao = pagina.locate('button#enviar')
expect(novo_botao).to_be_visible()
novo_botao.click()
```

São muitas as opções de espera relacionados aos elementos HTML de uma página, entre eles: 


| Afirmação | Descrição |
| --- | --- |
| [expect(locator).to\_be\_attached()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-be-attached) | O elemento está anexado. |
| [expect(locator).to\_be\_checked()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-be-checked) | A caixa de seleção está marcada. |
| [expect(locator).to\_be\_disabled()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-be-disabled) | O elemento está desativado. |
| [expect(locator).to\_be\_editable()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-be-editable) | O elemento é editável. |
| [expect(locator).to\_be\_empty()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-be-empty) | O recipiente está vazio |
| [expect(locator).to\_be\_enabled()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-be-enabled) | O elemento está ativado |
| [expect(locator).to\_be\_focused()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-be-focused) | O elemento está focado |
| [expect(locator).to\_be\_hidden()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-be-hidden) | O elemento não está visível. |
| [expect(locator).to\_be\_in\_viewport()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-be-in-viewport) | O elemento intersecta a janela de visualização. |
| [expect(locator).to\_be\_visible()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-be-visible) | O elemento está visível. |
| [expect(locator).to\_contain\_text()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-contain-text) | O elemento contém texto |
| [expect(locator).to\_have\_attribute()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-have-attribute) | O elemento possui um atributo DOM |
| [expect(locator).to\_have\_class()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-have-class) | O elemento possui uma propriedade de classe. |
| [expect(locator).to\_have\_count()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-have-count) | A lista contém o número exato de crianças. |
| [expect(locator).to\_have\_css()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-have-css) | O elemento possui propriedade CSS |
| [expect(locator).to\_have\_id()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-have-id) | O elemento possui um ID |
| [expect(locator).to\_have\_js\_property()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-have-js-property) | O elemento possui uma propriedade JavaScript. |
| [expect(locator).to\_have\_text()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-have-text) | O elemento corresponde ao texto. |
| [expect(locator).to\_have\_value()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-have-value) | A entrada tem um valor |
| [expect(locator).to\_have\_values()](https://playwright.dev/python/docs/api/class-locatorassertions#locator-assertions-to-have-values) | Selecione as opções selecionadas |
| [expect(page).to\_have\_title()](https://playwright.dev/python/docs/api/class-pageassertions#page-assertions-to-have-title) | A página tem um título |
| [expect(page).to\_have\_url()](https://playwright.dev/python/docs/api/class-pageassertions#page-assertions-to-have-url) | A página possui um URL |
| [esperar(resposta).to\_be\_ok()](https://playwright.dev/python/docs/api/class-apiresponseassertions#api-response-assertions-to-be-ok) | A resposta tem um status OK. |



**- Screenshot da página**

Captura simples da página - tamanho do que aparece na tela:
` page.screenshot(path="screenshot.png") `

A captura de tela da página inteira é uma captura de tela de uma página rolável completa, como se você tivesse uma tela muito alta e a página pudesse se encaixar inteiramente.:
` page.screenshot(path="screenshot.png", full_page=True) `

Captura apenas uma área ou elemento da página:
` page.locator(".header").screenshot(path="screenshot.png") `



---

Outras fontes: 

https://www.youtube.com/watch?v=yNuTu8csOU0

