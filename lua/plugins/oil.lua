return {
    { -- Important keymap: open help window with g?
            "stevearc/oil.nvim",
            opts = {
                columns = {
                    -- "icon",
                    "permissions",
                    "size",
                    "mtime",
                },

                delete_to_trash = true,
            },
            lazy = false,
        },
}
