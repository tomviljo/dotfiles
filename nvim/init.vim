"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable 24-bit color, use ctermfg and ctermbg for consistent themes across terminals
set notermguicolors

" Color scheme
colorscheme vanilla-toms

" Syntax highlighting
syntax on

" Window title
set title

" How many lines to scroll at once
set scrolljump=5

" Show command while typing it
set showcmd

" Character to display at dynamic wrap
" set showbreak=\

" 2 means always show status
set laststatus=2

" Do not blink matching brace
set noshowmatch

" Do not highlight all matches
set nohlsearch

" Case-sensitive search
set noignorecase

" Preview search match
set incsearch

" Do not beep, flash instead
set visualbell

" No annoying file~ backups
set nobackup

" Re-read files that were changed outside Vim and have no unsaved changes
set autoread

" No swap (autosave) files
" set updatecount=0

" Autosave to "swap file" after this many chars typed
set updatecount=50

" ...and this many milliseconds since stopped typing
set updatetime=10000

" Show cursor position
set ruler

" Show line numbers
set number

" Show incomplete lines, show control codes as hex
set display=lastline,uhex

" Limit width in wide terminals
" set columns=80

" Indentation
set autoindent
" set smartindent
set nocindent
set cinoptions=t0(0:0
set cinkeys-=0#
set cinkeys-=:
set shiftwidth=4
set tabstop=8
set expandtab

" Do not continue the comment when opening a line after an existing comment
set formatoptions-=o

" No hard wrap
set textwidth=0

" Tab-completion behavior
set wildmode=list:longest

" Allow leaving buffer with unsaved changes
set hidden

" Visualize spaces
set listchars=tab:──,trail:─,nbsp:+

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILE TYPES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Period (.) is not part of a word; for some reason this has to be set all the time
" Also enable 'list' to show tabs and trailing whitespace
autocmd bufenter * set iskeyword-=. | set list

" Smart indentation for programming languages
autocmd FileType java       set nocindent | set noexpandtab | set tabstop=4 | set shiftwidth=4
autocmd FileType go         set nocindent | set noexpandtab | set tabstop=4 | set shiftwidth=4
autocmd FileType c          set cindent   | set expandtab   | set tabstop=8 | set shiftwidth=4
autocmd FileType h          set cindent   | set expandtab   | set tabstop=8 | set shiftwidth=4
autocmd FileType make       set nocindent | set noexpandtab | set tabstop=4 | set shiftwidth=4
autocmd FileType html       set nocindent | set expandtab   | set tabstop=8 | set shiftwidth=2
autocmd FileType css        set nocindent | set expandtab   | set tabstop=8 | set shiftwidth=2
autocmd FileType json       set nocindent | set expandtab   | set tabstop=8 | set shiftwidth=2
autocmd FileType yaml       set nocindent | set expandtab   | set tabstop=8 | set shiftwidth=2
autocmd FileType xml        set nocindent | set expandtab   | set tabstop=8 | set shiftwidth=2
autocmd FileType sql        set nocindent | set expandtab   | set tabstop=8 | set shiftwidth=4
autocmd FileType python     set nocindent | set expandtab   | set tabstop=8 | set shiftwidth=4
autocmd FileType javascript set nocindent | set expandtab   | set tabstop=8 | set shiftwidth=4

" Strip trailing whitespace before saving
autocmd BufWritePre * %s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBOARD SHORTCUTS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Scroll through windows with Ctrl + up/down keys
nmap <C-j> <C-w>w
nmap <C-k> <C-w>W

" Scroll through buffers with Ctrl + left/right keys
nmap <C-h> :bprevious<CR>
nmap <C-l> :bnext<CR>

" Close buffer with Ctrl-C
nmap <C-c> :bdelete<CR>

" Go to after pasted text
nmap P gP
nmap p gp

" S begins :%s///gc substitution
nmap S :%s///gc<Left><Left><Left><Left>

" Tab goes in and out of insert mode
nmap <Tab> i
imap <Tab> <Right><C-c>

" Shift-tab inserts tab character
imap <S-Tab> <Tab>

" Readline-like movement keys in command line
cmap <C-a> <Home>
cmap <C-b> <Left>
cmap <C-f> <Right>

" Save all with Ctrl-S
nmap <C-s> :wa<CR>

" Exit with Ctrl-D
nmap <C-d> :q<CR>

" Go shortcuts
autocmd FileType go nmap gd :GoDef<CR>
autocmd FileType go nmap gc :GoCallers<CR>

" Git shortcuts
nmap gb :Git blame<CR>

" Grep shortcuts
nmap gr :!grep -rn <C-r><C-w> *

" Display shell command's output in new Vim buffer (from Vim wiki)
" For instance, :S find .
command! -complete=file -nargs=+ S call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    aboveleft new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    execute 'silent $read !'.escape(a:cmdline,'%#')
    setlocal nomodifiable
    1
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Begin vim-plug configuration
call plug#begin()

" Dependencies
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

" Desired plugins
Plug 'nvim-lualine/lualine.nvim'
Plug 'kdheepak/tabline.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'jlanzarotta/bufexplorer'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}

" End vim-plug configuration
call plug#end()

" Begin Lua configuration of plugins
lua << END
function _theme_cba(c, b, a)
    return {a = {bg = a, fg = 15}, b = {bg = b, fg = 15}, c = {bg = c, fg = 15}}
end
lualine_theme = {
    -- Indigo/pink theme
    -- normal   = _theme_cba(57, 93, 165),
    -- insert   = _theme_cba(57, 92, 162),
    -- visual   = _theme_cba(57, 63, 75),
    -- replace  = _theme_cba(57, 92, 162),
    -- command  = _theme_cba(57, 93, 165),
    -- inactive = _theme_cba(21, 57, 129),

    -- Cyan/blue theme
    normal   = _theme_cba(24, 60, 96),
    insert   = _theme_cba(24, 96, 132),
    visual   = _theme_cba(24, 30, 36),
    replace  = _theme_cba(24, 96, 132),
    command  = _theme_cba(24, 25, 26),
    inactive = _theme_cba(240, 242, 244),
}
require('lualine').setup {
    options = {
        theme = lualine_theme
    }
}
require('tabline').setup{
    options = {
        modified_italic = false
    }
}
require('neo-tree').setup{}
END

" BufExplorer config
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowNoName=1
let g:bufExplorerShowRelativePath=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEYBOARD SHORTCUTS FOR PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <C-n> :Neotree position=current reveal<CR>
nmap <C-m> :Neotree buffers position=current<CR>
nmap <C-p> :BufExplorer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LOCAL ADDITIONS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.config/nvim/init-local.vim
