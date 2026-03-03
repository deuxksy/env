--------------------------------------------------------------------------------
-- 자동 명령 (Event Listeners)
--------------------------------------------------------------------------------

-- 파일 타입별 설정 (4스페이스 들여쓰기)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lua", "vim", "javascript", "typescript", "python", "rust", "go" },
    callback = function()
        vim.opt_local.shiftwidth = 4
        vim.opt_local.tabstop = 4
    end,
    desc = "Set indentation to 4 spaces",
})

-- 마지막 커서 위치 복구
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if
            mark[1] > 0
            and mark[1] <= lcount
            and vim.bo.buftype == ""      -- 일반 버퍼만
            and not vim.bo.readonly       -- 읽기 전용 제외
        then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
    desc = "Restore last cursor position",
})
