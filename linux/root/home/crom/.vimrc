set nocompatible                               " be iMproved, required
filetype off                                   " required
set rtp+=~/.vim/bundle/Vundle.vim              " Plugin 위치
call vundle#begin()                            " Plugin 시작

                                               " https://vimawesome.com
Plugin 'VundleVim/Vundle.vim'                  " Plugin 관리자
Plugin 'tpope/vim-fugitive'                    "
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}     "

Plugin 'godlygeek/tabular'                     "
Plugin 'plasticboy/vim-markdown'               "
Plugin 'scrooloose/nerdtree'                   " 파일 네비게이션
Plugin 'scrooloose/syntastic'                  "
Plugin 'altercation/vim-colors-solarized'      "

call vundle#end()                              " Plugin 끝
filetype plugin indent on                      

set number                                     "line 표시를 해줍니다.
set ai                                         "auto index
set shiftwidth=4                               "shift를 4칸으로 ( >, >>, <, << 등의 명령어)
set tabstop=4                                  "tab을 4칸으로
set ignorecase                                 "검색시 대소문자 구별하지않음
set hlsearch                                   "검색시 하이라이트(색상 강조)
set expandtab                                  "tab 대신 띄어쓰기로
set background=dark                            "검정배경을 사용할 때, (이 색상에 맞춰 문법 하이라이트 색상이 달라집니다.)
set nocompatible                               "방향키로 이동가능
set fileencodings=utf-8                        "파일인코딩 형식 지정
set bs=indent,eol,start                        "backspace 키 사용 가능
set history=1000                               "명령어에 대한 히스토리를 1000개까지
set ruler                                      "상태표시줄에 커서의 위치 표시                       
set title                                      "제목을 표시
set showmatch                                  "매칭되는 괄호를 보여줌
set nowrap                                     "자동 줄바꿈 하지 않음
set wmnu                                       "tab 자동완성시 가능한 목록을 보여
set laststatus=2                               "상태바 표시를 항상한다
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\ 
set paste                                      "분여넣기 계단현상 없애기
" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" 구문 강조 사용
if has("syntax")
    syntax on
endif
