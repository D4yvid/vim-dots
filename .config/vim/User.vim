vim9script

set scrolloff=8
set sidescrolloff=16

def g:OnVimWiki()
	setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	setlocal concealcursor=nc
	setlocal conceallevel=2
	setlocal nonumber nocursorline

	chdir ~/Documents/Notes
enddef

au FileType vimwiki call g:OnVimWiki()
