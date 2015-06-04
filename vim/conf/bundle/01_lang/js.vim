""-------------------------------------------------------------------------------
"" javascript用
""-------------------------------------------------------------------------------
" この設定入れるとshiftwidthを1にしてインデントしてくれる
let g:SimpleJsIndenter_BriefMode = 1
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1
au FileType javascript call JavaScriptFold()
let g:jscomplete_use = ['dom', 'moz', 'es6th']
" このようにするとjshintを必ず使ってチェックしてくれるようになる
let g:syntastic_javascript_checker = "jshint"
