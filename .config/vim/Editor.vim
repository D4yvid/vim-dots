vim9script

const CONFIG_PATH = has("win32") ? expand("~/vimconfig") : expand("~/.config/vim")

export def Init()
	syntax on

	exec $"source {CONFIG_PATH}/Mappings.vim"
	exec $"source {CONFIG_PATH}/Options.vim"
	exec $"source {CONFIG_PATH}/StatusLine.vim"
	exec $"source {CONFIG_PATH}/Plugins/NERDTree.vim"
	exec $"source {CONFIG_PATH}/Plugins/VimWiki.vim"

	# Load user-defined options / plugin settings
	silent! exec $"source {CONFIG_PATH}/User.vim"
enddef
