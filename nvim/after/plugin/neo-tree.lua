require("neo-tree").setup({
    sources = {
        "filesystem"
    },

    source_selector = {
        winbar = true,
        statusline = false, -- muestra la barra de estado en la barra de título
        content_layout = "center",
        tabs_layout = "equal",
        show_separator_on_edge = true
    },

    close_if_last_window = true,
    popup_border_style = "rounded",

    default_component_configs = {
        indent ={
            indent_size = 2,
            padding = 1, -- extra padding on left hand side
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
         },

         icon = {
              folder_closed = "",
              folder_open = "",
              folder_empty = "",
              folder_empty_open = "",

              provider = function(icon, node, state) -- default icon provider utilizes nvim-web-devicons if available
              if node.type == "file" or node.type == "terminal" then
                local success, web_devicons = pcall(require, "nvim-web-devicons")
                local name = node.type == "terminal" and "terminal" or node.name
                if success then
                  local devicon, hl = web_devicons.get_icon(name)
                  icon.text = devicon or icon.text
                  icon.highlight = hl or icon.highlight
                 end
                end
             end,
             default = "*",
             highlight = "NeoTreeFileIcon"
          },

         modified = { symbol = "" }, 
         git_status = { symbol = "󰊢" }
     },

    commands = {},
    window = {
        position = "left",
        width = 30,
        mapping_options = {
        noremap = true,
        nowait = true,
     }, 
        mappings = {
            ["%"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
            ["d"] = "delete",
            ["r"] = "rename",
            ["m"] = "move"

        }, 
     },

    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
         },
        use_libuv_file_watcher = true,
        components = {
              name = function(config, node, state)
                local name = require("neo-tree.sources.filesystem.components").name(config, node, state)  -- Obtiene el componente de nombre por defecto
                if node:get_depth() == 1 then
                  -- Si estamos en el primer nivel, mostramos solo el nombre de la carpeta raíz
                  name.text = vim.fn.fnamemodify(vim.loop.cwd(), ":t")
                end
                return name
              end,
            },
    },

})

vim.api.nvim_set_keymap('n', '<C-n>', ':Neotree toggle<CR>', { noremap = true, silent = true })

