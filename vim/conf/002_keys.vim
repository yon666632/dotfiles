"insertモード時のESCをリマップ
inoremap <c-[> <esc>

"x キー削除でデフォルトレジスタに入れない
nnoremap x "_x
vnoremap x "_x

"vv で行末まで選択
vnoremap v ^$h

"emacs like
map! <c-a> <home>
map! <c-e> <end>
nnoremap <c-a> <home>
nnoremap <c-e> <end>

"画面切り替え
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

