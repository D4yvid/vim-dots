vim9script

g:mapleader = ' '

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : coc#jumpable() ? "\<cmd>call coc#snippet#next()\<CR>" : "\<Tab>"
vnoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : coc#jumpable() ? "\<cmd>call coc#snippet#next()\<CR>" : "\<Tab>"
snoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : coc#jumpable() ? "\<cmd>call coc#snippet#next()\<CR>" : "\<Tab>"

inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : coc#jumpable() ? "\<cmd>call coc#snippet#prev()\<CR>" : "\<Tab>"
vnoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : coc#jumpable() ? "\<cmd>call coc#snippet#prev()\<CR>" : "\<Tab>"
snoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : coc#jumpable() ? "\<cmd>call coc#snippet#prev()\<CR>" : "\<Tab>"

inoremap <silent><expr> <c-@> coc#refresh()

nnoremap <leader>e <cmd>NERDTree<CR>
nnoremap <leader>f <cmd>Files<CR>

nnoremap <silent>K   <cmd>silent! call CocActionAsync("doHover")<CR>
nnoremap <silent>gd  <Plug>(coc-definition)
nnoremap <silent>gt  <Plug>(coc-type-definition)
nnoremap <silent>gi  <Plug>(coc-implementation)
nnoremap <silent>gr  <Plug>(coc-references)
nnoremap <silent><leader><leader> <Plug>(coc-code-action)
nnoremap <silent><A-Left> <Plug>(coc-diagnostic-prev)
nnoremap <silent><A-Right> <Plug>(coc-diagnostic-next)
nnoremap <silent><leader>r <cmd>CocCommand clangd.switchSourceHeader<CR>

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

