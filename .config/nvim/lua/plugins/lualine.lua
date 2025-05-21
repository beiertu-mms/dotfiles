return {
  'nvim-lualine/lualine.nvim', -- https://github.com/nvim-lualine/lualine.nvim
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },
  event = 'VeryLazy',
  config = function()
    local lualine = require('lualine')

    local filetype = {
      'filetype',
      colored = true, -- Displays filetype icon in color if set to true
      icon_only = false, -- Display only an icon for filetype
    }

    local filename = {
      'filename',
      file_status = true, -- Displays file status (readonly status, modified status)
      path = 1, -- 0: Just the filename, 1: Relative path, 2: Absolute path
      shorting_target = 50, -- Shortens path to leave 50 spaces in the window
      symbols = {
        modified = '󰏫',
        readonly = '',
        unnamed = '',
      },
    }

    local function get_active_lsp()
      local msg = ''
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end

    local lsp = {
      get_active_lsp,
      icon = '󰒋',
      color = { fg = 'teal', gui = 'bold' },
    }

    local noice = {
      require('noice').api.statusline.mode.get,
      cond = require('noice').api.statusline.mode.has,
      color = { fg = '#ff9e64' },
    }

    local custom_onedark = require('lualine.themes.onedark')
    custom_onedark.normal.a.bg = '#61AFEF'
    custom_onedark.insert.a.bg = '#98C379'

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = custom_onedark,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'alpha', 'dashboard', 'NvimTree', 'Outline' },
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return ' ' .. str:sub(1, 1) .. ' '
            end,
          },
        },
        lualine_b = { filename, 'diagnostics' },
        lualine_c = { 'diff' },

        lualine_x = { noice, lsp, 'encoding', 'fileformat', filetype },
        lualine_y = { 'branch', 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },

        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}
