vim.g.mapleader = " "
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.hlsearch = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 10				-- scroll page when cursor is 10 lines from top/bottom
vim.opt.sidescrolloff = 8				-- scroll page when cursor is 8 spaces from left/right
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

-- simpler than runnig it every time
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.templ",
  callback = function()
    vim.cmd("silent !templ fmt .")
    vim.cmd("edit!")
  end,
})

-- grep
vim.keymap.set("n", "<leader>ps", function()
    vim.ui.input({ prompt = "grep: " }, function(input)
        if not input then return end
        local results = vim.fn.systemlist("grep -rn " .. vim.fn.shellescape(input) .. " .")
        if vim.v.shell_error ~= 0 then return end
        vim.fn.setqflist({}, "r", {
            title = "grep: " .. input,
            lines = results,
            efm = "%f:%l:%m"
        })
        vim.cmd("copen")
    end)
end)

-- find file
vim.keymap.set("n", "<leader>pf", function()
    vim.ui.input({ prompt = "find: " }, function(input)
        if not input then return end
        local results = vim.fn.systemlist("find " .. vim.fn.getcwd() .. " -type f -not -path '*/.git/*' -name " .. vim.fn.shellescape(input))
        if vim.v.shell_error ~= 0 then return end
        vim.fn.setqflist({}, "r", {
            title = "find: " .. input,
            lines = results,
            efm = "%f"
        })
        vim.cmd("copen")
    end)
end)
