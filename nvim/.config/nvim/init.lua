--------------------------------------------------------------------------------
-- 진입점: 모듈 로드 및 lazy.nvim 부트스트랩
--------------------------------------------------------------------------------

-- 1. Core 모듈 로드 (기본 설정, 키매핑, 자동 명령)
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- 2. lazy.nvim 부트스트랩
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    -- Git 실행 가능성 확인
    if vim.fn.executable("git") == 0 then
        vim.notify("Git이 설치되지 않았습니다. lazy.nvim을 사용하려면 Git이 필요합니다.", vim.log.levels.ERROR)
        return
    end

    -- lazy.nvim 클론
    local clone_ok, clone_result = pcall(vim.fn.system, {
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
    })

    if not clone_ok or vim.v.shell_error ~= 0 then
        vim.notify("lazy.nvim 클론 실패: " .. tostring(clone_result), vim.log.levels.ERROR)
        return
    end

    vim.notify("lazy.nvim이 설치되었습니다. Neovim을 재시작해주세요.", vim.log.levels.INFO)
    return
end

vim.opt.rtp:prepend(lazypath)

-- 3. Plugin Manager 로드
local lazy_ok, lazy = pcall(require, "lazy")
if not lazy_ok then
    vim.notify("lazy.nvim 로드 실패", vim.log.levels.ERROR)
    return
end

lazy.setup("plugins")

-- 4. 테마 적용 (안전한 로드)
local theme_ok, _ = pcall(vim.cmd, 'colorscheme solarized')
if not theme_ok then
    vim.notify("Solarized 테마를 찾을 수 없습니다. 기본 테마를 사용합니다.", vim.log.levels.WARN)
    vim.cmd('colorscheme default')
end
