return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true,
        cmd = "ToggleTerm",
        keys = {
            {
                "<leader>th",
                "<cmd>ToggleTerm direction=horizontal<cr>",
                desc = "Horizontal Terminal (cwd)",
            },
        },
    },
}
