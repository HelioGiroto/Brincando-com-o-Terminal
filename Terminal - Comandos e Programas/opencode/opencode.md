# OPENCODE


## Instalação

- Ir a https://opencode.ai/
- Baixar de: ` curl -fsSL https://opencode.ai/install | bash `


## Instalar comandos: 

- Crie um arquivo md com o conteúdo do comando. Exemplo: 

```md
---
	description: Executa o transcritor de áudio
	agent: build
	---
	Executa o transcritor de áudio em background (não bloqueia o chat):
	!nohup transcreve_audio.py > /dev/null 2>&1 &
```

- Crie pasta e copie o arquivo md com o comando:

```bash
	mkdir .config/opencode/commands
	cd .config/opencode/commands
	cp ~/Brincando-com-o-Terminal/Terminal\ -\ Comandos\ e\ Programas/opencode/audio.md .
```

- Reinicie o opencode

- Na área do prompt digite o comando: `/audio` e "ENTER" para abrir o script.


## Instalar MCPs:

- Para instlar o MCP do Chrome Devtools:
`https://github.com/ChromeDevTools/chrome-devtools-mcp`

- Baixe até `opencode` e copie (Ctrl + Shift + V) o código:

```
{
  "$schema": "https://opencode.ai/config.json",
  "mcp": {
    "chrome-devtools": {
      "type": "local",
      "command": ["npx", "-y", "chrome-devtools-mcp@latest"]
    }
  }
}
```

- Vá ao prompt do opencode e digite: 

`Gostaria de instalar o MCP do Chrome Devtools aqui no opencode globalmente. O código é este: [[ -- aqui cola o código acima --]]` 

- Com isso o Opencode instalará por si mesmo o MCP desejado.



## Logar com LLMs - NVIDIA

- Crie conta em NVIDIA e faça login
- Vá a `https://build.nvidia.com/settings/api-keys` 
- Gere a chave dando nome e data de expiração (pode ser 'nunca expira')
- Abra o Opencode
- Comando: `/connect`
- Cola a api key e dá enter
- Pronto
- Para acessar todos os modelos: `/models`




