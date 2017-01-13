" \file vimrc config file.
"
" \author lp112124@163.com
" \note I use block to split settings.Example:coding settings only set syntax of coding.
" \note code comments explains code of next line.
" \note Be attention: don't use map.Because map is recursion 


set term=screen
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"
" Brief help  
" :BundleList          - list configured bundles  
" :BundleInstall(!)    - install(update) bundles  
" :BundleSearch(!) foo - search(or refresh cache first) for foo   
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles  
set nocompatible              " be iMproved  
filetype off                  " required!  

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()  

" let Vundle manage Vundle  
" *** Download vundle : git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
Bundle 'lp112124/vimplugin'
Bundle 'L9'  
Bundle 'A.vim'
"Bundle 'minibufexplorerpp'
Bundle 'kien/ctrlp.vim'
"Plugin 'tacahiroy/ctrlp-funky'
"Plugin 'itchyny/lightline.vim'
"Plugin 'hallison/vim-markdown'
Bundle 'scrooloose/nerdtree'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'ervandew/supertab'
"Plugin 'kshenoy/vim-signature'
"Plugin 'majutsushi/tagbar'
"Plugin 'honza/vim-snippets'
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'vim-scripts/OmniCppComplete'
Bundle 'vim-scripts/molokai'
"Plugin 'vim-scripts/vcscommand.vim'

"
" Vundle
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" my variables
"
"
let mapleader = "-"
let maplocalleader = ","

let g:mIsIDE=0
let g:iswindows=0
"
" my variables
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" header
"
run plugin/my.vim

syntax on                  " syntax hightlighting.

filetype plugin indent on

"
" header
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
" 需要使用GBK时 使用cp936. 但通常而言不推荐。
"set encoding=cp936
set encoding=utf-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

" statusline: file name,type,path and number of line.
set statusline =FileName:%f\ \ 
set statusline +=FileType:%y\ \ 
set statusline +=Line:\ %l/%L\ \ 
set statusline +=FilePath:%.25F

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

" set tagslist
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = 'name'
let Tlist_GainFocus_On_ToggleOpen = 1
if $VIM_HATE_SPACE_ERRORS != '0' 
    let c_space_errors=1 
	endif 
map t :TlistToggle
map o :TlistOpen
map s :ts

" set omnicppcomplete
let OmniCpp_MayCompleteDot=1
let OmniCpp_MayCompleteArrow=1
let OmniCpp_MayCompleteScope=1
let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DefaultNamespace=["std","_GLIBCXX_STD"]
let OmniCpp_ShowPrototypeInAbbr=1
let OmniCpp_SelectFirstItem = 2
let OmniCpp_DisplayMode =1


" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" noremap
"
"
noremap <F1> <esc>:A<CR>
noremap <F2> <esc>:cn<CR>
noremap <F3> <esc>:cp<CR>
noremap <F4> <esc>:call UpdateTags()<CR>
noremap <F5> <esc>:call UpdateCscopeInfo()<CR>
noremap <F6> <esc>
noremap <F7> :bp<cr>
noremap <F8> :bn<cr>
noremap <F9> <esc>:NERDTreeToggle<CR>
noremap <F10> <esc>
noremap <F11> <esc>
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
    autocmd BufNewFile,BufRead (*.(c|h|hpp)) setfiletype=corplus
augroup END

augroup C_and_CPP_Group
	autocmd!
    "autocmd BufNewFile,BufRead *.c,*.h setfiletype c
    autocmd BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp setfiletype cpp
    " SetTitle function: Add file contents automatically
    autocmd BufNewFile *.hpp,*.cpp,*.h,*.c execute ":call SetTitle()"
    autocmd BufNewFile *.hpp,*.h execute ":call DefineHeadFile()"
    autocmd BufNewFile *.cpp,*.c execute ":call DefineCppFile()"

    "autocmd FileType c,cpp :iabbrev if if(){<CR>;<CR>}<esc>kk0f(a
    "autocmd FileType c,cpp :iabbrev if( if(){<CR>;<CR>}<esc>kk0f(a
    "autocmd FileType c,cpp :iabbrev for for(){<CR>;<CR>}<esc>kk0f(a
    "autocmd FileType c,cpp :iabbrev for( for(){<CR>;<CR>}<esc>kk0f(a
    "autocmd FileType c,cpp :iabbrev while while(){<CR>;<CR>}<esc>kk0f(a
    "autocmd FileType c,cpp :iabbrev while( while(){<CR>;<CR>}<esc>kk0f(a
    "autocmd FileType c,cpp :iabbrev printf printf("");<esc>0f"a
    autocmd FileType c,cpp :set omnifunc=ccomplete#Complete;
    autocmd FileType c,cpp :set omnifunc=omni#cpp#complete#Main
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


