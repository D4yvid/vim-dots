vim9script

var GruvboxPurpleColor = synIDattr(synIDtrans(hlID('GruvboxPurple')), 'fg', 'gui')
var Bg1Color = synIDattr(synIDtrans(hlID('GruvboxBg1')), 'fg', 'gui')

var Mode2StatusStr = {
	'n':	"%#StatusLineNC# NOR %#StatusLine#",
	'no':	"%#StatusLineNC# NOR %#StatusLine#",
	'nov':	"%#StatusLineNC# NOR %#StatusLine#",
	'noV':	"%#StatusLineNC# NOR %#StatusLine#",
	'no':	"%#StatusLineNC# NOR %#StatusLine#",
	'niI':	"%#StatusLineNC# NOR %#StatusLine#",
	'niR':	"%#StatusLineNC# NOR %#StatusLine#",
	'niV':	"%#StatusLineNC# NOR %#StatusLine#",
	'ce':	"%#StatusLineNC# NOR %#StatusLine#",
	'v':	"%#Visual# VIS %#StatusLine#",
	'vs':	"%#Visual# VIS %#StatusLine#",
	'V':	"%#Visual# VIS %#StatusLine#",
	'Vs':	"%#Visual# VIS %#StatusLine#",
	'':	"%#Visual# VIS %#StatusLine#",
	's':	"%#Visual# VIS %#StatusLine#",
	's':	"%#Visual# SEL %#StatusLine#",
	'S':	"%#Visual# SEL %#StatusLine#",
	'':	"%#Visual# SEL %#StatusLine#",
	'i':	"%#DiffAdd# INS %#StatusLine#",
	'ic':	"%#DiffAdd# INS %#StatusLine#",
	'ix':	"%#DiffAdd# INS %#StatusLine#",
	'R':	"%#DiffDelete# REP %#StatusLine#",
	'Rc':	"%#DiffDelete# REP %#StatusLine#",
	'Rx':	"%#DiffDelete# REP %#StatusLine#",
	'Rvc':	"%#DiffDelete# REP %#StatusLine#",
	'Rvx':	"%#DiffDelete# REP %#StatusLine#",
	'cv':	"%#WarningMsg# EXM %#StatusLine#",
	'r':	"%#WarningMsg# PNL %#StatusLine#",
	'rm':	"%#WarningMsg# CAT %#StatusLine#",
	'r?':	"%#WarningMsg# Y/N %#StatusLine#",
	'!':	"%#DiffText# BSH %#StatusLine#",
	'c':	"%#QuickFixLine# CMD %#StatusLine#",
	'ct':	"%#PmenuSel# TTY %#StatusLine#",
	'nt':	"%#PmenuSel# TTY %#StatusLine#",
	't':	"%#PmenuSel# TTY %#StatusLine#",
}

var Filetype2StatusStr = {
	c: ' C',
	cpp: '󰙲 C++',
	vim: ' VimScript',
	python: ' Python',
	javascript: '󰌞 JavaScript',
	typescript: '󰛦 TypeScript',
	java: ' Java',
	sh: ' Shell',
	bash: '󱆃 Bash',
	yuck: '󰜬 Yuck',
	css: ' CSS',
	scss: ' Sass',
	html: ' HTML',
	dart: ' Dart',
	php: ' PHP',
	lua: ' Lua',
	make: ' Make',
	asm: ' Assembly',
	's-asm': ' Assembly'
}

exec $"hi NERDTreeStatusLineBaseColor guibg={GruvboxPurpleColor} guifg={Bg1Color}"

def g:AtNerdTree()
	setlocal statusline=%#NERDTreeStatusLineBaseColor#\ at\ %{getcwd()}\ 
enddef

def g:GetCurrentMode(): string
	return Mode2StatusStr->get(mode(), "%#StatusLineNC# ??? %#StatusLine#")
enddef

def g:GetFileType(): string
	var ft = &filetype
	var ftStr = Filetype2StatusStr->get(ft, ' ' .. ft)

	return $"%#PmenuThumb# {ftStr} %#StatusLine#"
enddef

def g:GetLspServer(): string
	if !exists('g:lsp#buffer#CurbufGetServer')
		return ""
	endif

	var server = g:lsp#buffer#CurbufGetServer()

	if server->empty()
		return ""
	endif

	var bufferDiags = lsp#diag#DiagsGetErrorCount(bufnr())
	var diags = ""

	if bufferDiags.Error > 0
		diags ..= $"%#DiffDelete#  {bufferDiags.Error} %#StatusLine#"
	endif

	if bufferDiags.Hint > 0 || bufferDiags.Info > 0
		diags ..= $"%#DiffChange#  {bufferDiags.Hint + bufferDiags.Info} %#StatusLine#"
	endif

	if bufferDiags.Warn > 0
		diags ..= $"%#DiffText#  {bufferDiags.Warn} %#StatusLine#"
	endif

	return $"{diags}%#StatusLineNC# 󰣖 {server.name} %#StatusLine#"
enddef

set statusline=%{%g:GetCurrentMode()%}%=
set statusline+=%f%=
set statusline+=%{%g:GetLspServer()%}
set statusline+=%{%g:GetFileType()%}

au FileType nerdtree call g:AtNerdTree()

