let s:pyls_path = fnamemodify(g:python3_host_prog, ':h') . '/'. 'pyls'
let g:LanguageClient_serverCommands = {
	\ 'c':['clangd'],
	\ 'cpp':['clangd'],
  \ 'python':[expand(s:pyls_path)]
	\}
let g:LanguageClient_autoStart = 1
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_hasSnippetSupport = 0


nnoremap <SPACE>h :call LanguageClient#textDocument_hover()<CR>
nnoremap <SPACE>d :call LanguageClient#textDocument_definition()<CR>
nnoremap <SPACE>r :call LanguageClient#textDocument_rename()<CR>
nnoremap <SPACE>f :call LanguageClient#textDocument_formatting()<CR>
