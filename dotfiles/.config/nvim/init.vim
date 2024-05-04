" set number             "行番号を表示
set nonumber             "行番号を表示
set signcolumn=yes     " 画面左端にサイン列を常に表示
set laststatus=2       " 画面最下部に常にステータスラインを表示
set cmdheight=2        " 画面最下部(ステータス行より下)のメッセージ表示欄を2行にする
set showtabline=2      " タブごとに常にタブラインを表示
set autoindent         "改行時に自動でインデントする
set tabstop=2          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
set title
set laststatus=2
set noswapfile         " スワップファイル(.swp)を生成しない
set nobackup           " バックアップファイル(~)を生成しない
set noundofile         " undoファイル(.un~)を生成しない
set hlsearch           " 文字列検索ハイライト
set mouse=
nnoremap <C-j> <C-^>     "直前バッファに移動
"set textwidth=2
"set cursorline
"set showmatch
"syntax enable
"
"
"
"

augroup signcolumn_bg_none
  autocmd!
  " colorscheme読み込み後、サイン列の背景色をNONEにする ※Windows Terminal側の色を使いたいため
  autocmd VimEnter,ColorScheme * highlight SignColumn guibg=NONE ctermbg=NONE
augroup END

nmap <silent> <Esc><Esc> :<C-u>nohlsearch<CR><Esc> " 文字列検索のハイライトオフ

if has('wsl')
	" wsl2
	let g:clipboard = {
			\   'name': 'myClipboard',
			\   'copy': {
			\      '+': 'win32yank.exe -i',
			\      '*': 'win32yank.exe -i',
			\    },
			\   'paste': {
			\      '+': 'win32yank.exe -o',
			\      '*': 'win32yank.exe -o',
			\   },
			\   'cache_enabled': 1,
			\ }
else
	" Linux
	set clipboard&
	set clipboard^=unnamedplus
endif

" 行頭行末をShift+H,Shift+L
noremap <S-h> 0
noremap <S-l> $

" +,-でインクリメント
nnoremap + <C-a>
nnoremap - <C-x>

" 矢印キーを無効化
noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>

" yaml
set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins
call plug#begin()
Plug 'vim-jp/vimdoc-ja'    " vim Plugin日本語化
Plug 'itchyny/lightline.vim' " タブラインステータスラインを表示
Plug 'ntk148v/vim-horizon'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' " Git管理下のファイルを編集すると左にマークが表示されるように
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'VundleVim/Vundle.vim'
Plug 'stephpy/vim-yaml'
Plug 'prabirshrestha/vim-lsp' " VimLSP
Plug 'mattn/vim-lsp-settings' " VimLSP
Plug 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'} " Ansible-lsp
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary' " CommentOut
Plug 'jiangmiao/auto-pairs' " 自動でカッコを閉じる
Plug 'mbbill/undotree'      " Undo管理
Plug 'easymotion/vim-easymotion' " sのあとに先頭2文字で移動
Plug 'airblade/vim-rooter' " カレントディレクトリを自動的に.gitがあるディレクトリにしてくれる
Plug 'vim-scripts/vim-auto-save' " カレントディレクトリを自動的に.gitがあるディレクトリにしてくれる
Plug 'tpope/vim-surround' " 文字列を囲う
Plug 'famiu/nvim-reload' "リロード
Plug 'chase/vim-ansible-yaml' "yamlオートインデント
Plug 'nvie/vim-flake8'
Plug 'tell-k/vim-autopep8'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'vim-scripts/buftabs'
Plug '~/.config/nvim/unmanagerd_plugins/sweep_trail'
Plug '~/.config/nvim/unmanagerd_plugins/autofmt'
Plug '~/.config/nvim/unmanagerd_plugins/qfixhowm-master'
Plug 'towolf/vim-helm'
Plug 'terryma/vim-multiple-cursors' "ビジュアルモードでCtrl+Nで同時編集
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
" Plug '~/.config/nvim/unmanagerd_plugins/qfixhowm-master'
" Plug 'fuenor/qfixhowm'
" Plug 'fuenor/qfixgrep'
Plug 'mtth/scratch.vim'
Plug 'liuchengxu/vista.vim'                         " LSP シンボル、タグを表示および検索
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'alvan/vim-closetag'  " html閉じタグを自動補完
Plug 'hashivim/vim-terraform' " terraform syntax highlight
Plug 'prabirshrestha/vim-lsp' " vimのLSP
Plug 'chrisbra/csv.vim'       " csv編集
Plug 'dart-lang/dart-vim-plugin' " dart Plugin
Plug 'thinca/vim-qfreplace' " QuickFix全置換 :Qfreplaceで起動  :%s/case/test/gで置換
Plug 'towolf/vim-helm'
call plug#end()


if !has('gui_running')
  set t_Co=256
endif


" augroup vimrc_vim_plug_install
"   autocmd!
"   " 足りないプラグインがあれば :PlugInstall を実行
"   autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"     \| PlugInstall --sync | source $MYVIMRC
"   \| endif
" augroup END


" VimLSPの設定
let g:lsp_diagnostics_enabled = 1                        " Diagnosticsを有効にする
let g:lsp_diagnostics_echo_cursor = 1                    " カーソル下のエラー、警告、情報、ヒントを画面下部のコマンドラインに表示
let g:lsp_diagnostics_echo_delay = 50                    " Diagnosticsの表示の遅延を50msに設定
let g:lsp_diagnostics_float_cursor = 1                   " カーソル下のエラー、警告、情報、ヒントをフロート表示
let g:lsp_diagnostics_signs_enabled = 1                  " 画面左端のサイン列にエラー、警告、情報、ヒントのアイコンを表示
let g:lsp_diagnostics_signs_delay = 50                   " Diagnosticsのサイン列の表示の遅延を50msに設定
let g:lsp_diagnostics_signs_insert_mode_enabled = 0      " 挿入モード時、Diagnosticsのサイン列を表示しない
let g:lsp_diagnostics_highlights_delay = 50              " Diagnosticsの指摘箇所自体の文字ハイライト表示の遅延を50msに設定
let g:lsp_diagnostics_highlights_insert_mode_enabled = 0 " 挿入モード時、Diagnosticsの指摘箇所自体の文字ハイライトを表示しない
let g:lsp_document_code_action_signs_enabled = 0         " 画面左端のサイン列にコードアクションのアイコン非表示


inoremap <silent><expr> <c-space> coc#refresh()

" coc Settings
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

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

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

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

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>ex  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Launch Explorer
nnoremap <silent><nowait> <space>e  :<C-u>CocCommand explorer<cr>
nnoremap <C-c> :<C-u>CocCommand explorer<cr>



" lightline settings
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction


" easymotion/vim-easymotion
nmap s <Plug>(easymotion-overwin-f2)

" vim-auto-save
let g:auto_save = 1 " デフォルトで自動保存有効化
"let g:auto_save = 0 " デフォルトで自動保存有効化
let g:auto_save_in_insert_mode = 0 "インサートモードではOFFにする
let g:auto_save_silent = 1 "(AutoSaved at 08:40:55)などを表示しない


" terraform
function! TFfmtc()
  let result = system('terraform fmt -no-color -diff -check '. expand("%:p"))
  echo result
endfunction

function! TFfmt()
  let result = system('terraform fmt '. expand("%:p"))
  echo result
  :e
endfunction

" Launch lazygit
function! Lazygit()
  :term lazygit
  :set nonu
endfunction
command! -bar Lazygit call Lazygit()

" Indent width
"if has("autocmd")
"  "ファイルタイプの検索を有効にする
"  filetype plugin on
"  "ファイルタイプに合わせたインデントを利用
"  filetype indent on
"  "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
"  autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType yml        setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType yaml        setlocal sw=2 sts=2 ts=2 et
"  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
"  autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
"endif

cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

"autopep8を<shift>+fで実行
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction
function! Autopep8()
    call Preserve(':silent %!autopep8 --ignore=E501 -')
endfunction
autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>


"buftabs
" バッファタブにパスを省略してファイル名のみ表示する
let g:buftabs_only_basename=1
" バッファタブをステータスライン内に表示する
let g:buftabs_in_statusline=1
" 現在のバッファをハイライト
let g:buftabs_active_highlight_group="Visual"
" ステータスライン
set statusline=%=\ [%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%Y]\[%04l,%04v][%p%%]
" ステータスラインを常に表示
set laststatus=2

" 前のバッファへ移動
nmap <C-l> :bn<CR>
" 次のバッファへ移動
nmap <C-p> :bp<CR>

"
" qfixown
"
set runtimepath+=~/.config/nvim/unmanagerd_plugins/qfixhowm-master

" キーマップリーダー
let QFixHowm_Key = 'g'
" howm_dirはファイルを保存したいディレクトリを設定
let howm_dir             = '/mnt/c/Users/yuta/OneDrive\ -\ 株式会社ヴァンデミックシステム/03_qfixhown'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
" クイックメモのファイル名(月ごと)
let QFixHowm_QuickMemoFile = 'Qmem-00-%Y-%m-00-000000.txt'
" QFixHowmのファイルタイプ
let QFixHowm_FileType = 'qfix_memo'
"新規エントリのテンプレート
let QFixHowm_Template = [
  \"= ",
  \"",
  \"%DATE%",
  \"",
  \""
\]
" タイトル記号を # に変更する
" let QFixHowm_Title = '#'
" とりあえず有効にし、なにか問題が起きたら無効化するのをおすすめします
" プレビューや絞り込みをQuickFix/ロケーションリストの両方で有効化(デフォルト:2)
let QFixWin_EnableMode = 1
" QFixHowm/QFixGrepの結果表示にロケーションリストを使用する/しない
let QFix_UseLocationList = 3
" キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
set timeout timeoutlen=3000 ttimeoutlen=100

" Autofmt
" 整形用の設定例
set formatexpr=autofmt#japanese#formatexpr()  " kaoriya 版では設定済み
let autofmt_allow_over_tw = 1  " 全角文字がぶら下がりで 1 桁はみ出すのを許可
set formatoptions+=mB          " または mM
set smartindent

" Enable rufo (RUby FOrmat)
let g:rufo_auto_formatting = 1

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" coc.nvim corperraiont ale
let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 1


" html閉じタグを自動補完
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'

" dart
let g:dart_format_on_save = 1 " dartファイル保存時に自動的にフォーマット

" tab
nnoremap <silent> <leader>tf :<c-u>tabfirst<cr>
nnoremap <silent> <leader>tl :<c-u>tablast<cr>
nnoremap <silent> <leader>tn :<c-u>tabnext<cr>
nnoremap <silent> <leader>tN :<c-u>tabNext<cr>
nnoremap <silent> <leader>tp :<c-u>tabprevious<cr>
nnoremap <silent> <leader>te :<c-u>tabedit<cr>
nnoremap <silent> <leader>tc :<c-u>tabclose<cr>
nnoremap <silent> <leader>to :<c-u>tabonly<cr>
nnoremap <silent> <leader>ts :<c-u>tabs<cr>
