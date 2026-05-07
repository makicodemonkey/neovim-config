vim.pack.add({
    "https://github.com/folke/which-key.nvim",
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/stevearc/oil.nvim",
})


require("which-key").setup({
    delay = 0,
    icons = {
        mappings = vim.g.have_nerd_font,
        keys = vim.g.have_nerd_font and {} or {
            Up = "<Up> ",
            Down = "<Down> ",
            Left = "<Left> ",
            Right = "<Right> ",
            C = "<C-…> ",
            M = "<M-…> ",
            D = "<D-…> ",
            S = "<S-…> ",
            CR = "<CR> ",
            Esc = "<Esc> ",
            ScrollWheelDown = "<ScrollWheelDown> ",
            ScrollWheelUp = "<ScrollWheelUp> ",
            NL = "<NL> ",
            BS = "<BS> ",
            Space = "<Space> ",
            Tab = "<Tab> ",
            F1 = "<F1>",
            F2 = "<F2>",
            F3 = "<F3>",
            F4 = "<F4>",
            F5 = "<F5>",
            F6 = "<F6>",
            F7 = "<F7>",
            F8 = "<F8>",
            F9 = "<F9>",
            F10 = "<F10>",
            F11 = "<F11>",
            F12 = "<F12>",
        },
    },
    spec = {
        { "<leader>s", group = "[S]earch", mode = { "n" } },
    }
})


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


require("oil").setup({
    columns = {
        -- "icon",
        "permissions",
        "size",
        "mtime",
    },
    delete_to_trash = true,
})

