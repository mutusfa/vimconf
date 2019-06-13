" Set the filetype based on the file's extension, but only if
" 'filetype' has not already been set
augroup tpp_ft
  au!
  autocmd BufNewFile,BufRead *.tpp   set syntax=cpp
augroup END
