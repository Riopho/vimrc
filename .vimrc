set nocompatible              " be iMproved, required
filetype off                  " required

let g:mapleader=' '

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 插件管理
Plugin 'VundleVim/Vundle.vim'

" 自动补全
Plugin 'Valloric/YouCompleteMe'
"nmap <Leader>jd :YcmCompleter GoTo<CR>
nmap <Leader>vd <c-W><c-V>:YcmCompleter GoTo<CR>
nmap <Leader>sd <c-W><c-S>:YcmCompleter GoTo<CR>
nmap <Leader>dj :YcmCompleter GoTo<CR>
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_warning_symbol = ':('
let g:ycm_error_symbol = '!!'
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_max_num_candidates = 8
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0

" 括号匹配
Plugin 'vim-scripts/delimitMate.vim'
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
inoremap { {<CR>}<ESC>O

" YCM配置自动生成
Plugin 'rdnetto/YCM-Generator'

" 配色
Plugin 'guns/xterm-color-table.vim'

" 文件模糊查找
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_by_filename = 0
let g:ctrlp_map = '<Leader>r'
let g:ctrlp_working_path_mode = 'ra'

" 状态栏增强
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_section_z=''
let g:airline_section_y=''
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

" tag增强
Plugin 'majutsushi/tagbar'
nmap <Leader>t :TagbarToggle<CR>

" 文件树
Plugin 'scrooloose/nerdtree'
map <Leader>f :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

" 代码片段插入
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" 注释
Plugin 'scrooloose/nerdcommenter'
map <Leader>ci :call NERDComment(0, 'invert')<CR>
let g:NERDCreateDefaultMappings = 0

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let &termencoding=&encoding
set fileencodings=utf-8,gbk,GB2312

" set encoding=utf8,utf-8
set helplang=cn
set number

" tab 为 4 格
set tabstop=4
set shiftwidth=4
set expandtab

" C/C++ 设置相关
syntax on
set autoindent
set cindent
set showmatch

" 退格键
set backspace=indent,eol,start

" 搜索时高亮 : hls = high light search
set hls

" 不创建备份文件
set nobackup
set nowritebackup

" 不创建临时文件
set noswapfile

" 如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Exit_OnlyWindow = 1 
" 在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Window = 1 

let g:winManagerWindowLayout='TagList|FileExplorer'

syntax enable
set t_Co=256
set background=dark

" 主题
colorscheme desert_rio

" cscope use quickfix
set cscopequickfix=s-,g-,c-,d-,i-,t-,e-,f-
nmap <Leader>dk :cs find g <c-R><c-W><CR> 

" 刷新显示 取消搜索高亮
nnoremap <silent> <C-p> :<C-u>nohlsearch<CR>

" 缓冲区 quickfixlist locatelist跳转
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>
nnoremap <C-k> :cp<CR>
nnoremap <C-j> :cn<CR>
nnoremap <Leader>k :lp<CR>
nnoremap <Leader>j :lne<CR>

set wildignore=cscope.*,*.o,*.so,*.a,*.obj,Makefile,makefile,lua,luac

" alias grep
set grepprg=grep\ -nr\ --exclude-dir=\.svn\ --exclude=*\.o\ --exclude=tags

" vimrc配置分项目管理
auto bufread /home/rio/lua-5.1.5/src/* so /home/rio/lua-5.1.5/src/.vimrc
auto bufread /home/rio/trunk/* so /home/rio/trunk/.vimrc
