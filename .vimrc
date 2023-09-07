vim9script

# Disable loading of everything that we will not use
set nocp

var VIM_CONFIG_PATH = expand("$HOME/.config/vim")
var VIM_STARTUP_SCRIPT = expand(VIM_CONFIG_PATH .. "/Init.vim")

if !isdirectory(VIM_CONFIG_PATH) || !filereadable(VIM_STARTUP_SCRIPT)
	echo $"Could not find {VIM_STARTUP_SCRIPT}, please check if the file was installed properly."
	finish
endif

exec $"source {VIM_STARTUP_SCRIPT}"
