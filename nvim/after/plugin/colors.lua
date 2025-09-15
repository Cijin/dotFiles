-- Function to set transparent background
function set_transparency()
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "NonText", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", ctermbg = "NONE" })
  -- Add inlay hint highlight groups for transparency
  vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "NONE", ctermbg = "NONE", bold = true })
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
