--[[ Setting up plugins ]]
-- Setup lazy.nvim
require("lazy").setup({
    require("plugins.which-key"),
    require("plugins.mini"),
    require("plugins.oil"),
}, {
    install = { colorscheme = { "lunaperche" } },
    ui = {
        icons = vim.g.have_nerd_font and {} or {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            task = "📌",
            lazy = "💤 ",
        },
    },
})
