"=======================================================
" colorscheme
" ------------------------------------------------------
"" colorscheme molokai
"colorscheme tender
"
"syntax on
"" 256色
"set t_Co=256
"" truecolor
"set termguicolors
"" 背景色
"set background=dark
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
colorscheme tender
