vim9script

import "./PluginManager.vim" as PluginManager
import "./Editor.vim" as Editor

const CONFIG_PATH = has("win32") ? expand("~/vimconfig") : expand("~/.config/vim")

filetype on

PluginManager.Init()

PluginManager.AddPlugin("neoclide/coc.nvim", { branch: 'release', autoload: true, mod: 'coc.nvim' })
PluginManager.AddPlugin("vimwiki/vimwiki", { autoload: false })
PluginManager.AddPlugin("morhetz/gruvbox", { autoload: false })
PluginManager.AddPlugin("preservim/nerdtree", { autoload: false })
PluginManager.AddPlugin("akielaries/vim-s-asm", { autoload: true, rt: 'syntax/s-asm.vim' })
PluginManager.AddPlugin("Yggdroot/indentLine", { autoload: false })
PluginManager.AddPlugin("sheerun/vim-polyglot", { autoload: true, mod: 'vim-polyglot' })
PluginManager.AddPlugin("LunarWatcher/auto-pairs", { autoload: true, mod: 'auto-pairs' })
PluginManager.AddPlugin("tpope/vim-surround", { autoload: true, mod: 'vim-surround' })
PluginManager.AddPlugin("PhilRunninger/nerdtree-visual-selection", { autoload: true, mod: 'nerdtree-visual-selection' })
PluginManager.AddPlugin("junegunn/fzf", { autoload: true, mod: 'fzf' })
PluginManager.AddPlugin("junegunn/fzf.vim", { autoload: true, mod: 'fzf.vim' })
PluginManager.AddPlugin("tpope/vim-commentary", { autoload: true, mod: 'vim-commentary' })

exec $"source {CONFIG_PATH}/Plugins/Coc.vim"

PluginManager.Install()

au BufRead,BufEnter,BufNew *.S setlocal ft=s-asm
au BufRead,BufEnter,BufNew *.asm setlocal ft=nasm

Editor.Init()

