# TGPT

## Instalação:
`curl -sSL https://raw.githubusercontent.com/aandrew-me/tgpt/main/install | bash -s /usr/local/bin`


## Uso:

Usage: tgpt [Flags] [Prompt]

Flags:
-s, --shell                                        Generate and Execute shell commands. (Experimental) 
-c, --code                                         Generate Code. (Experimental)
-q, --quiet                                        Gives response back without loading animation
-w, --whole                                        Gives response back as a whole text
-img, --image                                      Generate images from text
--provider                                         Set Provider. Detailed information has been provided below. (Env: AI_PROVIDER)

Some additional options can be set. However not all options are supported by all providers. Not supported options will just be ignored.
--model                                            Set Model
--key                                              Set API Key. (Env: AI_API_KEY)
--url                                              Set OpenAI API endpoint url
--temperature                                      Set temperature
--top_p                                            Set top_p
--max_length                                       Set max response length
--log                                              Set filepath to log conversation to (For interactive modes)
--preprompt                                        Set preprompt
-y                                                 Execute shell command without confirmation        

Options:
-v, --version                                      Print version
-h, --help                                         Print help message
-i, --interactive                                  Start normal interactive mode
-m, --multiline                                    Start multi-line interactive mode
-cl, --changelog                                   See changelog of versions

Providers:
The default provider is phind. The AI_PROVIDER environment variable can be used to specify a different provider.
Available providers to use: blackboxai, duckduckgo, groq, koboldai, ollama, openai and phind

Provider: blackboxai
Uses BlackBox model. Great for developers

Provider: deepseek
Uses deepseek-reasoner model by default. Requires API key. Recognizes the DEEPSEEK_API_KEY and DEEPSEEK_MODEL environment variables

Provider: duckduckgo
Available models: gpt-4o-mini (default), meta-llama/Meta-Llama-3.1-70B-Instruct-Turbo, mistralai/Mixtral-8x7B-Instruct-v0.1, claude-3-haiku-20240307

Provider: groq
Requires a free API Key. Supports LLaMA2-70b & Mixtral-8x7b

Provider: isou
Free provider with web search

Provider: koboldai
Uses koboldcpp/HF_SPACE_Tiefighter-13B only, answers from novels

Provider: ollama
Needs to be run locally. Supports many models

Provider: openai
Needs API key to work and supports various models. Recognizes the OPENAI_API_KEY and OPENAI_MODEL environment variables. Supports custom urls with --url

Provider: phind
Uses Phind Model. Great for developers

Provider: pollinations
Completely free, default model is gpt-4o. Supported models: https://text.pollinations.ai/models      

Image generation providers:

Provider: pollinations
Supported models: flux, turbo

Provider: blackboxai

Examples:
tgpt "What is internet?"
tgpt -m
tgpt -s "How to update my system?"
tgpt --provider duckduckgo "What is 1+1"
tgpt --provider openai --key "sk-xxxx" --model "gpt-3.5-turbo" "What is 1+1"
cat install.sh | tgpt "Explain the code"
