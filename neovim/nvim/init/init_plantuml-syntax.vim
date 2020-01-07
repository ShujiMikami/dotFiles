if has("win32") || has("win64")
  au FileType plantuml command! OpenUml :! start chrome % 
else
  au FileType plantuml command! OpenUml :! open -a "Google Chrome" % 
endif


