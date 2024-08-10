return {
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                options = {
                    section_separators = { left = "", right = "" },
                },
            }
        end,
    },
}
