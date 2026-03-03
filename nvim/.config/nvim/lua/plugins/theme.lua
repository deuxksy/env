--------------------------------------------------------------------------------
-- 테마 설정 (solarized.nvim)
--------------------------------------------------------------------------------
return {
    {
        "maxmx03/solarized.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("solarized").setup({
                variant = "autumn",
                transparent = {
                    enabled = false,
                },
                styles = {
                    comments = { italic = true },
                    keywords = { bold = true },
                },
            })
            vim.cmd.colorscheme("solarized")
        end,
    },
}
