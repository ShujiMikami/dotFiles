if has("win32") || has("win64")
  au FileType plantuml command! OpenUml :! start chrome --allow-file-access-from-files %:p 
else
  au FileType plantuml command! OpenUml :! open -a "Google Chrome" % 
endif


