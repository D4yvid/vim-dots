vim9script

g:mapleader = ' '

nmap <leader>e <cmd>NERDTree<CR>
nmap <leader>f <cmd>Files<CR>

imap <expr><silent><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr><silent><S-Tab> pumvisible() ? "\<C-s>" : "\<S-Tab>"

imap <expr><silent><C-e> pclose
imap <expr><silent><CR> pumvisible() ? "\<C-y>\<C-e>" : "\<CR>"

nmap <silent>K <cmd>LspHover<CR>
nmap <silent>gd <cmd>LspGotoDefinition<CR>
nmap <silent>gD <cmd>LspGotoDeclaration<CR>
nmap <silent>gt <cmd>LspGotoTypeDef<CR>
nmap <silent>gi <cmd>LspGotoImpl<CR>
nmap <silent><leader><leader> <cmd>LspCodeAction<CR>
nmap <silent><A-Left> <cmd>LspDiagPrev<CR>
nmap <silent><A-Right> <cmd>LspDiagNext<CR>

