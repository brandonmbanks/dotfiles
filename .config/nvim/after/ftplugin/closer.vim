" enter will select auto completion suggestion
function! HandleCRKey() abort
  return pumvisible() ? "\<C-y>\n" : "\n"
endfunction

inoremap <silent> <CR> <C-R>=HandleCRKey()<CR>
