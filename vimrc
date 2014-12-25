" Включаем vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "sonoma.vim"
Bundle "altercation/vim-colors-solarized"
Bundle "bling/vim-airline"
Bundle "mhinz/vim-startify"
Bundle "Conque-Shell"
Bundle "ack.vim"
Bundle "UltiSnips"
Bundle "matchit.zip"
Bundle "tpope/vim-fugitive"
Bundle "dhruvasagar/vim-table-mode"
Bundle "The-NERD-tree"
Bundle "The-NERD-Commenter"
Bundle "jcf/vim-latex"
Bundle "Rip-Rip/clang_complete"
" Bundle "Valloric/YouCompleteMe"
Bundle "haskell.vim"
Bundle "kormyshov/cpp4cf"

" Применять типы файлов
filetype on
filetype plugin on
filetype indent on

" На Esc менять раскладку на En
imap <Esc> <Esc>:silent !~/.vim/to_us.sh<cr>
nmap <Esc> :silent !~/.vim/to_us.sh<cr>

" Отключаем панель инструментов
set guioptions-=T
" Отключаем меню
set guioptions-=m

" Цветовая схема
"colorscheme sonoma
colorscheme solarized
set background=dark
"colorscheme jellybeans

" Установка кодировки отображения
set enc=utf-8
" Мигаем вместо пищания
set visualbell
" Текущий каталог всегда совпадает с содержимым окна
set autochdir
" Постоянно отображать вкладки табов
set stal=2

" Настройка отступов подробности на http://habr.ru/post/64224
set tabstop=4
set shiftwidth=4
set smarttab
set smartindent

" Отступы в стиле С++
set cin

" Показывать положение курсора всё время
set ruler
" Минимальное количество строк вокруг курсора
set scrolloff=5

" Показывать незавершённые команды в статусбаре
set showcmd

" Настройка строки состояния
"set statusline=%F%m%r%h%w\ [%{&fileformat},%{&fileencoding}]\ [%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " всегда показывать строку состояния

" Нумерация строк
"set nu
" Относительная нумерация
set relativenumber

" Подсветка синтаксиса
syntax on

" Исправляем <Enter> для комментариев
set fo+=cr

" Перелистывание страниц в командном режиме на пробел
nmap <Space> <PageDown>
" Добавление строки на <Enter> в командном режиме
nmap <CR> o<Esc>

" Copy/Paste в глобальный клипборд
vmap <C-C> "+y
imap <C-V> <Esc>"+gpi

" Сохрание на F2
nmap <F2> :w!<cr>
imap <F2> <C-o>:w!<cr>

" Разделение окна по Ctrl+W+i и Ctrl+W+-
nmap <C-W>i <C-W>v
nmap <C-W>- <C-W>s

" Открытие окон ежедневника на Alt+A
nmap <A-a> :e ~/Dropbox/all/diary/main.tex<CR><C-w>-<C-w>j :e ~/Dropbox/all/lists/main.tex<CR><C-w>i<C-w>l :e ~/Dropbox/all/all.tex<CR>

" Перемещение по вкладкам
map <S-tab> :tabprevious<cr>
nmap <S-tab> :tabprevious<cr>
imap <S-tab> <C-o>:tabprevious<cr>
map <C-tab> :tabnext<cr>
nmap <C-tab> :tabnext<cr>
imap <C-tab> <C-o>:tabnext<cr>
nmap <C-t> :tabnew<cr>:NERDTree<cr><C-W>l
imap <C-t> <ESC>:tabnew<cr>:NERDTree<cr><C-W>l

" Делаем файлы сценариев исполняемыми
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x | endif | endif

" Убиваем лишние пробелы в файлах исходных кодов
au BufWritePre,FileWritePre *.h,*.php,*.c,*.cpp,*.htm,*.html let au_line=line(".")
au BufWritePre,FileWritePre *.h,*.php,*.c,*.cpp,*.htm,*.html let au_col=col(".")
au BufWritePre,FileWritePre *.h,*.php,*.c,*.cpp,*.htm,*.html %s/\s\+$//e
au BufWritePost *.h,*.php,*.c,*.cpp,*.htm*.html silent call cursor(au_line, au_col)

" Выставляем размеры окна
set columns=180
set lines=45

" Настройка vim-airline
let g:airline_theme='light'
let g:airline_powerline_fonts=1
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '≬'
let g:airline_enable_fugitive=1
"let g:airline_section_b = '%03.3b'

" Настройка закладок в startify
let g:startify_bookmarks = [ '~/.vimrc' ]
let g:startify_custom_header = [
\ '|  ______  __                                      __  __                          __                __                  ',
\ '| /\__  _\/\ \      __              __            /\ \/\ \  __                    /\ \              /\ \                 ',
\ '| \/_/\ \/\ \ \___ /\_\    ____    /\_\    ____   \ \ \ \ \/\_\    ___ ___        \ \ \____     __  \ \ \____  __  __    ',
\ '|    \ \ \ \ \  _ `\/\ \  /'',__\   \/\ \  /'',__\   \ \ \ \ \/\ \ /'' __` __`\       \ \ ''__`\  /''__`\ \ \ ''__`\/\ \/\ \   ',
\ '|     \ \ \ \ \ \ \ \ \ \/\__, `\   \ \ \/\__, `\   \ \ \_/ \ \ \/\ \/\ \/\ \  __   \ \ \L\ \/\ \L\.\_\ \ \L\ \ \ \_\ \  ',
\ '|      \ \_\ \ \_\ \_\ \_\/\____/    \ \_\/\____/    \ `\___/\ \_\ \_\ \_\ \_\/\ \   \ \_,__/\ \__/.\_\\ \_,__/\/`____ \ ',
\ '|       \/_/  \/_/\/_/\/_/\/___/      \/_/\/___/      `\/__/  \/_/\/_/\/_/\/_/\ \/    \/___/  \/__/\/_/ \/___/  `/___/> \',
\ '|                                                                              \/                                  /\___/',
\ '|                                                                                                                  \/__/ ',
\ ]

" Вешаем горячие клавиши для открытия/закрытия NERD-tree
nmap <C-N>v :NERDTree<cr>
imap <C-N>v <C-o>:NERDTree<cr>

nmap <C-N>x :NERDTreeClose<cr>
imap <C-N>x <C-o>:NERDTreeClose<cr>

" Вешаем горячую клавишу для открытия bash'a
nmap <C-N>b :ConqueTermSplit bash<cr>
imap <C-N>v <C-o>:ConqueTermSplit bash<cr>

" Инвертирование комментариев по Ctrl+E с помощью NERDCommenter
map <C-e> \ci
nmap <C-e> \ci
imap <C-e> <Esc>\cii

" Устанавливаем директорию для сниппетов
let g:UltiSnipsSnippetDirectories=[
	\ "snips",
	\ "snips/Scanner",
	\ "snips/lib",
	\ "snips/algebra",
	\ "snips/array",
	\ "snips/graph",
	\ "snips/string",
	\ "snips/compressor",
	\ "snips/segment",
	\ "snips/fenwick",
	\ "snips/DataStruct",
	\ "snips/BI",
	\ "snips/Persistent",
	\ "snips/geometry",
	\ "snips/matrix",
	\ "snips/Treap"
	\ ]

" Прописываем путь для clang
let g:clang_library_path="/usr/lib/llvm-3.4/lib"

" Автодополнение по <C-Space>
let g:clang_complete_auto=0
imap <C-Space> <C-X><C-U>
let g:clang_close_preview=1

" Автодополнение сниппетов от UltiSnips
let g:clang_snippets=1
let g:clang_snippets_engine="ultisnips"

" Исправляем C-T для cpp из-за clang
let g:clang_jumpto_back_key='<C-[>'

" Настройка vim-table-mode
let g:table_mode_separator = '|'
let g:table_mode_corner = '+'
nmap <C-N>t :TableModeEnable<cr>
imap <C-N>t <C-o>:TableModeEnable<cr>

nmap <C-N>d :TableModeDisable<cr>
imap <C-N>d <C-o>:TableModeDisable<cr>

" Исправляем конфликт UltiSnips и YCM
"let g:ycm_key_list_select_completion=[]
"let g:ycm_key_list_previous_completion=[]

" Добавление дефолтного семантического автокомплита
"let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/python/ycm/extra_conf_store.py"

" Не переходить по звёздочке на следующее
nnoremap * *N

" В визуальном режиме подсвечивать выделение по звёздчке
vnoremap * y :execute ":let @/=@\""<cr> :execute "set hlsearch"<cr>

" Подсвечивает все слова, совпадающие со словом под курсором
autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))

" По Alt-1 редактировать текущее слово
nnoremap <A-1> ciw

" По Alt-2 изменить хвост текущего слова
nnoremap <A-2> cw

" Настройка сворачиваемости блоков кода
set foldenable 			" Включить фолдинг
set foldmethod=marker 	" Определять блоки на основе отступов
set foldcolumn=3		" Ширина полосы управления
set foldlevel=7			" Количество открытых уровней по умолчанию
set foldopen=all		" Автоматическое открытие свёрток при заходе в них

" Хот-кеи для cpp4cf
map <C-l> :CFTemplate<CR>89<C-W>i<C-W>l:e ~/.vim/snips/content.txt<CR>/lbound<CR>zMzrgg<C-W>h
map <C-p> :CFPatch<CR>

" Отключаем работу стрелочек
"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Позволяем передвигаться с помощью hjkl в Insert mode зажав <Alt>
imap <A-h> <Esc>i
imap <A-j> <C-o>j
imap <A-k> <C-o>k
imap <A-l> <Esc>la

" Перемещение одной строки вверх/вниз
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Перемещение выделенного текста вверх/вниз
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Вычисление выражений
imap <silent> <A-e> <C-r>=string(eval(input("Calculate: ")))<CR>

" Оптимизация для RAIC
map <C-K> :! ./compile-g++11.sh
map <C-U> :! cat compilation.log
map <C-M> :! ./local-runner.sh & sleep 3 && ./MyStrategy

" Добавляем компиляцию и запуск для С-файлов. Подробности на http://habr.ru/blogs/vim/40369
function! BindF5_C()
	if filereadable("Makefile")
		set makeprg=make
		map <F5> :w!<cr>:make<cr>:cw<cr>
		imap <F5> <Esc>:w!<cr>:make<cr>:cw<cr>
	else
		map <F5> :w!<cr>:!g++ -pthread -Wall -O2 -fno-optimize-sibling-calls -std=c++0x -static % -o %:r -lm<cr>:cw<cr>
		imap <F5> <Esc>:w!<cr>:!g++ -pthread -Wall -O2 -fno-optimize-sibling-calls -std=c++0x -static % -o %:r -lm<cr>:cw<cr>
	endif
endfunction
au FileType c,cpp,h call BindF5_C()

function! BindF9_C()
	if filereadable("Makefile")
		set makeprg=make
		map <F9> :w!<cr>:make<cr>:cw<cr>:! ./%<<cr>
		imap <F9> <Esc>:w!<cr>:make<cr>:cw<cr>:! ./%<<cr>
	else
		map <F9> :w!<cr>:!g++ -pthread -Wall -O2 -fno-optimize-sibling-calls -std=c++0x -static % -o %:r -lm<cr>:cw<cr>:! ./%<<cr>
		imap <F9> <Esc>:w!<cr>:!g++ -pthread -Wall -O2 -fno-optimize-sibling-calls -std=c++0x -static % -o %:r -lm<cr>:cw<cr>:! ./%<<cr>
		map <C-F9> :w!<cr>:!g++ -pthread -Wall -O2 -fno-optimize-sibling-calls -std=c++0x -static % -o %:r -lm<cr>:cw<cr>:! xclip -o -selection clipboard<cr>:! xclip -o -selection clipboard \| ./%<<cr>
		imap <C-F9> <Esc>:w!<cr>:!g++ -pthread -Wall -O2 -fno-optimize-sibling-calls -std=c++0x -static % -o %:r -lm<cr>:cw<cr>:! xclip -o -selectopn clipboard<cr>:! xclip -o -selection clipboard \| ./%<<cr>
	endif
endfunction
au FileType c,cpp,h call BindF9_C()

" Автодополнение скобок в С++
function! AutocompleteBraces()
	imap [ []<A-h>
	imap ( ()<A-h>
	imap { {}<A-h>
	imap $ {<CR><C-o>$<CR>}<A-k><C-o>$
endfunction
au Filetype c,cpp,h call AutocompleteBraces()

" Добавляем компиляцию и просмотр для tex-файлов, сокращая команды плагина
" vim-latex
function! BindF5_tex()
	map <F5> :w!<cr>\ll
	imap <F5> <Esc>:w!<cr>\ll
endfunction
au FileType tex,plaintex call BindF5_tex()

function! BindF9_tex()
	map <F9> :w!<cr>\ll\lv
	imap <F9> <Esc>:w!<cr>\ll\lv
endfunction
au FileType tex,plaintex call BindF9_tex()

" Добавляем компиляцию и запуск для Pascal
function! BindF5_pas()
	if filereadable("Makefile")
		set makeprg=make
		map <F5> :w!<cr>:make<cr>:cw<cr>
		imap <F5> <Esc>:w!<cr>:make<cr>:cw<cr>
	else
		map <F5> :w!<cr>:!fpc -So -XS %<cr>:cw<cr>
		imap <F5> <Esc>:w!<cr>:!fpc -So -XS %<cr>:cw<cr>
	endif
endfunction
au FileType pas,dpr call BindF5_pas()

function! BindF9_pas()
	if filereadable("Makefile")
		set makeprg=make
		map <F9> :w!<cr>:make<cr>:cw<cr>:! ./%<<cr>
		imap <F9> <Esc>:w!<cr>:make<cr>:cw<cr>:! ./%<<cr>
	else
		map <F9> :w!<cr>:!fpc -So -XS %<cr>:cw<cr>:! ./%<<cr>
		imap <F9> <Esc>:w!<cr>:!fpc -So - XS %<cr>:cw<cr>:! ./%<<cr>
		map <C-F9> :w!<cr>:!fpc -So -XS %<cr>:cw<cr>:! xclip -o -selection clipboard<cr>:! xclip -o -selection clipboard \| ./%<<cr>
		imap <C-F9> <Esc>:w!<cr>:!fpc -So -XS %<cr>:cw<cr>:! xclip -o -selectopn clipboard<cr>:! xclip -o -selection clipboard \| ./%<<cr>
	endif
endfunction
au FileType pas,dpr call BindF9_pas()

"au BufEnter $MYVIMRC source $MYVIMRC

