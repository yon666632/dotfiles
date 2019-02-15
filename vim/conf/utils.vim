"-------------------------------------------------------------------------------
" utils
"-------------------------------------------------------------------------------
"-------------------------------------------------------------------------------
" 連番ふる
"-------------------------------------------------------------------------------
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let snf=&nf|set nf-=octal|let cl = col('.')|for nc in range(1, <count>?<count>-line('.'):1)|exe 'normal! j' . nc . <q-args>|call cursor('.', cl)|endfor|unlet cl|unlet snf
