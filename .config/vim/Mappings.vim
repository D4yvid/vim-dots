vim9script

g:mapleader = ' '

nnoremap <leader>e <cmd>NERDTree<CR>
nnoremap <leader>f <cmd>Files<CR>

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

inoremap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
snoremap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

inoremap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
snoremap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

inoremap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : pumvisible() ? "\<C-n>" : "\<Tab>"
snoremap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
inoremap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : pumvisible() ? "\<C-p>" : "\<S-Tab>"
snoremap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

nnoremap <silent>K <cmd>LspHover<CR>
nnoremap <silent>gd <cmd>LspGotoDefinition<CR>
nnoremap <silent>gD <cmd>LspGotoDeclaration<CR>
nnoremap <silent>gt <cmd>LspGotoTypeDef<CR>
nnoremap <silent>gi <cmd>LspGotoImpl<CR>
nnoremap <silent><leader>d <cmd>LspDiagCurrent<CR>
nnoremap <silent><leader>ie <cmd>LspInlayHints enable<CR>
nnoremap <silent><leader>id <cmd>LspInlayHints enable<CR>
nnoremap <silent><leader><leader> <cmd>LspCodeAction<CR>
nnoremap <silent><A-Left> <cmd>LspDiagPrev<CR>
nnoremap <silent><A-Right> <cmd>LspDiagNext<CR>
nnoremap <silent><leader>r <cmd>LspSwitchSourceHeader<CR>

