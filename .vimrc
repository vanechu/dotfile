"""""""""""""""""""""""""""""""""""""""
"平台判断
"""""""""""""""""""""""""""""""""""""""
function! MySys()
if has("win32")
return "windows"
else
return "linux"
endif
endfunction

"""""""""""""""""""""""""""""""""""""""
"模仿MS快捷键
"""""""""""""""""""""""""""""""""""""""
"source $VIMRUNTIME/mswin.vim

" CTRL-X and SHIFT-Del are Cut
"vnoremap <C-X> "+x

" CTRL-C and CTRL-Insert are Copy
"vnoremap <C-C> "+y

" CTRL-V and SHIFT-Insert are Paste
"map <C-V> "+p

"""""""""""""""""""""""""""""""""""""""
"Gerneral
"""""""""""""""""""""""""""""""""""""""
" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" 编辑vimrc之后，重新加载
if MySys() == "windows"
autocmd! bufwritepost _vimrc source ~/_vimrc
else
autocmd! bufwritepost .vimrc source ~/.vimrc
endif

" 禁用Vi的兼容模式
set nocompatible

" Set windows postion and size
if has("gui_running")
"winpos 0 0
"set lines=43
"set columns=85
set guioptions -=m
set guioptions -=T
set guioptions -=L
set guioptions -=r
"set showtabline=0
endif

" 设定状态栏多显示信息
set laststatus=2

if exists('+autochdir')
" 文件路径设置为当前路径
set autochdir
endif

"auto save zz info
au BufWinLeave *.* silent mkview
au BufWinEnter *.* silent loadview


"""""""""""""""""""""""""""""""""""""""
"Vundle
"""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" My Bundles here:

" vim-scripts repos

Bundle 'gmarik/vundle'

" Syntax

"Bundle 'hallison/vim-markdown'


" Color

Bundle 'desert256.vim'
Bundle 'Impact'
Bundle 'matrix.vim'
Bundle 'vividchalk.vim'
Bundle 'ego.vim'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'

" Ftplugin


" Indent



" Plugin



" non github repos
"Bundle 'git://git.wincent.com/command-t.git'

"""""""""""""""""""""""""""""""""""""""
"VIM user interface
"""""""""""""""""""""""""""""""""""""""
"Set Number
set number

" use chinese help
"set helplang=cn

"set the menu & the message to English
set langmenu=en_US
let $LANG="en_US.UTF-8"

set ruler "右下角显示当前光标

"set cmdheight=2 "The commandbar height

" Set backspace config
set backspace=eol,start,indent
"set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase
"set nowrapscan

" 使用正统的搜索正则
"nnoremap / /\v
"vnoremap / /\v

set hlsearch "Highlight search things

set incsearch "在输入部分查找模式时显示相应的匹配点。
"set nolazyredraw "Don't redraw while executing macros

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them

set sidescroll=10 "左右移动边距

"set list " 显示制表符/回车符
set listchars=tab:>-,trail:$ " 行尾符号

set showcmd "显示右下角命令
set cursorline

set noerrorbells
set novisualbell

"set iskeyword=@,48-57,192-255

if ! has("gui_running")
set mouse-=a
endif

set equalalways "分割窗口时保持相等的宽/高

set guitablabel=%N.%t " 设定标签上显示序号

set foldmethod=syntax

"""""""""""""""""""""""""""""""""""""""
"Colors and Fonts
"""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

"gfn=consolas:h10
"set gui options
if has("gui_running")
set guifont=Monospace\ 11

" Set syntax color
colorscheme molokai
else
colorscheme desert256
endif

set ambiwidth=double " 设定某些标点符号为宽字符

" 设定行首tab为灰色
highlight LeaderTab guifg=#666666

"""""""""""""""""""""""""""""""""""""""
"Files, backups and undo
"""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
"set noswapfile
set backupext=.bak

"设置编码
set fileencodings=utf-8,gbk,ucs-bom,default,latin1
set termencoding=utf-8
set encoding=utf-8


"""""""""""""""""""""""""""""""""""""""
"Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""

"set expandtab
set noexpandtab "是否使用Tab缩进 默认使用

set shiftwidth=4
set tabstop=4
set smarttab

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

set showmatch " show matching bracets

"""""""""""""""""""""""""""""""""""""""
"FileType setting
"""""""""""""""""""""""""""""""""""""""

au BufRead,BufNewFile *.md set filetype=markdown

au FileType python setlocal expandtab colorcolumn=79 textwidth=79 " fo+=Mm
"Map F9 to Run Python Script
au FileType python map <F9> :!python %
au FileType asciidoc setlocal colorcolumn=79
au FileType markdown setlocal colorcolumn=79
au FileType mako setlocal colorcolumn=79 cc=0 fdm=indent
"au FileType html setlocal shiftwidth=2 tabstop=2
au FileType haskell setlocal expandtab
au FileType lua setlocal expandtab
au FileType java setlocal colorcolumn=108
au FileType ruby setlocal expandtab shiftwidth=2 colorcolumn=79
au FileType eruby setlocal expandtab shiftwidth=2
au FileType rst setlocal colorcolumn=79

"""""""""""""""""""""""""""""""""""""""
"Visual mode related
"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"Command mode related
"""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""
"Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

"""""""""""""""""""""""""""""""""""""""
"Visual Cues
"""""""""""""""""""""""""""""""""""""""
if exists(':relativenumber')
set number " 显示行号
else
set relativenumber " 显示相对行号
endif
set numberwidth=2 "行号栏的宽度
" set foldclose=all

"function! MarkPoint()
"mark `
"endfunction

"autocmd CursorMoved * call MarkPoint()


"""""""""""""""""""""""""""""""""""""""
" Text Formatting/Layout
"""""""""""""""""""""""""""""""""""""""

set formatoptions+=mB
set lbr "智能换行
"set tw=500 "自动换行 超过n列

"""""""""""""""""""""""""""""""""""""""
" Plugin
"""""""""""""""""""""""""""""""""""""""




"""""""""""""""""""""""""""""""""""""""
" Map
"""""""""""""""""""""""""""""""""""""""
map <F2> :Tlist<cr>
"代码折叠快捷方式
map <F3> zR
map <F4> zM

" 标签设置
map <F11> gT
map <F12> gt
imap <F11> <Esc>gT
imap <F12> <Esc>gt

if has("gui_running")
imap <M-1> <Esc>1gt
nmap <M-1> 1gt
imap <M-2> <Esc>2gt
nmap <M-2> 2gt
imap <M-3> <Esc>3gt
nmap <M-3> 3gt
imap <M-4> <Esc>4gt
nmap <M-4> 4gt
imap <M-5> <Esc>5gt
nmap <M-5> 5gt
imap <M-6> <Esc>6gt
nmap <M-6> 6gt
imap <M-7> <Esc>7gt
nmap <M-7> 7gt
imap <M-8> <Esc>8gt
nmap <M-8> 8gt
imap <M-9> <Esc>9gt
nmap <M-9> 9gt
endif

" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 用 * / # 匹配选中
vnoremap * y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap # y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>



let g:pep8_map='<leader>8' " PEP8 Check
map <leader>f :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""
" 自定义命令
"""""""""""""""""""""""""""""""""""""""
" 删除结尾空格定义
command! -nargs=0 TrimR :%s/\s\+$//g

" 对比原始文件，显示更改处
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif
