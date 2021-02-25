syntax on
set encoding=utf-8
set clipboard=unnamedplus
set nocompatible
set autoindent
set tabstop=4
set number
set hlsearch
set ignorecase
set linebreak
set wrap
set ruler
set cursorline
set number	
set mouse=a
set noerrorbells
set history=1000

let mapleader=","


" em modo Normal ao pressionar vírgula mais iniciais, abre um arquivo novo (piloto):
nnoremap ,ht :-1read .novo.html<CR> :$<CR>
nnoremap ,sh :-1read .novo.sh<CR> :$<CR>
nnoremap ,py :-1read .novo.py<CR> :$<CR>

" ctrl + a para selecionar tudo. Modo normal:
nnoremap <c-a> ggVG
inoremap <c-space> <c-n>

" move linha para cima ou para baixo ao pressionar ALT + setas:
inoremap <m-down> <esc>V y<esc>ddpi
inoremap <m-up> <esc>V y<esc>dd2kpi
nnoremap <m-down> <esc>V y<esc>ddpi
nnoremap <m-up> <esc>V y<esc>dd2kpi

" Já abre e fecha automaticamente () + {} + []:
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>



" Snippets de html:
iabbrev p <p></p><Esc> bbhhi
iabbrev strong <strong></strong><Esc> bbhhi

iabbrev div. <div class=""></div><Esc> bbhhhhi
iabbrev div# <div id=""></div><Esc> bbhhhhi
"iabbrev div <div></div><Esc> bbhhi

iabbrev script <script src=""></script> 

iabbrev class class=""<Esc> hi
iabbrev id id=""<Esc> hi



" Snippets de JS:
" 	3 letras e TAB
iabbrev add addEventListener("", )<BS><Esc> hhhi
iabbrev doc document
iabbrev query querySelector("")<BS><Esc> hi
iabbrev gete getElementById("")<BS><Esc> hi
iabbrev inn innerHTML
iabbrev ale alert("")<BS><Esc> hi
iabbrev cons console.log("")<BS><Esc> hi
iabbrev cli click
iabbrev sty style
iabbrev dis display
iabbrev non none
iabbrev fore forEach()<BS><Esc> i




" Coloca frase selecionada pelo modo Visual entre áspas, ao pressionar (leader + ")
vnoremap <leader>" c"<Esc>p$a"
vnoremap <leader>' c'<Esc>p$a'
vnoremap <leader>` c`<Esc>p$a`
vnoremap <leader>( c(<Esc>p$a)
vnoremap <leader>[ c[<Esc>p$a]
vnoremap <leader>{ c{<Esc>p$a}
vnoremap <leader>! c¡<Esc>p$a!
vnoremap <leader>? c¿<Esc>p$a?




