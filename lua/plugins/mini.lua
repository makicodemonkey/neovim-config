return {
    {
            "nvim-mini/mini.nvim",
            config = function()
                vim.cmd("colorscheme minicyan")

                local statusline = require("mini.statusline")
                statusline.setup({ use_icons = vim.g.have_nerd_font })
                statusline.section_location = function()
                    return "%2l:%-2v"
                end

                local pick = require("mini.pick")
                pick.setup({ source = { show = pick.default_show } })
                vim.keymap.set("n", "<leader>sf", "<CMD>Pick files<CR>", { desc = "[S]earch [F]iles" })
                vim.keymap.set("n", "<leader>sg", "<CMD>Pick grep_live<CR>", { desc = "[S]earch [G]rep" })
                vim.keymap.set("n", "<leader>sh", "<CMD>Pick help<CR>", { desc = "[S]earch [H]elp" })
                vim.keymap.set("n", "<leader>sr", "<CMD>Pick resume<CR>", { desc = "[S]earch [R]esume" })
            end,
        },
}
