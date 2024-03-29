set nocompatible              " required
filetype off                  " required
filetype plugin on

" Plugins {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
"Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'chriskempson/base16-vim'


    " All of your Plugins must be added before the following line
    call vundle#end()            " required
    filetype plugin indent on    " required
    " }}}
    " Leader {{{
    let mapleader = "\<Space>"

    nnoremap <Leader>o :CtrlP<CR>
    nnoremap <Leader>w :w<CR>
    nnoremap <Leader>z :wq<CR>
    nnoremap <Leader>g :Goyo<CR>
    nnoremap <Leader>b :setlocal spell spelllang=nb<CR>
    nnoremap <Leader>y :setlocal spell spelllang=nn<CR>
    nnoremap <Leader>u :setlocal spell spelllang=en_us<CR>

    vmap <Leader>y "+y
    vmap <Leader>d "+d
    nmap <Leader>p "+p
    nmap <Leader>P "+P
    vmap <Leader>p "+p
    vmap <Leader>P "+P

    " }}}
    " Colors {{{
    " Use 256 colours (Use this setting only if your terminal supports 256
    " colours)
    set t_Co=256
    let base16colorspace=256
    let python_highlight_all=1
    syntax on
    " let g:onedark_termcolors=256
    colorscheme base16-tomorrow-night
    set background=dark

    au BufRead,BufNewFile *.pde set filetype=arduino
    au BufRead,BufNewFile *.ino set filetype=arduino
    "au! BufRead,BufNewFile *.markdown set filetype=mkd
    "au! BufRead,BufNewFile *.md       set filetype=mkd

    hi clear SpellBad
    hi SpellBad cterm=underline

    hi clear SpellCap
    hi SpellCap cterm=underline

    " }}} 
    " Cursor {{{
    if &term =~ "xterm\\|rxvt"
      " use an orange cursor in insert mode
      let &t_SI = "\<Esc>]12;orange\x7"
      " use a red cursor otherwise
      let &t_EI = "\<Esc>]12;grey\x7"
      silent !echo -ne "\033]12;grey\007"
      " reset cursor when vim exits
      autocmd VimLeave * silent !echo -ne "\033]112\007"
      " use \003]12;gray\007 for gnome-terminal and rxvt up to version 9.21
    endif 

    " }}}
    " Split {{{
    set splitbelow
    set splitright
    nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
    nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
    " }}}
    " Folding {{{
    "Enable folding
    set foldmethod=syntax
    set foldlevel=99

    " Enable folding with the leader F
    nnoremap <leader>f za
    let g:SimpylFold_docstring_preview=1
    " }}}
    " Tabs & Spaces {{{
    set tabstop=4 |
    set softtabstop=4 |
    set shiftwidth=4 |
    set textwidth=79 |
    set expandtab |
    set autoindent |
    set fileformat=unix

    "place in vimrc
    "shift line forward (Ctrl-Shift-Tab for backward shift)
    nmap <C-Tab> i_<Esc>mz:set ve=all<CR>o<C-o>`z<Down>_<Esc>:exe "normal >>"<CR>my`z:exe "normal >>"<CR>`y<Up>mz<Down>dd`z:set ve=<CR>i<Del><Right><Esc>
    nmap <C-S-Tab> i_<Esc>mz:set ve=all<CR>o<C-o>`z<Down>_<Esc>:exe "normal <<"<CR>my`zi<Del><Esc>:exe "normal <<"<CR>`y<Up>mz<Down>dd`z:set ve=<CR>:<Del>
    imap <C-Tab> _<Esc>mz:set ve=all<CR>o<C-o>`z<Down>_<Esc>:exe "normal >>"<CR>my`z:exe "normal >>"<CR>`y<Up>mz<Down>dd`z:set ve=<CR>i<Del>
    imap <C-S-Tab> _<Esc>mz:set ve=all<CR>o<C-o>`z<Down>_<Esc>:exe "normal <<"<CR>my`zi<Del><Esc>:exe "normal <<"<CR>`y<Up>mz<Down>dd`z:set ve=<CR>i

    au BufNewFile,BufRead *.py
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |
        \ set textwidth=79 |
        \ set expandtab |
        \ set autoindent |
        \ set fileformat=unix

    set encoding=utf-8
    au BufNewFile,BufRead *.html
        \ set tabstop=2 |
        \ set softtabstop=2 |
        \ set shiftwidth=2 |
        \ set textwidth=79 |
        \ set expandtab |
        \ set autoindent |
        \ set fileformat=unix

    au BufNewFile,BufRead *.md
        \ set tabstop=4 |
        \ set softtabstop=4 |
        \ set shiftwidth=4 |
        \ set textwidth=79 |
        \ set expandtab |
        \ set fileformat=unix

    " }}}
    " NERDTree {{{
    map <C-t> :NERDTreeToggle<CR>
    " }}}
    " UI {{{
    set nu
    set rnu
    set cursorline
    " }}}
    " CTRLP {{{
    let g:ctrlp_show_hidden = 1
    let g:ctrlp_map = '<c-p>'


    " }}}
    " Powerline {{{
    set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

    " Always show statusline
    set laststatus=2
    " }}}
    " Search {{{
    " Search with / , replace with cs , n.n. to replace following
    vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
        \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
    omap s :normal vs<CR>
    " }}}
    " Paste {{{
    vnoremap <silent> y y`]
    vnoremap <silent> p p`]
    noremap gV `[v`]
    " }}}
    " Navigation {{{
    "split navigations
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    " Enter is G, backspace is gg
    nnoremap <CR> G
    nnoremap <BS> gg

    " Jump to EOL while in insert
    inoremap <C-e> <C-o>A

    " Fixes backspace
    set backspace=2
    " }}}
    " Organization {{{
    set foldmethod=marker
    set foldlevel=0
    set modelines=1
    " }}}
    
