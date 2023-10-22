vim9script

const CONFIG_PATH = has("win32") ? expand("~/vimconfig") : expand("~/.config/vim")

g:coc_config_home = CONFIG_PATH .. '/Coc'
