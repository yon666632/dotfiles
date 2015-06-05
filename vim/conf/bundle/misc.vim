"============================================================
" 設定が細々数行のみの場合は、ここに書いてしまう
"============================================================
" quickrun用
let g:quickrun_config = {}
let g:quickrun_config = {'*': {'split': ''}}
nnoremap <C-o> :Unite -vertical -no-quit -winwidth=32 outline<Esc>
