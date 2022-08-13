" Plugin
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 't9md/vim-quickhl'
Plugin 'flazz/vim-colorschemes'
Plugin 'lervag/vimtex'
call vundle#end()
filetype plugin indent on

" NerdTree
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Vim-airline
" タブバーのカスタマイズを有効にする
let g:airline#extensions#tabline#enabled = 1
" タブバーの右領域を非表示にする
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0

" ALE
let g:ale_linters = {
\   'c': ['gcc'],
\   'c++': ['gcc'],
\   'python': ['flake8']
\}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0

"emmet
let g:user_emmet_leader_key='<c-p>'

" Key mapping
nnoremap s <nop>            """ 
nnoremap ss :<C-u>sp<CR>    "
nnoremap sv :<C-u>vs<CR>    "
nnoremap sj <C-w>j          "
nnoremap sk <C-w>k          "   画面分割関連
nnoremap sl <C-w>l          "
nnoremap sh <C-w>h          "
nnoremap sJ <C-w>J          "
nnoremap sK <C-w>K          "
nnoremap sL <C-w>L          "
nnoremap sH <C-w>H          """
nnoremap st :<C-u>tabnew<CR>
nnoremap sq :<C-u>tabclose<CR>
nnoremap sf gt
nnoremap sb gT
inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^a<Left>
inoremap <C-z> <Esc>ua
noremap <C-t> :NERDTreeToggle<CR>
inoremap <C-t> :NERDTreeToggle<CR>
inoremap kj <ESC>
nnoremap O :<C-u>call append(expand('.'), '')<Cr>
nnoremap m $
vnoremap m $
nnoremap J jjjj
nnoremap K kkkk

"setting
scriptencoding utf-8           " スクリプト内でマルチバイト文字を扱う時の設定
set encoding=utf-8             " ファイル読み込み時の文字コード
set fileencoding=utf-8         " 保存時の文字コード
"set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

set nobackup                   " バックアップファイルを作らない
set noswapfile                 " スワップファイルを作らない

" tab, indent
set expandtab          		   " ソフトタブ
set tabstop=4		           " タブ文字の幅
set softtabstop=4	           " 連続した空白に対してタブキーやパックスペースが動く幅
set autoindent		           " 改行時に前の行のインデントを継続
set smartindent		           " 改行時に前の行の構文をチェックしてインデントを増減する
set shiftwidth=4           	   " smartindentで増減する幅

" serch
set incsearch	          	   " インクリメンタルサーチ, 1文字入力ごとに検索を行う
set ignorecase 	        	   " 検索パターンに大文字小文字を区別しない
set smartcase          		   " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch 		           " 検索結果をハイライト
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" cursor
set whichwrap=b,s,h,l,<,>,[,],~   "カーソルの左右移動で行末から次の行頭へ行ける
set number 		               " 行番号の表示

" 行が折り返し表示になっていた場合、行単位ではなく表示行単位でカーソル移動する
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk


set showmatch                   " 括弧の対応関係を一瞬で表示する

set clipboard+=unnamed          " クリップボードにヤンクする

set backspace=indent,eol,start  "バックスペースの有効化

source $VIMRUNTIME/macros/matchit.vim  "%の機能を拡張

" quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)

nmap <Space>w <Plug>(quickhl-manual-this-whole-word)
xmap <Space>w <Plug>(quickhl-manual-this-whole-word)

nmap <Space>c <Plug>(quickhl-manual-clear)
vmap <Space>c <Plug>(quickhl-manual-clear)

nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>] <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)

" highlight
syntax on
" highlight Normal ctermbg=black ctermfg=lightgray
autocmd colorscheme * highlight LineNr ctermfg=239
autocmd colorscheme * highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
autocmd colorscheme * highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgrey

" statusline
set laststatus=2 " ステータスラインを常に表示
set statusline=%F%r%h%=" ステータスラインの内容
" set cursorline

" colorscheme
colorscheme tender 

" mouse
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif

"cursor
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

" バイナリを開くときの設定
" vim -b hoge とすれば良い
augroup BinaryXXD
  autocmd!
  autocmd BufReadPre  *.bin let &binary =1
  autocmd BufReadPost * if &binary | silent %!xxd -g 1
  autocmd BufReadPost * set ft=xxd | endif
  autocmd BufWritePre * if &binary | %!xxd -r | endif
  autocmd BufWritePost * if &binary | silent %!xxd -g 1
  autocmd BufWritePost * set nomod | endif
augroup END

" インストラクションなどを英語で表示
language C
