"=============================================================================
" init.vim --- Entry file for neovim
"=============================================================================

set nu
set tabstop=4           " 设置制表符(tab键)的宽度   
set softtabstop=4       " 设置软制表符的宽度
set shiftwidth=4        " 缩进使用的4个空格  
set expandtab           " 用space替代tab的输入
set nocompatible        " 不要使用vi的键盘模式，而是vim自己的
set syntax=on           " 语法高亮
set noeb                " 去掉输入错误的提示声音
set confirm             " 在处理未保存或只读文件的时候，弹出确认
set autoindent          " 自动缩进
set cindent
set noswapfile          "禁止产生swp文件

call plug#begin('~/.vim/plugged')               
"Plug 'ervandew/supertab'
Plug 'vim-scripts/minibufexpl.vim' 
Plug 'vim-scripts/taglist.vim' 
Plug 'vim-scripts/a.vim' 
Plug 'majutsushi/tagbar' "taglist的增强版，查看标签，依赖于ctags
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'dense-analysis/ale'
Plug 'crusoexia/vim-monokai'
Plug 'preservim/nerdtree'
Plug 'peterhoeg/vim-qml'
Plug 'octol/vim-cpp-enhanced-highlight' "对c++语法高亮增强
Plug 'brgmnn/vim-opencl'
Plug 'bfrg/vim-cuda-syntax' 
Plug 'tikhomirov/vim-glsl'
Plug 'crucerucalin/qml.vim'
Plug 'vhdirk/vim-cmake'
Plug 'Rykka/riv.vim'        "reStructuredText 
Plug 'ludovicchabant/vim-gutentags' 
Plug 'mhinz/vim-signify'
Plug 'skywind3000/asyncrun.vim'
Plug 'Shougo/echodoc.vim' 
Plug 'Yggdroot/LeaderF'
Plug 'rhysd/vim-clang-format'
Plug 'babaybus/DoxygenToolkit.vim' 

call plug#end()

source ~/.vim/setup/keymap.vim
source ~/.vim/setup/asyncrun.vim
source ~/.vim/setup/leaderf.vim
source ~/.vim/setup/coc-nvim.vim

"=============================================================================
" vim-monokai setting
"=============================================================================
"colo monokai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-gutentags setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

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
let Tlist_Auto_Open=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar setting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_left = 1
let g:tagbar_width = max([25, winwidth(0) / 6])

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"signify setting 修改比较
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set signcolumn=no


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Fold setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldmethod=syntax " 用语法高亮来定义折叠
set foldmethod=indent " 通过缩进定义折叠
set foldlevel=100 " 启动vim时不要自动折叠代码    
set foldcolumn=3  "设置折叠栏宽度


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"QuickFix setting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按下F5，执行make 
map <f5> :wa<CR>:AsyncRun make -C build -j8 <CR>
" 按下F6，执行make clean 
map <F6> :wa<CR>:AsyncRun make clean -C build -j8 <CR>
"按下F8，光标移到上一个错误所在的行   
map <F8> :cp<CR>    
"按下F9，光标移到下一个错误所在的行  
map <F9> :cn<CR>    
"以上的映射是使上面的快捷键在插入模式下也能用  


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"signify setting 修改比较
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set signcolumn=no


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"LeaderF setting 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-n> :LeaderfBuffer<cr>
noremap <m-m> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *.cpp/*.h 快速切换
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" autocmd VimEnter * NERDTree
let NERDTreeWinPos="right"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ALE setting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"keep the sign gutter open
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
 
let g:airline#extensions#ale#enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-J> <Plug>(ale_next_wrap)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Deoplete setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Neocomplcache setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1


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
" DoxygenToolkit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:DoxygenToolkit_authorName="guojun.huang"
