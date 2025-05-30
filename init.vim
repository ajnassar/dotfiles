" SETS
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set autoindent
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
" set undodir=~/.vim/undodir
set undodir=~/.nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
set cursorline
set isfname+=@-@
set ls=0
set laststatus=2
set statusline+=%F%m
" Give more space for displaying messages.
set cmdheight=1
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set colorcolumn=120
set completeopt=menu
set nornu
set spell spelllang=en_us
" set foldmethod=indent
" set foldlevel=1
" set foldclose=all

let g:airline#extensions#tagbar#flags = 'f'  " show full tag hierarchy

nnoremap g, <C-o>
nnoremap g. <C-i>
" MAPS
let mapleader = " "
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>= :vertical resize +20<CR>
nnoremap <Leader>- :vertical resize -20<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
nnoremap <Leader>cpu a%" PRIu64 "<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
nnoremap <C-o> :Mru<CR>
" greatest remap ever
vnoremap <leader>p "_dP

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

nnoremap <leader>d "_d
vnoremap <leader>d "_d

" for command mode
nnoremap <S-Tab> <<
nnoremap <Tab> >>
" for insert mode
inoremap <S-Tab> <C-d>

nnoremap <Leader>7 :e $MYVIMRC<cr>
nnoremap <Leader>8 :e ~/.gitignore<cr>
command! ClearQuickfixList cexpr []
nmap <leader>cf :ClearQuickfixList<cr>

map <silent> <leader>w :lua require('nvim-window').pick()<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <c-S-Right> gt
noremap <c-S-Left> gT

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" inoremap <silent><expr> <C-x><C-z> coc#pum#visible() ? coc#pum#stop() : "\<C-x>\<C-z>"
" remap for complete to use tab and <cr>
" inoremap <silent><expr> <TAB>
"     \ coc#pum#visible() ? coc#pum#next(1):
"     \ <SID>check_back_space() ? "\<Tab>" :
"     \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" inoremap <silent><expr> <c-space> coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

call plug#begin('~/.vim/plugged')

" PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-surround'
Plug 'fisadev/vim-isort'
Plug 'dkprice/vim-easygrep'
Plug 'yegappan/mru'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
" wrap functions
Plug 'AckslD/nvim-revJ.lua'
Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
" Colors
Plug 'gruvbox-community/gruvbox'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
call plug#end()

" Ale
let g:ale_linters = {'python': ['flake8']}
let g_ale_linters_explicit = 1
let g:ale_lint_on_enter = 1

" let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-yaml']
let g:EasyGrepFilesToExclude = '*.swp,*~,*.venv,*.pyc,tags'
let g:python3_host_prog = "/usr/bin/python"
let g:coc_node_path = '/usr/bin/node'
let g:flake8_show_in_file = 1
let g:coc_diagnostic_disable=1

" Hunks
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

colorscheme gruvbox
" colorscheme catppuccin

" AUTO COMMANDS

" " On save call Isort
autocmd BufWritePost * call Isort()
function! Isort()
  if &filetype ==# 'python'
    :Isort
  endif
endfunction

augroup CHEESYBACON
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END

" This is the default extra key bindings
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-p> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <C-f> :Rg<CR>
nnoremap <leader>f :Rg <C-R><C-W><CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

let g:fzf_tags_command = 'ctags -R --exclude=.git .'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
            \   fzf#vim#with_preview(), <bang>0)
" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always
    --smart-case %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
            \ call fzf#vim#grep(
            \   'git grep --line-number '.shellescape(<q-args>), 0,
            \   fzf#vim#with_preview({'dir': systemlist('git rev-parse--show-toplevel')[0]}), <bang>0)

map <Leader>z :call InsertLine()<CR>

function! InsertLine()
  " let trace = expand("import pdb; pdb.set_trace()")
  let trace = expand("breakpoint()")
  execute "normal o".trace
endfunction

map <Leader>x :call InsertSlackDebug()<CR>
map <Leader>z :call InsertSlackJsonDebug()<CR>
map <Leader>d :call InsertPythonDebug()<CR>
map <Leader>p1 :call Insert1()<CR>
map <Leader>p2 :call Insert2()<CR>
map <Leader>p3 :call Insert3()<CR>
map <Leader>p4 :call Insert4()<CR>
map <Leader>p5 :call Insert5()<CR>
map <Leader>p6 :call Insert6()<CR>
map <Leader>p7 :call Insert7()<CR>
map <Leader>p8 :call Insert8()<CR>
map <Leader>n :!python -m json.tool<CR>

function! FormatJson()
  return ":!python -m json.tool"
endfunction

function! InsertPythonDebug()
  let trace = expand("breakpoint()")
  execute "normal o".trace
  execute "normal t)"
endfunction
function! InsertSlackJsonDebug()
  let trace = expand("from htk import slack_debug_json;slack_debug_json()")
  execute "normal o".trace
  execute "normal t)"
endfunction
function! InsertSlackDebug()
  let trace = expand("from htk import slack_debug;slack_debug()")
  execute "normal o".trace
  execute "normal t)"
endfunction
function! Insert1()
  let trace = expand("from htk import fdebug; fdebug()")
  execute "normal o".trace
  execute "normal t)"
endfunction
function! Insert2()
  let trace = expand("from htk import fdebug; fdebug('22222222222222222222222')")
  execute "normal o".trace
  execute "normal t)"
endfunction
function! Insert3()
  let trace = expand("from htk import fdebug; fdebug('33333333333333333333333')")
  execute "normal o".trace
  execute "normal t)"
endfunction
function! Insert4()
  let trace = expand("from htk import fdebug; fdebug('44444444444444444444444')")
  execute "normal o".trace
  execute "normal t)"
endfunction
function! Insert5()
  let trace = expand("from htk import fdebug; fdebug('555555555555555555555555')")
  execute "normal o".trace
  execute "normal t)"
endfunction
function! Insert6()
  let trace = expand("from htk import fdebug; fdebug('666666666666666666666666')")
  execute "normal o".trace
  execute "normal t)"
endfunction
function! Insert7()
  let trace = expand("from htk import fdebug; fdebug('7777777777777777777777')")
  execute "normal o".trace
  execute "normal t)"
endfunction
function! Insert8()
  let trace = expand("from htk import fdebug; fdebug('88888888888888888888888')")
  execute "normal o".trace
  execute "normal t)"
endfunction
