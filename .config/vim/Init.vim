vim9script

import "./PluginManager.vim" as PluginManager
import "./Editor.vim" as Editor

filetype on

PluginManager.Init()

PluginManager.AddPlugin("yegappan/lsp", { autoload: true, mod: 'lsp' })
PluginManager.AddPlugin("vimwiki/vimwiki", { autoload: false })
PluginManager.AddPlugin("morhetz/gruvbox", { autoload: false })
PluginManager.AddPlugin("preservim/nerdtree", { autoload: false })
PluginManager.AddPlugin("akielaries/vim-s-asm", { autoload: false })
PluginManager.AddPlugin("Yggdroot/indentLine", { autoload: false })
PluginManager.AddPlugin("sheerun/vim-polyglot", { autoload: true, mod: 'vim-polyglot' })
PluginManager.AddPlugin("LunarWatcher/auto-pairs", { autoload: true, mod: 'auto-pairs' })
PluginManager.AddPlugin("tpope/vim-surround", { autoload: true, mod: 'vim-surround' })
PluginManager.AddPlugin("PhilRunninger/nerdtree-visual-selection", { autoload: true, mod: 'nerdtree-visual-selection' })
PluginManager.AddPlugin("junegunn/fzf", { autoload: true, mod: 'fzf' })
PluginManager.AddPlugin("junegunn/fzf.vim", { autoload: true, mod: 'fzf.vim' })

PluginManager.Install()

au VimEnter * Editor.Init()

