
runtime! debian.vim  
"设置编码  
set encoding=utf-8  
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936  
"set fileencodings=utf-8,ucs-bom,chinese  
set fileencodings=utf-8,chinese,latin1
" set fileencoding=euc-cn


"代码折叠
set foldmethod=indent

"语言设置  
set langmenu=zh_CN.UTF-8 

set nocompatible 
set nocp

set noswapfile      "禁止产生swp文件

if has("syntax")     
syntax on            "语法高亮    
endif  

colorscheme desert    

" detect file type   
filetype on   
filetype plugin on   

"set background=dark 

if  has("autocmd")  
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"have Vim load indentation rules and plugins according to the detected filetype      filetype plugin indent on   
endif   

set autowrite        " 自动把内容写回文件    
set autoindent        " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；
set smartindent        " 智能对齐方式   
set tabstop=4           " 设置制表符(tab键)的宽度   
set softtabstop=4       " 设置软制表符的宽度
set shiftwidth=4        " (自动) 缩进使用的4个空格  
set expandtab           " 用space替代tab的输入

set cindent             " 使用 C/C++ 语言的自动缩进方式   
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s "设置C/C++语言的具体缩进方式    
"set backspace=2     " 设置退格键可用
set showmatch        " 设置匹配模式，显示匹配的括号 
set linebreak        " 整词换行   
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去 
"set hidden          " Hide buffers when they are abandoned 
set mouse=a           " Enable mouse usage (all modes) "使用鼠标   
set number            " Enable line number    "显示行号
"set previewwindow    " 标识预览窗口   
set history=50        " set command history to 50    "历史记录50条    

"--状态行设置--   
set laststatus=2      " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set ruler            " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。

"--命令行设置--  
set showcmd            " 命令行显示输入的命令   
set showmode           " 命令行显示vim当前模式   

"--find setting-- 
set incsearch        " 输入字符串就显示匹配点    
set hlsearch  




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ctags setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按下F5重新生成tag文件，并更新taglist 
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR> 
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>:  TlistUpdate<CR> 
set tags=tags
set tags+=./tags 
set tags+=/usr/include/tags
set tags+=/usr/local/include/tags
set tags+=/usr/include/c++/tags


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"omnicppcomplete setting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"按下F3自动补全代码，注意该映射语句后不能有其他字符，包括tab；
"否则按下F3会自动补全一些乱码
imap <F3> <C-X><C-O>    " 按下F2根据头文件内关键字补全 
imap <F2> <C-X><C-I>    
set completeopt=menu,menuone " 关掉智能补全时的预览窗口
let OmniCpp_MayCompleteDot = 1 " autocomplete with . 
let OmniCpp_MayCompleteArrow = 1 " autocomplete with -> 
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::  
let OmniCpp_SelectFirstItem = 2  " select first item (but don't insert)    
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files 
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window  
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search   
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members    
let OmniCpp_DefaultNamespaces=["std"] 
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column  
let OmniCpp_ShowAccess=1 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist setting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd='ctags'   "因为我们放在环境变量里，所以可以直接执行    
let Tlist_Use_Right_Window=0  "让窗口显示在右边，0的话就是显示在左边 
let Tlist_Show_One_File=0     "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏  
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim    "是否一直处理tags.1:处理;0:不处理   
let Tlist_Process_File_Always=1 "实时更新tags   
let Tlist_Inc_Winwidth=0
let Tlist_Auto_Open=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"WinManager setting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout='FileExplorer|TagList'  "设置我们要管理的插件    
let g:persistentBehaviour=0 "如果所有编辑文件都关闭了，退出vim  
nmap wm :WMToggle<cr> 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fold setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax " 用语法高亮来定义折叠
set foldlevel=100 " 启动vim时不要自动折叠代码    
set foldcolumn=5  "设置折叠栏宽度


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"QuickFix setting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按下F6，执行make clean
map <F6> :make clean<CR><CR><CR>   
"按下F7，执行make编译程序，并打开quickfix窗口，显示编译信息    
"map <F7> :make<CR><CR><CR> 
"map <F7> :make<CR><CR><CR> :copen<CR><CR>  
map <F7> :make<CR><CR><CR> :cc<CR><CR>  
"按下F8，光标移到上一个错误所在的行   
map <F8> :cp<CR>    
"按下F9，光标移到下一个错误所在的行  
map <F9> :cn<CR>    
"以上的映射是使上面的快捷键在插入模式下也能用  


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cscope setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
	cs add cscope.out
		endif
		set csverb
		endif
		nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
		nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
		nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
		nmap <C-@>d :cs find d  <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"添加man窗口
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:source $VIMRUNTIME/ftplugin/man.vim
"c/h 快速切换
nnoremap <silent> <F12> :A<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"MiniBufExplorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
"let g:miniBufExplorerMoreThanOne=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CMake 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:C_UseTool_cmake = 'yes '

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Doxygen 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:C_UseTool_doxygen = 'yes' 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 在 vim 启动的时候默认开启 NERDTree
autocmd VimEnter * NERDTree
" 按下 F2 调出/隐藏 NERDTraee
" map :silent! NERDTreeToggle
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
let NERDTreeWinPos="right"
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
" let NERDTreeShowBookmarks=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clang_Format
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format#style_options = {
               \  "BasedOnStyle" : "WebKit" ,
               \  "PointerAlignment" : "Right",
               \  "IndentWidth" : 4 ,
               \  "MaxEmptyLinesToKeep" : 1 ,
               \  "ObjCSpaceAfterProperty" : "true" ,
               \  "ObjCBlockIndentWidth" : 4 ,
               \  "AllowShortFunctionsOnASingleLine" : "true",
               \  "AllowShortIfStatementsOnASingleLine" : "true",
               \  "AlignTrailingComments" : "true",
               \  "SpacesInSquareBrackets" : "true",
               \  "SpacesInParentheses" : "true",
               \  "AlignConsecutiveDeclarations" : "true",
               \  "AlignConsecutiveAssignments" : "true",
               \  "AccessModifierOffset" : -4,
               \  "AlwaysBreakTemplateDeclarations" : "true",
               \  "SpaceBeforeAssignmentOperators" : "true",
               \  "SpacesInContainerLiterals" : "true",
               \  "IndentWrappedFunctionNames" : "true",
               \  "KeepEmptyLinesAtTheStartOfBlocks" : "true",
               \  "BreakConstructorInitializersBeforeComma" : "true",
               \  "AllowAllParametersOfDeclarationOnNextLine" : "true",
               \  "SpaceAfterCStyleCast" : "true",
               \  "Standard" : "C++11",
               \  "TabWidth": 4,
               \  "UseTab": "Never"}

" map to <Leader>cf in C++ code
" autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
" autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

" if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)

" Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>

"autocmd FileType c,cpp,objc ClangFormatAutoEnable


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
"Plug 'glepnir/spaceline.vim'
call plug#end()
