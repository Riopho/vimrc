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
nnoremap <Leader>vd <c-W><c-V>:YcmCompleter GoTo<CR>
nnoremap <Leader>sd <c-W><c-S>:YcmCompleter GoTo<CR>
nnoremap <Leader>dj :YcmCompleter GoTo<CR>
let g:ycm_collect_identifiers_from_tags_files = 1
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
Plugin 'Shougo/echodoc.vim'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_detect_modified=1
let g:airline_section_z=''
let g:airline_section_y=''
let g:airline_theme='molokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

" tag增强
Plugin 'majutsushi/tagbar'
nnoremap <Leader>t :TagbarToggle<CR>

" 文件树
Plugin 'scrooloose/nerdtree'
noremap <Leader>f :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif


Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<c-j>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'

" 注释
Plugin 'scrooloose/nerdcommenter'
noremap <Leader>ci :call NERDComment(0, 'invert')<CR>
let g:NERDCreateDefaultMappings = 0

" cpp增强
Plugin 'octol/vim-cpp-enhanced-highlight'

" 切换头文件
Plugin 'derekwyatt/vim-fswitch'
nnoremap <Leader>a :FSHere<CR>

" include guard
Plugin 'vim-scripts/headerguard'
noremap <F3> :HeaderguardAdd<cr>

" mark
Plugin 'kshenoy/vim-signature'
nnoremap <Leader>m :SignatureListMarkers<CR>

" 跳转
Plugin 'easymotion/vim-easymotion'

" 包围
Plugin 'tpope/vim-surround'

" 对齐
Plugin 'godlygeek/tabular'

"平滑滚动
"Plugin 'terryma/vim-smooth-scroll'
"noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
"noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
"noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
"noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


" 缩进
"Plugin 'nathanaelkane/vim-indent-guides'
"let g:indent_guides_enable_on_vim_startup = 1 "添加行，vim启动时启用
"let g:indent_guides_start_level = 1           "添加行，开始显示对齐线的缩进级别
"let g:indent_guides_guide_size = 1            "添加行，对齐线的宽度，（1字符）

" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

" F4功能键映射为添加作者信息的快捷键
noremap <F4> ms:call AddTitle()<cr>

set helplang=cn

if exists('*AddTitle')

else
    function AddTitle()

        call append(0,"/*******************************************************************************")
        call append(1," * Author :          rio")
        call append(2," * Email :           riopho@163.com")
        call append(3," * Last modified :   ".strftime("%Y-%m-%d %H:%M"))
        call append(4," * Filename :        ".expand("%:t"))
        call append(5," * Description :     ")
        call append(6," * *****************************************************************************/")
        echohl WarningMsg | echo "Successful in adding the copyright." | echohl None

    endf
endif



" set encoding=utf8,utf-8
set helplang=cn
set number
let &termencoding=&encoding
set fileencodings=utf-8,gbk,GB2312 
"set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

" tab 为 4 格
set tabstop=4
set shiftwidth=4
set expandtab

" C/C++ 设置相关
syntax on
set autoindent
set cindent
set showmatch
set cursorline

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
"colorscheme molokai
"colorscheme phd

" cscope use quickfix
set cscopequickfix=s-,g-,c-,d-,i-,t-,e-,f-
nnoremap <Leader>dk :cs find g <c-R><c-W><CR> 
nnoremap <Leader>ds :cs find t <c-R><c-W><CR> 

"刷新显示 取消搜索高亮
"nnoremap <silent> <C-p> :<C-l>nohlsearch<CR>

" 缓冲区 quickfixlist locatelist跳转
nnoremap <C-l> :bnext<CR>
nnoremap <C-p> :nohlsearch<CR><C-l>
nnoremap <C-h> :bprev<CR>
nnoremap <C-k> :cp<CR>
nnoremap <C-j> :cn<CR>
nnoremap <Leader>k :lp<CR>
nnoremap <Leader>j :lne<CR>

" 防误按
noremap q: :q

noremap H ^
noremap L $
noremap K %

"Show the Subversion 'blame' annotation for the current file, in a narrow
"  window to the left of it.
"Usage:
"  'gb' or ':Blame'
"  To get rid of it, close or delete the annotation buffer.
"Bugs:
"  If the source file buffer has unsaved changes, these aren't noticed and
"    the annotations won't align properly. Should either warn or preferably
"    annotate the actual buffer contents rather than the last saved version.
"  When annotating the same source file again, it creates a new annotation
"    buffer. It should re-use the existing one if it still exists.
"Possible enhancements:
"  When invoked on a revnum in a Blame window, re-blame same file up to the
"    previous revision.
"  Dynamically synchronize when edits are made to the source file.
function s:svnBlame()
   let line = line(".")
   setlocal nowrap
   " create a new window at the left-hand side
   aboveleft 18vnew
   " blame, ignoring white space changes
   %!svn blame -x-w "#"
   setlocal nomodified readonly buftype=nofile nowrap winwidth=1
   setlocal nonumber
   if has('&relativenumber') | setlocal norelativenumber | endif
   " return to original line
   exec "normal " . line . "G"
   " synchronize scrolling, and return to original window
   setlocal scrollbind
   wincmd p
   setlocal scrollbind
   syncbind
endfunction
nnoremap gb :call <SID>svnBlame()<CR>
command Blame call s:svnBlame()


" 快速打开.vimrc
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

"esc
"inoremap <silent> <esc> <nop>
"inoremap <esc>[ <esc>[
inoremap jk <esc>
inoremap kj <esc>

set wildignore=cscope.*,*.o,*.so,*.a,*.obj,Makefile,makefile,lua,luac

" alias grep
set grepprg=grep\ -nr\ --exclude-dir=.svn\ --exclude=\*.o\ --exclude=tags
"
" vimrc配置分项目管理
auto bufread /home/rio/trunk/* so /home/rio/trunk/.vimrc

