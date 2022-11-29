let g:deoplete#enable_at_startup = 1
call deoplete#custom#option("auto_complete_delay", 0)
call deoplete#custom#option("min_pattern_length", 3)
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_reflesh_always = 0
call deoplete#custom#option("smart_case", 0)
call deoplete#custom#var("file", "enable_buffer_path", 1)
call deoplete#custom#option("max_list", 1000)

"File type
autocmd FileType c setlocal omnifunc=LanguageClient#complete
autocmd FileType cpp setlocal omnifunc=LanguageClient#complete
autocmd FileType plantuml setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType tex setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType python setlocal omnifunc=LanguageClient#complete
"autocmd FileType dart setlocal omnifunc=LanguageClient#complete
autocmd FileType dart setlocal omnifunc=v:lua.vim.lsp.omnifunc

set completeopt+=noselect

"if !exists('g:deoplete#sources#omni#input_patterns')
"  let g:deoplete#omni_patterns = {}
"endif

call deoplete#custom#option('omni_patterns', {
  \ 'plantuml': '\<\%(\l\|@\)\w*',
  \ 'tex': '\\\a*',
  \})
