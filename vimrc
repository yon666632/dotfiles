syntax on

set runtimepath+=~/.vim/
runtime! conf/*.vim
runtime! conf/bundle/00_util/*.vim
runtime! conf/bundle/01_lang/*.vim
runtime! conf/local/*.vim

"""-------------------------------------------------------------------------------
""" simplenote系
"""-------------------------------------------------------------------------------
""if filereadable(expand('~/.simplenoterc'))
""    source ~/.simplenoterc
""endif

