vim.api.nvim_create_user_command("PackUpdate", function()
    vim.pack.update()
end, { desc = "Update all plugins" })


vim.api.nvim_create_user_command("PackDelete", function(opts)
    vim.pack.del(opts.fargs)
end, { nargs = "+", desc = "Delete plugins (space separated)" })


vim.api.nvim_create_user_command("PackList", function()
    local active = vim.iter(vim.pack.get())
        :filter(function(x) return x.active end)
        :map(function(x) return x.spec.name end)
        :totable()

    if #active == 0 then
        vim.notify("No active plugins!", vim.log.levels.INFO)
        return
    end

    print("Active plugins:\n")
    for _, name in ipairs(active) do
        print(name)
    end

end, { desc = "List active plugins" })


vim.api.nvim_create_user_command("PackCheck", function()
    local inactive = vim.iter(vim.pack.get())
        :filter(function(x) return not x.active end)
        :map(function(x) return x.spec.name end)
        :totable()

    if #inactive == 0 then
        vim.notify("All plugins active!", vim.log.levels.INFO)
        return
    end

    print("Inactive plugins:\n")
    for _, name in ipairs(inactive) do
        print(name)
    end

    local choice = vim.fn.confirm("Delete all inactive plugins?", "&Yes\n&No", 2)

    if choice == 1 then
        vim.pack.del(inactive)
        vim.notify("Deleted " .. #inactive .. " plugin(s).", vim.log.levels.INFO)
        vim.api.nvim_exec_autocmds("User", { pattern = "PackChanged" })
    else
        vim.notify("Deletion cancelled.", vim.log.levels.INFO)
    end

end, { desc = "List inactive plugins, and choose to delete" })

