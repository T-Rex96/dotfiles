let mapleader = ' '
let maplocalleader = ' '

call plug#begin('~/.vim/plugged')

" {{{ colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'dylanaraps/wal'
" }}}

" {{{ vim-highlightedyank
Plug 'machakann/vim-highlightedyank'
map y <Plug>(highlightedyank)
" }}}

" {{{ vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

set laststatus=2
set noshowmode
let g:airline_powerline_fonts=1
let g:ariline_symbols_ascii=1
set ttimeoutlen=10
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled=1
" }}}

" vim-fugitive {{{
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'

map <silent> <leader>gs :Gstatus<cr> 
map <silent> <leader>gb :Gblame<cr> 
" }}}

Plug 'vim-scripts/vim-auto-save'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/ReplaceWithRegister'

Plug 'termhn/i3-vim-nav'

Plug 'junegunn/vim-peekaboo'

" {{{ ack.vim (Configured to use rg)
Plug 'mileszs/ack.vim'
" Use ripgrep with ack.vim
let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1
let g:ackhighlight = 1
" The exclamation mark means don't jump to first match
nnoremap <Leader>/ :Ack!<Space>
"}}}

Plug 'peterhoeg/vim-qml'
Plug 'arkbriar/vim-qmake'

" {{{ vim-lsp-cxx-highlight
Plug 'jackguo380/vim-lsp-cxx-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
" }}}

Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-repeat'

" {{{ vim-commentary
Plug 'tpope/vim-commentary'
"Matlab comments
autocmd FileType matlab setlocal commentstring=%\ %s
"Gnuplot comments
autocmd FileType gnuplot setlocal commentstring=#\ %s
"C++ comments
autocmd FileType cpp setlocal commentstring=//\ %s
" }}}


" {{{ vim-dispatch
Plug 'tpope/vim-dispatch'
map <leader>cd :Copen<CR>/error:<CR>
map <leader>m :wa<CR>:Make<CR>
map <leader>M :wa<CR>:Make!<CR>
" }}}

Plug 'airblade/vim-gitgutter'

" {{{ vim-sneak
Plug 'justinmk/vim-sneak'
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
" }}}

" {{{ ultisnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<C-space>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" }}}

Plug 'tommcdo/vim-exchange'

" {{{ vim-easy-align
Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" {{{ fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

map <silent> <leader>f :GFiles --recurse-submodules <cr> 
map <silent> <leader>zf :Files<cr>
map <silent> <leader>zb :Buffers<cr>
map <silent> <leader>zm :Marks<cr>
map <silent> <leader>zl :Lines<cr>
map <silent> <leader>zg :Rg<cr>

" CTRL-a CTRL-q to select all and build quickfix list (https://github.com/junegunn/fzf.vim/issues/185)
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
" }}}

" {{{ Vista.vim
Plug 'liuchengxu/vista.vim'
let g:vista_fzf_preview = ['right:50%']
let g:vista_sidebar_width = 50

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:vista_executive_for = {
  \ 'cpp': 'coc',
  \ }

map <leader>v :Vista!!<CR>
" }}}

" {{{ undotree
Plug 'mbbill/undotree'
"toggle undotree
map <leader>uu :UndotreeToggle<cr>
map <leader>uf :UndotreeFocus<cr>
" }}}

Plug 'habamax/vim-asciidoctor'
Plug 'aklt/plantuml-syntax'

" {{{ Text ojects
Plug 'kana/vim-textobj-user'
Plug 'https://github.com/vim-scripts/argtextobj.vim'
Plug 'bps/vim-textobj-python'
Plug 'glts/vim-textobj-comment' "ic and ac, this has to be loaded AFTER textobj-python, since that one also defines ic ac for python classes!
" }}}

Plug 'triglav/vim-visual-increment'

" {{{ Folding
Plug 'Konfekt/FastFold'
"toggle folds
map <leader><leader> zA

autocmd Filetype vim set foldmethod=marker
" }}}

" :XtermColorTable
Plug 'guns/xterm-color-table.vim'

" {{{ ale.vim
" Disable duplicate linters
let g:ale_linters_ignore = {
      \   'cpp': ['ccls', 'clangcheck'],
      \}
let g:ale_cpp_clangtidy_checks=["-clang-diagnostic-*,modernize*,-modernize-use-trailing-return-type,bugprone*,performance*,readability*,cppcoreguidelines*,misc*"]
let g:ale_disable_lsp = 1
let g:ale_set_highlights=0

let g:ale_virtualtext_cursor=1
let g:airline#extensions#ale#enabled = 1
Plug 'dense-analysis/ale'
" }}}

" {{{ coc-nvim (config adapted from https://github.com/neoclide/coc.nvim#example-vim-configuration)
" Coc plugins:
" - coc-pairs
" - coc-clangd
" - coc-lists
" - coc-ultisnips
" - coc-explorer
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
set completeopt=noinsert,menuone,noselect

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-c> to trigger completion again
inoremap <silent><expr> <c-c> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Explicitly call ccls here (instead of just coc-definition),
" because otherwise we'd also get duplicate results from clangd
nmap <silent> gd :call CocLocations('ccls','textDocument/definition')<cr>
" And same for find references
nmap <silent> gu :call CocLocations('ccls','textDocument/references')<cr>
" Go to base class definitions
nmap <silent> gb :call CocLocations('ccls','$ccls/inheritance',{'levels':5})<cr>
" Go to derived class definitions
nmap <silent> gi :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true, 'levels':5})<cr>

nmap <silent> <leader>sy :CocList --interactive --auto-preview symbols<CR>
nmap <silent> <leader>. :CocList --auto-preview outline<CR>

nmap <silent> <leader>di :CocList --auto-preview --normal diagnostics<CR>

" Not s
nmap <silent> gy <Plug>(coc-type-definition)

" grep word under cursor
command! -nargs=+ -complete=custom,s:GrepArgs Rg exe 'CocList grep '.<q-args>
function! s:GrepArgs(...)
  let list = ['-S', '-smartcase', '-i', '-ignorecase', '-w', '-word',
        \ '-e', '-regex', '-u', '-skip-vcs-ignores', '-t', '-extension']
  return join(list, "\n")
endfunction
nnoremap <silent> <Leader>cgw :exe 'CocList --auto-preview --normal --input='.expand('<cword>').' grep'<CR>

" General grep
nnoremap  <Leader>cgr :CocList --auto-preview --normal grep 

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Show signature help in insert mode on cursor hold
autocmd CursorHoldI * silent call CocActionAsync('showSignatureHelp')
" And also show it immediately when entering insert mode, very useful when editing parameters
autocmd InsertEnter * silent call CocActionAsync('showSignatureHelp')

" Update signature help on jump placeholder.
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
let g:coc_snippet_next="<tab>"
let g:coc_snippet_prev="<S-tab>"

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Toggle coc-explorer. <leader>n is a relict from my memonic for NERDTree
nnoremap <silent> <leader>n :CocCommand explorer<CR>

" }}}

call plug#end()

let hostname=hostname()
"Colorscheme depending on computer 
if hostname == "arch-laptop" || hostname == "tom-linux"
    color wal
else
    color solarized
endif

set nowrap
set scrolloff=2

" {{{ Quickfix/CocList mappings
map <C-n> :cnext<CR>
map <C-b> :cprev<CR>
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <silent> <leader>cc :call ToggleQuickFix()<cr>

map <C-M-n> :CocNext<CR>
map <C-M-b> :CocPrev<CR>
nnoremap <silent> <leader>co :CocListResume<CR>

" Go up/down in quickfix and keep it focused
autocmd FileType qf nnoremap <buffer> <Down> :cnext<CR><C-W><C-P>
autocmd FileType qf nnoremap <buffer> <Up> :cprev<CR><C-W><C-P>

" }}}

" {{{ Buffer management
map <leader>bn :bn<cr>
map <leader>bv :bp<cr>
map <leader>bd :bd<cr>
nnoremap <leader>wq :w\|bd<cr>
" }}}

" {{{ i3wm integration
set title titlestring=nvim
nmap <silent> <C-M-l> <C-l>
nmap <silent> <C-M-h> <C-h>
nmap <silent> <C-M-k> <C-k>
nmap <silent> <C-M-j> <C-j>
nnoremap <silent> <C-l> :call Focus('right', 'l')<CR>
nnoremap <silent> <C-h> :call Focus('left', 'h')<CR>
nnoremap <silent> <C-k> :call Focus('up', 'k')<CR>
nnoremap <silent> <C-j> :call Focus('down', 'j')<CR>
" }}}

"Appeareance
set number
set relativenumber
syntax on

"increment/decrement
noremap + <C-a>
noremap - <C-x>

"traverse jump list
nnoremap <tab> <C-o>
nnoremap <s-tab> <C-i>

set hidden
set backspace=indent,eol,start

set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

"Ignore case when searching
set ignorecase
set smartcase

"Remap H and L
noremap H 0
noremap L g_

"map j to gj except when there is a count!
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

"yank to system clipboard (hopefully)
set clipboard^=unnamed,unnamedplus 

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
set autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

nnoremap <leader>so :so $MYVIMRC<CR>

" Search for visual selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap [[ [[zz
nnoremap ]] ]]zz

" {{{ Source work config
if !empty(glob("~/.work.vim"))
    source ~/.work.vim
endif
" }}}
