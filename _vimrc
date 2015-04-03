set showmatch
syntax on
set encoding=utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213
"" タブはスペース2つでインデントする
set tabstop=2
set autoindent
set expandtab
set shiftwidth=2
set cindent
set list
" スペースなどの見えない文字の表示方法を変える
set listchars=tab:>-,nbsp:%,extends:>,precedes:<
" インデントをわかりやすくする
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#121212 ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#262626 ctermbg=235

" vi との互換性OFF
set nocompatible
" ファイル形式の検出を無効にする
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	"call neobundle#rc(expand('~/.vim/bundle/'))
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	call neobundle#end()
endif

"insert here your Neobundle plugins"
NeoBundle 'scrooloose/nerdtree'

nnoremap <silent><C-e> :NERDTreeToggle<CR>

filetype plugin indent on
