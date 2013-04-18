" Включаем vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle "gmarik/vundle"
Bundle "sonoma.vim"
Bundle "ack.vim"
Bundle "UltiSnips"
Bundle "matchit.zip"
Bundle "The-NERD-tree"
Bundle "The-NERD-Commenter"
Bundle "kormyshov/cpp4cf"

filetype plugin indent on

" Отключаем панель инструментов
set guioptions-=T
" Отключаем меню
set guioptions-=m

" Цветовая схема
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

" Показывать положение курсора всё время
set ruler
" Минимальное количество строк вокруг курсора
set scrolloff=5

" Показывать незавершённые команды в статусбаре
set showcmd

" Нумерация строк
set nu
" Относительная нумерация
set relativenumber

" Подсветка синтаксиса
syntax on

" Исправляем <Enter> для комментариев
set fo+=cr

" Перелистывание страниц в командном режиме на пробел
nmap <Space> <PageDown>

" Copy/Paste в глобальный клипборд
vmap <C-C> "+yi
imap <C-V> <Esc>"+gpi

" Сохрание на F2
nmap <F2> :w!<cr>
vmap <F2> <esc>:w!<cr>i
imap <F2> <esc>:w!<cr>a

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
imap [ []<A-h>
imap { {}<A-h>
imap ( ()<A-h>

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

" Устанавливаем директорию для сниппетов
let g:UltiSnipsSnippetDirectories=["snippets","snippets/Scanner","snippets/lib","snippets/algebra","snippets/array","snippets/graph","snippets/string","snippets/compressor","snippets/segment","snippets/fenwick"]

" Не переходить по звёздочке на следующее
nnoremap * *N

" В визуальном режиме подсвечивать выделение по звёздчке
vnoremap * y :execute ":let @/=@\""<cr> :execute "set hlsearch"<cr>

" Подсвечивает все слова, совпадающие со словом под курсором
autocmd CursorMoved * silent! exe printf("match Search /\\<%s\\>/", expand('<cword>'))

" По Alt-1 редактировать текущее слово
nnoremap <A-1> ciw

" По Alt-5 изменить хвост текущего слова
nnoremap <A-5> cw

" Настройка сворачиваемости блоков кода
set foldenable 			" Включить фолдинг
set foldmethod=indent 	" Определять блоки на основе отступов
set foldcolumn=3		" Ширина полосы управления
set foldlevel=7			" Количество открытых уровней по умолчанию
set foldopen=all		" Автоматическое открытие свёрток при заходе в них

" Хот-кеи для cpp4cf
map <C-l> :CFTemplate<CR>89<C-W>i<C-W>l:e ~/.vim/snippets/content.txt<CR>18ggzMzrgg<C-W>h
map <C-P> :CFPatch<CR>

" Отключаем работу стрелочек
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Позволяем передвигаться с помощью hjkl в Insert mode зажав <Alt>
imap <A-h> <Esc>i
imap <A-j> <C-o>j
imap <A-k> <C-o>k
imap <A-l> <Esc>la

" Оптимизация для RAIC
" map <C-K> :! ./compile-g++.sh
" map <C-L> :! cat compilation.log
" map <C-P> :! ./local-runner.sh & sleep 2 && ./MyStrategy

" Добавляем компиляцию и запуск для С-файлов. Подробности на http://habr.ru/blogs/vim/40369
function! BindF5_C()
	if filereadable("Makefile")
		set makeprg=make
		map <F5> :w!<cr>:make<cr>:cw<cr>
		imap <F5> <esc>:w!<cr>:make<cr>:cw<cr>
	else
		map <F5> :w!<cr>:!g++ -Wall -O2 -fno-optimize-sibling-calls -static % -o %:r -lm<cr>:cw<cr>
		imap <F5> <Esc>:w!<cr>:!g++ -Wall -O2 -fno-optimize-sibling-calls -static % -o %:r -lm<cr>:cw<cr>
	endif
endfunction
au FileType c,cpp,h call BindF5_C()

function! BindF9_C()
	if filereadable("Makefile")
		set makeprg=make
		map <F9> :w!<cr>:make<cr>:cw<cr>:! ./%<<cr>
		imap <F9> <esc>:w!<cr>:make<cr>:cw<cr>:! ./%<<cr>
	else
		map <F9> :w!<cr>:!g++ -Wall -O2 -fno-optimize-sibling-calls -static % -o %:r -lm<cr>:cw<cr>:! ./%<<cr>
		imap <F9> <Esc>:w!<cr>:!g++ -Wall -O2 -fno-optimize-sibling-calls -static % -o %:r -lm<cr>:cw<cr>:! ./%<<cr>
	endif
endfunction
au FileType c,cpp,h call BindF9_C()

