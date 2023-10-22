vim9script

g:mapleader = ' '

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <c-@> coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

nnoremap <leader>e <cmd>NERDTree<CR>
nnoremap <leader>f <cmd>Files<CR>

nnoremap <silent>K   <Plug>(coc-hover)
nnoremap <silent>gd  <Plug>(coc-definition)
nnoremap <silent>gt  <Plug>(coc-type-definition)
nnoremap <silent>gi  <Plug>(coc-implementation)
nnoremap <silent>gr  <Plug>(coc-references)
nnoremap <silent><leader><leader> <Plug>(coc-code-action)
nnoremap <silent><A-Left> <Plug>(coc-diagnostic-prev)
nnoremap <silent><A-Right> <Plug>(coc-diagnostic-next)

# nnoremap <silent><leader>r <cmd>LspSwitchSourceHeader<CR>

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

