function ColorMyPencils(color)
	color = color or 'monokai-pro'
	vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Directory", { fg = "#F8F8F2", bg = "none" }) -- Adjust color as needed
    vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#F8F8F2", bg = "none" }) -- Adjust color as needed
    vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#F8F8F2", bg = "none" }) -- Adjust color as needed
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#F8F8F2", bg = "none" }) -- Set a visible color for floating borders
   --  vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#F8F8F2", bg = "none" }) -- Adjust color for window separators

    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NonText', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
end

ColorMyPencils()


