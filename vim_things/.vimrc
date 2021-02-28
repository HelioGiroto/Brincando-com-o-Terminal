
"""""""""""""""""""""""""""""""""""""" 
"Vundle...

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"Meus plugins:

"NERDTREE:
Plugin 'scrooloose/nerdtree' 	" https://vimawesome.com/plugin/nerdtree-red
"Atalho para abrir/fechar:
nnoremap <c-t> :NERDTreeToggle<CR>



call vundle#end()
filetype plugin indent on

":PluginList       - lists configured plugins
":PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
":PluginSearch foo - searches for foo; append `!` to refresh local cache
":PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"

"""""""""""""""""""""""""""""""""""""""""
" configuração da barra de rodapé do vim
"
"https://shapeshed.com/vim-statuslines/
"https://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim
"
"
" function! HighlightSearch()
"   if &hls
"     return 'H'
"   else
"     return ''
"   endif
" endfunction

" set statusline=
" set statusline+=%7*\[%n]                                  "buffernr
" set statusline+=%1*\ %<%F\                                "File+path
" set statusline+=%2*\ %y\                                  "FileType
" set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
" set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
" set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
" set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
" set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
" set statusline+=%9*\ col:%03c\                            "Colnr
" set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

"hi User1 guifg=#ffdad8  guibg=#880c0e
"hi User2 guifg=#000000  guibg=#F4905C
"hi User3 guifg=#292b00  guibg=#f4f597
"hi User4 guifg=#112605  guibg=#aefe7B
"hi User5 guifg=#051d00  guibg=#7dcc7d
"hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
"hi User8 guifg=#ffffff  guibg=#5b7fbb
"hi User9 guifg=#ffffff  guibg=#810085
"hi User0 guifg=#ffffff  guibg=#094afe
"
"Acima: como inserir texto em varias linhas selecionadas: https://stackoverflow.com/questions/9549729/vim-insert-the-same-characters-across-multiple-lines

""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""

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

"""""""""""""""""""""""""""""""""""""
" CORES - THEMES:
" http://vimcolors.com/

set termguicolors
" the configuration options should be placed before `colorscheme miramare`
" let g:miramare_enable_italic = 1
" let g:miramare_disable_italic_comment = 1
" colorscheme miramare
" colorscheme vacme 	" claro
" colorscheme ambient	" marrom e cinza
" colorscheme vanilla-cake
colorscheme desert-night
""""""""""""""""""""""""""""""""""""""



let mapleader=","


"em modo Normal ao pressionar vírgula mais iniciais, abre um arquivo novo (piloto):
nnoremap ,ht :-1read .novo.html<CR> :$<CR>
nnoremap ,sh :-1read .novo.sh<CR> :$<CR>
nnoremap ,py :-1read .novo.py<CR> :$<CR>

"ctrl + a para selecionar tudo. Modo normal:
nnoremap <c-a> ggVG
inoremap <c-space> <c-n>

"move linha para cima ou para baixo ao pressionar ALT + setas:
inoremap <m-down> <esc>V y<esc>ddpi
inoremap <m-up> <esc>V y<esc>dd2kpi
nnoremap <m-down> <esc>V y<esc>ddpi
nnoremap <m-up> <esc>V y<esc>dd2kpi

"Já abre e fecha automaticamente () + {} + []:
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>



"Snippets de html:
iab p <p></p><Esc> bbhhi
iab strong <strong></strong><Esc> bbhhi

iab div. <div class=""></div><Esc> bbhhhhi
iab div# <div id=""></div><Esc> bbhhhhi
"iabbrev div <div></div><Esc> bbhhi

iab script <script src=""></script> 

iab class class=""<Esc> hi
iab id id=""<Esc> hi



"Snippets de JS:
"3 letras e TAB
iab add addEventListener("", )<BS><Esc> hhhi
iab doc document
iab query querySelector("")<BS><Esc> hi
iab gete getElementById("")<BS><Esc> hi
iab inn innerHTML
iab ale alert("")<BS><Esc> hi
iab cons console.log("")<BS><Esc> hi
iab cli click
iab sty style
iab dis display
iab non none
iab fore forEach()<BS><Esc> i


"Coloca frase selecionada pelo modo Visual entre áspas, ao pressionar (leader + ")
vnoremap <leader>" c"<Esc>p$a"
vnoremap <leader>' c'<Esc>p$a'
vnoremap <leader>` c`<Esc>p$a`
vnoremap <leader>( c(<Esc>p$a)
vnoremap <leader>[ c[<Esc>p$a]
vnoremap <leader>{ c{<Esc>p$a}
vnoremap <leader>! c¡<Esc>p$a!
vnoremap <leader>? c¿<Esc>p$a?


"ver: https://vi.stackexchange.com/questions/18231/what-is-the-difference-of-using-au-bufnewfile-bufread-py-and-au-filetype-py
"https://vim.fandom.com/wiki/Use_abbreviations_for_frequently-used_words

