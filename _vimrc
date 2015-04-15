set showmatch
syntax on
set encoding=utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213
"" タブはスペース2つでインデントする
set tabstop=4
set autoindent
"set expandtab
set shiftwidth=4
"set cindent
set list
"set clipboard
set clipboard+=unnamed

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

""""""""""""""""""""""""""""""
" NeoBundle関連
""""""""""""""""""""""""""""""
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	"call neobundle#rc(expand('~/.vim/bundle/'))
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	call neobundle#end()
endif

""""""""""""""""""""""""""""""
" NEADTree Installing
"  and key mapping
""""""""""""""""""""""""""""""
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" ファイルオープンを便利に
""""""""""""""""""""""""""""""
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" unite-outlineでアウトラインを表示できるようにする
NeoBundle 'Shougo/unite-outline'
nnoremap <silent> <Space>uo       : <C-u>Unite -no-quit -vertical -winwidth=30 outline<CR>

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Auto Ctags 
""""""""""""""""""""""""""""""
NeoBundle 'soramugi/auto-ctags.vim'
" Ctagsのキーバインド
noremap <C-C> :Ctags<CR>


""""""""""""""""""""""""""""""
" theme color
""""""""""""""""""""""""""""""
syntax enable
colorscheme desert

filetype plugin indent on
