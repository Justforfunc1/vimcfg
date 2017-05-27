" \file vimrc config file.
"
" \author allen.l
" \version: 1.1.0
"
" \note i use block to split settings.example:coding settings only set syntax of coding.
" \note code comments explains code of next line.
" \note be attention: don't use map.because map is recursion 


set term=screen
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle
"
" brief help  
" :bundlelist          - list configured bundles  
" :bundleinstall(!)    - install(update) bundles  
" :bundlesearch(!) foo - search(or refresh cache first) for foo   
" :bundleclean(!)      - confirm(or auto-approve) removal of unused bundles  
set nocompatible              " be improved  
set backspace=indent,eol,start
filetype off                  " required!  

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()  

" let vundle manage vundle  
" *** download vundle : git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
Bundle 'lp112124/vimplugin'
Bundle 'L9'  
Bundle 'A.vim'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/molokai'
Bundle 'vim-syntastic/syntastic'
Bundle 'vim-scripts/omnicppcomplete'
"Bundle 'vim-scripts/gdbmgr'
"Bundle 'vim-scripts/doxygentoolkit.vim'
"bundle 'minibufexplorerpp'
"plugin 'tacahiroy/ctrlp-funky'
"plugin 'itchyny/lightline.vim'
"plugin 'hallison/vim-markdown'
"plugin 'jiangmiao/auto-pairs'
"plugin 'ervandew/supertab'
"plugin 'kshenoy/vim-signature'
"plugin 'majutsushi/tagbar'
"plugin 'honza/vim-snippets'
"plugin 'marcweber/vim-addon-mw-utils'
"plugin 'tomtom/tlib_vim'
"plugin 'garbas/vim-snipmate'
"plugin 'vim-scripts/omnicppcomplete'
"plugin 'vim-scripts/vcscommand.vim'

"
" vundle
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my variables
"
"
run plugin/my.vim

filetype on
filetype plugin on

syntax on                  " syntax hightlighting.

let mapleader = "-"
let maplocalleader = ","

let g:mIsIDE = 0
"
" my variables
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set 
"
set number
set wrap
set laststatus=2           
set hls
set incsearch
set foldenable
set autoindent  
set autoindent  
set cindent
set smartindent 
set completeopt=menu,menuone

" shiftwidth,tab,...
set shiftwidth=4
set softtabstop=4
set tabstop=4

" encodings
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" 需要使用gbk时 使用cp936. 但通常而言不推荐。
"set encoding=cp936
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

" statusline: file name,type,path and number of line.
set statusline =Filename:%f\ \ 
set statusline +=Filetype:%y\ \ 
set statusline +=Line:\ %l/%l\ \ 
set statusline +=Filepath:%.25F

set autoread
set autowrite
set nobackup
set noswapfile
set clipboard+=unnamed
set confirm
set history=1000
set linespace=0

set completeopt=menu,longest
set autoindent
set cindent
set noexpandtab
set smarttab
set nocp
" help iskeyword
set iskeyword+=_,$,@,%,#,-


" set option of session.
set sessionoptions-=curdir
set sessionoptions+=sesdir

" set ctags
set tags=tags;	
set tags+=./tags,tags,../tags,../../tags

" set doxygentoolkit"

" set tagslist
let tlist_ctags_cmd = '/usr/bin/ctags'
let tlist_use_right_window = 1
let tlist_file_fold_auto_close = 1
let tlist_show_one_file = 1
let tlist_sort_type = 'name'
let tlist_gainfocus_on_toggleopen = 1
if $vim_hate_space_errors != '0' 
    let c_space_errors=1 
endif 


" set omnicppcomplete
let omnicpp_maycompletedot=1
let omnicpp_maycompletearrow=1
let omnicpp_maycompletescope=1
let omnicpp_namespacesearch=1
let omnicpp_globalscopesearch=1
let omnicpp_defaultnamespace=["std","_glibcxx_std"]
let omnicpp_showprototypeinabbr=1
let omnicpp_selectfirstitem = 2
let omnicpp_displaymode =1

" set nerdtree
let nerdtreewinpos='right'

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap
"
"
noremap <F1> <esc>:A<cr>
noremap <F2> <esc>:cn<cr>
noremap <F3> <esc>:cp<cr>
noremap <F4> <esc>:execute 'CtrlPFunky ' .expand('<cword>')<CR>
noremap <F5> <esc>:call UpdateCscopeInfo()<cr>
noremap <F6> <esc>:call UpdateTags()<cr>
noremap <F7> :bp<cr>
noremap <F8> :bn<cr>
noremap <F9> <esc>:NERDTreeToggle<cr>
noremap <F10> <esc>:call SetCalssComments()<cr>
noremap <F11> <esc>:call SetComments()<cr>
noremap <F12> <esc>
"
"
" set
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"
"
" set
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""">

noremap <leader>q <esc>:wqa<cr>
"
" noremap
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nnoremap
"

nnoremap <leader>/ :nohl<CR>
nnoremap <leader>h : verbose map<cr>

nnoremap <leader>ev : vi $MYVIMRC<cr>
nnoremap <leader>sv : source $MYVIMRC<cr>
nnoremap <leader>c <esc>viwy

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <leader>re <esc>viwpviwy
nnoremap <leader>p <esc>p

""""""" cscope 
nnoremap <leader>fs :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fg :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fc :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ft :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fe :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ff :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>fi :cs find i <C-R>=expand("<cfile>")<CR><CR>
nnoremap <leader>fd :cs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>cw :cw <CR>

"
" nnoremap
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" inoremap
"
inoremap jk <esc> 
"inoremap )()<Esc>i          
"inoremap (()<Esc>i  
"inoremap {{}<Esc>i  
"inoremap }{}<Esc>i  
"inoremap [[]<Esc>i  
"inoremap ][]<Esc>i  
"inoremap <<><Esc>i  
"inoremap ><><Esc>i  
"inoremap """<Esc>i  
"inoremap '''<Esc>i 

"
" inoremap
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vnoremap
"
vnoremap jk <esc> 
"
" vnoremap
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" augroup
"
augroup Global_settings
	autocmd!
    autocmd InsertLeave * se nocul
    autocmd InsertEnter * se cul

	autocmd VimEnter * call Initialization()
augroup END

augroup SetMyFileType
	autocmd!
    autocmd BufNewFile,BufRead (*.(c|h|hpp|sh|lua)) setfiletype=corplus
augroup END

augroup SCRIPT_Group
	autocmd!
    autocmd BufNewFile,BufRead *.sh setfiletype=shell
    autocmd BufNewFile,BufRead *.lua setfiletype=lua
	autocmd BufNewFile *.sh,*.lua execute ":call DefineScriptFile()"
augroup END

augroup C_and_CPP_Group
	autocmd!
    autocmd BufNewFile,BufRead *.c,*.h setfiletype=c
    autocmd BufNewFile,BufRead *.cc,*.h setfiletype=cc
    autocmd BufNewFile,BufRead *.cpp,*.hpp setfiletype=cpp
    " SetTitle function: Add file contents automatically
    autocmd BufNewFile *.hpp,*.cpp,*.h,*.c,*cc execute ":call SetTitle()"
    autocmd BufNewFile *.hpp,*.h execute ":call DefineHeadFile()"
    autocmd BufNewFile *.cpp,*.c,*cc execute ":call DefineCppFile()"

    "autocmd FileType c,cpp :iabbrev if if(){<CR>;<CR>}<esc>kk0f(a
    "autocmd FileType c,cpp :iabbrev if( if(){<CR>;<CR>}<esc>kk0f(a
    "autocmd FileType c,cpp :iabbrev for for(){<CR>;<CR>}<esc>kk0f(a
    "autocmd FileType c,cpp :iabbrev for( for(){<CR>;<CR>}<esc>kk0f(a
    "autocmd FileType c,cpp :iabbrev while while(){<CR>;<CR>}<esc>kk0f(a
    "autocmd FileType c,cpp :iabbrev while( while(){<CR>;<CR>}<esc>kk0f(a
    "autocmd FileType c,cpp :iabbrev printf printf("");<esc>0f"a
    autocmd FileType c,cpp,cc :set omnifunc=ccomplete#Complete;
    autocmd FileType c,cpp,cc :set omnifunc=omni#cpp#complete#Main
augroup END	

"
" augroup
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin : cscope
"
" used quickfix to display cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
" used to add cscope.out
"set nocscopeverbose
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	cs add $CSCOPE_DBendif
	set csverb
	endif
endif

" plugin : cscope
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Add Winmanager
"let g:winManagerWindowLayout='FileExplorer'

"
" plugin : minibufexplorerpp
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin : molokai
"
if !has('gui_running')
    set t_Co=256
endif
colorscheme molokai
set laststatus=2
"
" plugin : molokai
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin : ctrlp-funky
"
let g:ctrlp_funky_matchtype = 'path' 
let g:ctrlp_extensions = ['funky']  
let g:ctrlp_funky_syntax_highlight = 1
"
" plugin : ctrlp-funky
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
