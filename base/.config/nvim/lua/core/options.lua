--------------------------------------------------------------------------------
-- 기본 옵션 (Environment Properties)
--------------------------------------------------------------------------------
local opt = vim.opt
local health = require("core.health")

-- 행 번호
opt.number = true
opt.relativenumber = false

-- 들여쓰기
opt.autoindent = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.smartindent = true

-- 검색
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- 표시
opt.list = true
opt.showmatch = true
opt.wrap = false
opt.cursorline = true
opt.scrolloff = 5
opt.sidescrolloff = 5

-- 색상
opt.termguicolors = true
opt.fileencodings = "utf-8"

-- 마우스
opt.mouse = ""

-- 기록
opt.history = 1000

-- Shada (리소스 최적화)
opt.shada = "!,'100,<50,s10,h"

-- 백업/스왑 (비활성화 - 모던 에디터 방식)
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Undo 파일 (영구 지원)
local undodir = vim.fn.stdpath("data") .. "/undo"
if not vim.loop.fs_stat(undodir) then
    vim.fn.mkdir(undodir, "p")
end
opt.undofile = true
opt.undodir = undodir

-- 완성 메뉴
opt.completeopt = { "menu", "menuone", "noselect" }

-- 업데이트 시간 (LSP 대기 시간 단축)
opt.updatetime = 300

-- Sign 컬럼 (Git gitsigns 등을 위한 공간 확보)
opt.signcolumn = "yes"

-- 폴드 방식 (treesitter 사용)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldenable = false

-- 크로스 플랫폼: 클립보드
if health.is_mac then
    opt.clipboard = "unnamed"
else  -- Windows/Linux
    opt.clipboard = "unnamedplus"
end

-- 크로스 플랫폼: Shell 설정
if health.is_windows then
    if vim.fn.executable("pwsh") > 0 then
        opt.shell = "pwsh"
        opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
        opt.shellquote = '"'
        opt.shellxquote = ""
    else
        opt.shell = "cmd.exe"
    end
else  -- macOS/Linux
    local shells = { "zsh", "bash" }
    for _, shell in ipairs(shells) do
        if vim.fn.executable(shell) > 0 then
            opt.shell = shell
            break
        end
    end
end
