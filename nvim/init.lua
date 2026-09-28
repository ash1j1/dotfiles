vim.cmd("syntax on")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.wildmenu = true
vim.opt.swapfile = false
vim.opt.errorbells = false

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(event)
    local data = event.data
    if data.spec.name == "fzf" and (data.kind == "install" or data.kind == "update") then
      vim.system({ "./install", "--bin" }, { cwd = data.path }):wait()
    end
  end,
})

vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/junegunn/fzf",
})

-- vim.api.nvim_set_hl(0, "LineNr", { fg = "#808080" })
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#ffffff", bold = true })

for _, group in ipairs({ "LineNr", "LineNrAbove", "LineNrBelow" }) do
  vim.api.nvim_set_hl(0, group, {
    fg = "#c8d0e0",
  })
end

vim.api.nvim_set_hl(0, "CursorLineNr", {
  fg = "#ffd75f",
  bold = true,
})
