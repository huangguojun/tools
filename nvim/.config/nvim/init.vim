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
set autoindent          " 自动`:w缩进
set cindent
set noswapfile          " 禁止产生swp文件

call plug#begin('~/.config/nvim/plugged')               

Plug 'vim-scripts/minibufexpl.vim' 
Plug 'vim-scripts/a.vim' 
Plug 'majutsushi/tagbar' 
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'dense-analysis/ale'
Plug 'crusoexia/vim-monokai'
Plug 'preservim/nerdtree'
Plug 'peterhoeg/vim-qml'
Plug 'octol/vim-cpp-enhanced-highlight' 
Plug 'brgmnn/vim-opencl'
Plug 'bfrg/vim-cuda-syntax' 
Plug 'tikhomirov/vim-glsl'
Plug 'crucerucalin/qml.vim'
Plug 'vhdirk/vim-cmake'
Plug 'Rykka/riv.vim'    "reStructuredText 
Plug 'ludovicchabant/vim-gutentags' 
Plug 'mhinz/vim-signify'
Plug 'skywind3000/asyncrun.vim'
Plug 'Shougo/echodoc.vim' 
Plug 'Yggdroot/LeaderF'
Plug 'babaybus/DoxygenToolkit.vim' 
Plug 'voldikss/vim-floaterm'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'hiberabyss/NeovimGdb'

call plug#end()

source ~/.config/nvim/setup/keymap.vim
source ~/.config/nvim/setup/asyncrun.vim
source ~/.config/nvim/setup/leaderf.vim
source ~/.config/nvim/setup/coc-nvim.vim
source ~/.config/nvim/setup/vim-gutentag.vim
source ~/.config/nvim/setup/clang-format.vim


"=============================================================================
" Vim-monokai setting
"=============================================================================
" colo monokai

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar setting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_left = 1
let g:tagbar_width = max([25, winwidth(0) / 9])

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify setting 修改比较
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set signcolumn=no


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fold setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldmethod=syntax " 用语法高亮来定义折叠
set foldmethod=indent " 通过缩进定义折叠
set foldlevel=100 " 启动vim时不要自动折叠代码    
set foldcolumn=0  "设置折叠栏宽度


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QuickFix setting 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按下F5，执行make 
map <f5> :wa<CR>:AsyncRun make -C build -j8 <CR>
" 按下F6，执行make clean 
"map <F6> :wa<CR>:AsyncRun make clean -C build -j8 <CR>
"按下F8，光标移到上一个错误所在的行   
"map <F8> :cp<CR>    
"按下F9，光标移到下一个错误所在的行  
"map <F9> :cn<CR>    
"以上的映射是使上面的快捷键在插入模式下也能用  


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" *.cpp/*.h 快速切换
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <silent> <F12> :A<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MiniBufExplorer
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
" ALE setting

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
" Neocomplcache setting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DoxygenToolkit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:DoxygenToolkit_authorName="guojun.huang"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_width = 0.7
let g:floaterm_height = 0.7

" Set floaterm window's background to black
hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=orange guifg=cyan

