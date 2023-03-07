return {
  'lukas-reineke/indent-blankline.nvim', -- https://github.com/lukas-reineke/indent-blankline.nvim
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
  },
}
