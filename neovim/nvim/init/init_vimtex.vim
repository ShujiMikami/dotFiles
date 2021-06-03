"texのファイルタイプをlatexで認識
let g:tex_flavor = "latex"

let s:nvr_path = fnamemodify(g:python3_host_prog, ':h') . '/'. 'nvr'

autocmd FileType tex setlocal completefunc=omnifunc

if has('mac')
  let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
  let g:vimtex_view_general_options = '@line @pdf @tex'
  let g:vimtex_view_method='skim'
endif
if has('win32')||has('win64')
  let g:vimtex_view_general_viewer = '"C:\Program Files\SumatraPDF\SumatraPDF.exe"'
  let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
  let g:vimtex_view_general_options_latexmk = '-reuse-instance'
endif
let g:vimtex_compiler_progname = expand(s:nvr_path)

function! SetServerName()
  if has('win32')
    let nvim_server_file = $TEMP . "/nvimsocket"
  else
    let nvim_server_file = "/tmp/nvimsocket"
  endif
  let cmd = printf("echo %s > %s", v:servername, nvim_server_file)
  call system(cmd)
endfunction

augroup vimtex_common
  autocmd!
  autocmd FileType tex call SetServerName()
augroup END

