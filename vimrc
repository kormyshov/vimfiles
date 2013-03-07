" Настройка плагина Pathogen
filetype off

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

filetype plugin indent on

" Отключаем панель инструментов
set guioptions-=T

" Цветовая схема
" colorscheme xemacs
colorscheme sonoma
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

" Подключить сниппеты для С++ и из библиотеки
au FileType c,cpp set ft=cpp.lib.algebra.string.BI.compressor.array.graph.segment.fenwick

" Показывать положение курсора всё время
set ruler

" Показывать незавершённые команды в статусбаре
set showcmd

" Нумерация строк
set nu

" Подсветка синтаксиса
syntax on

" Исправляем <Enter> для комментариев
set fo+=cr

" Перелистывание страниц в командном режиме на пробел
nmap <Space> <PageDown>

" Ctrl-Space для автодополнения
imap <C-Space> <C-X><C-O>
" F12 для обновления тэгов
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Copy/Paste в глобальный клипборд
vmap <C-C> "+yi
imap <C-V> <Esc>"+gpi

" Сохрание на F2
nmap <F2> :w!<cr>
vmap <F2> <esc>:w!<cr>i
imap <F2> <esc>:w!<cr>i

" Разделение окна по Ctrl+W+i и Ctrl+W+-
nmap <C-W>i <C-W>v
nmap <C-W>- <C-W>s

" Перемещение по вкладкам
map <S-tab> :tabprevious<cr>
nmap <S-tab> :tabprevious<cr>
imap <S-tab> <ESC>:tabprevious<cr>i
map <C-tab> :tabnext<cr>
nmap <C-tab> :tabnext<cr>
imap <C-tab> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>:NERDTree<cr><C-W><RIGHT>
imap <C-t> <ESC>:tabnew<cr>:NERDTree<cr><C-W><RIGHT>

" Автодополнение скобок
imap [ []<LEFT>
imap { {}<LEFT>
imap ( ()<LEFT>

" Делаем файлы сценариев исполняемыми
au BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x | endif | endif

" Убиваем лишние пробелы в файлах исходных кодов
au BufWritePre,FileWritePre *.h,*.php,*.c,*.cpp,*.htm,*.html let au_line=line(".")
au BufWritePre,FileWritePre *.h,*.php,*.c,*.cpp,*.htm,*.html let au_col=col(".")
au BufWritePre,FileWritePre *.h,*.php,*.c,*.cpp,*.htm,*.html %s/\s\+$//e
au BufWritePost *.h,*.php,*.c,*.cpp,*.htm*.html silent call cursor(au_line, au_col)

" Выставляем размеры окна
set columns=180
set lines=46

" Добавляем компиляцию и запуск для С-файлов. Подробности на http://habr.ru/blogs/vim/40369
function! BindF5_C()
	if filereadable("Makefile")
		set makeprg=make
		map <F5> :w!<cr>:make<cr>:cw<cr>
		imap <F5> <esc>:w!<cr>:make<cr>:cw<cr>
	else
		map <F5> :w!<cr>:make %:r<cr>:cw<cr>
		imap <F5> <esc>:w!<cr>:make %:r<cr>:cw<cr>
	endif
endfunction
au FileType c,cpp,h call BindF5_C()

function! BindF9_C()
	if filereadable("Makefile")
		set makeprg=make
		map <F9> :w!<cr>:make<cr>:cw<cr>:! ./%<<cr>
		imap <F9> <esc>:w!<cr>:make<cr>:cw<cr>:! ./%<<cr>
	else
		map <F9> :w!<cr>:make %:r<cr>:cw<cr>:! ./%<<cr>
		imap <F9> <esc>:w!<cr>:make %:r<cr>:cw<cr>:! ./%<<cr>
	endif
endfunction
au FileType c,cpp,h call BindF9_C()

" Оптимизация для RCC
" map <C-K> :! ./compile-g++.sh
" map <C-L> :! cat compilation.log
" map <C-P> :! ./local-runner.sh & sleep 2 && ./MyStrategy

" Вешаем горячие клавиши для открытия/закрытия NERD-tree
nmap <C-N>v :NERDTree<cr>
vmap <C-N>v <esc>:NERDTree<cr>i
imap <C-N>v <esc>:NERDTree<cr>i

nmap <C-N>x :NERDTreeClose<cr>
vmap <C-N>x <esc>:NERDTreeClose<cr>i
imap <C-N>x <esc>:NERDTreeClose<cr>i

" Инвертирование комментариев по Ctrl+E с помощью NERDCommenter
map <C-e> \ci
nmap <C-e> \ci
imap <C-e> <Esc>\cii

" Не переходить по звёздочке на следующее
nnoremap * *N

" В визуальном режиме подсвечивать выделение по звёздчке
vnoremap * y :execute ":let @/=@\""<cr> :execute "set hlsearch"<cr>

" Подсвечивает все слова, совпадающие со словом под курсором
autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))

" По Alt-1 редактировать текущее слово
nnoremap <M-1> ciw

" По Alt-5 изменить хвост текущего слова
nnoremap <M-5> cw

" Настройка сворачиваемости блоков кода
set foldenable 			" Включить фолдинг
set foldmethod=indent 	" Определять блоки на основе отступов
set foldcolumn=3		" Ширина полосы управления
set foldlevel=7			" Количество открытых уровней по умолчанию
set foldopen=all		" Автоматическое открытие свёрток при заходе в них

" Хот-кеи для cpp4cf
map <C-L> :CFTemplate<CR>89<C-W>i<C-W><RIGHT>:e ~/.vim/snippets/content.txt<CR>18ggzMzrgg<C-W><LEFT>
nmap <C-L> :CFTemplate<CR>89<C-W>i<C-W><RIGHT>:e ~/.vim/snippets/content.txt<CR>18ggzMzrgg<C-W><LEFT>
imap <C-L> <ESC>:CFTemplate<CR>89<C-W>i<C-W><RIGHT>:e ~/.vim/snippets/content.txt<CR>18ggzMzrgg<C-W><LEFT>i
map <C-P> :CFPatch<CR>
nmap <C-P> :CFPatch<CR>
imap <C-P> <ESC>:CFPatch<CR>i

