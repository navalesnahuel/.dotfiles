-- Lightline configuration
-- Set the colorscheme for Lightline
vim.g.lightline = {
  colorscheme = 'monokai-pro', -- Change to any theme you like, e.g., 'tokyonight', 'gruvbox', etc.
  tabline = {
    left = { { 'tabs' } },
    right = { { 'lineinfo' }, { 'percent' }, { 'fileformat' }, { 'fileencoding' }, { 'filetype' }, { 'devicons' } }
  }
}

-- Define the function to list tabs
function _G.LightlineTabs()
  local tabs = ""
  local num_tabs = vim.fn.tabpagenr('$')
  for i = 1, num_tabs do
    local tab_name = " " .. i .. ": " .. vim.fn.bufname(vim.fn.tabpagebuflist(i)[1])
    if i == vim.fn.tabpagenr() then
      tabs = tabs .. "%#TabLineSel#" .. tab_name .. " "
    else
      tabs = tabs .. "%#TabLine#" .. tab_name .. " "
    end
  end
  return tabs
end

