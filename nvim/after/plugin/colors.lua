-- Function to set transparent background
function set_transparency()
  vim.cmd("highlight Normal ctermbg=none guibg=none")
  vim.cmd("highlight NonText ctermbg=none guibg=none")
  vim.cmd("highlight LineNr ctermbg=none guibg=none")
end


function ColorMyPencil(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme = color

  set_transparency()
end

ColorMyPencil()

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_transparency,
})
