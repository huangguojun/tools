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

