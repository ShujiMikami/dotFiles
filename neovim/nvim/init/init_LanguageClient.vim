let s:pyls_path = fnamemodify(g:python3_host_prog, ':h') . '/'. 'pyls'
let s:clangd_path = '$HOME/dotFiles/.cache/Applications/llvm/clang+llvm-12.0.0-x86_64-apple-darwin/bin/clangd'

let g:LanguageClient_serverCommands = {
	\ 'c':[expand(s:clangd_path)],
	\ 'cpp':[expand(s:clangd_path)],
  \ 'python':[expand(s:pyls_path)],
  \ 'tex':['$HOME/dotFiles/.cache/Applications/texlab/texlab']
	\}
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_hasSnippetSupport = 0


nnoremap <SPACE>h :call LanguageClient#textDocument_hover()<CR>
nnoremap <SPACE>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <SPACE>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <SPACE>f :call LanguageClient#textDocument_formatting()<CR>
