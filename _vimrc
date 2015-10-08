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
set ambiwidth=double

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
" theme color
""""""""""""""""""""""""""""""
syntax enable
colorscheme desert

""""""""""""""""""""""""""""""
" NeoBundle関連
""""""""""""""""""""""""""""""
if 1
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	"call neobundle#rc(expand('~/.vim/bundle/'))
	call neobundle#begin(expand('~/.vim/bundle/'))
	NeoBundleFetch 'Shougo/neobundle.vim'
	call neobundle#end()
endif

call neobundle#begin(expand('~/.vim/bundle/'))
""""""""""""""""""""""""""""""
" NEADTree Installing
""""""""""""""""""""""""""""""
NeoBundle 'scrooloose/nerdtree'

""""""""""""""""""""""""""""""
" Unite Installing
""""""""""""""""""""""""""""""
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'
" unite-outlineでアウトラインを表示できるようにする
NeoBundle 'Shougo/unite-outline'

""""""""""""""""""""""""""""""
" Auto Ctags 
""""""""""""""""""""""""""""""
NeoBundle 'soramugi/auto-ctags.vim'

""""""""""""""""""""""""""""""
" Multi cursors
""""""""""""""""""""""""""""""
NeoBundle 'terryma/vim-multiple-cursors'

""""""""""""""""""""""""""""""
" Markdown viewer
""""""""""""""""""""""""""""""
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'

call neobundle#end()

endif
""""""""""""""""""""""""""""""
" key bind 設定
""""""""""""""""""""""""""""""
" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" バッファ一覧
" 最近使ったファイルの一覧
noremap <C-L> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

" Ctagsのキーバインド
noremap <C-C> :Ctags<CR>

" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
" Unit.vimの設定
nnoremap [unite]    <Nop>
nmap     <Space>u [unite]
" 入力モードで開始する
let g:unite_enable_start_insert=1
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" アウトライン表示
let g:unite_split_rule = 'botright'
nnoremap <silent> [unite]o       : <C-u>Unite -no-quit -vertical -winwidth=30 outline<CR>

" vim grep 設定
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

" markdown 設定
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
let g:previm_show_header = 0
let g:previm_open_cmd = ''
nnoremap [previm] <Nop>
nmap <Space>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>


""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>
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

filetype plugin indent on

