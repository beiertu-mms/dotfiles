return {
  'numToStr/Comment.nvim', -- https://github.com/numToStr/Comment.nvim
  keys = {
    -- Line-comment toggle keymap
    { 'gcc', mode = 'n' },
    { 'gcc', mode = 'v' },
    -- Block-comment toggle keymap
    { 'gbc', mode = 'n' },
    { 'gbc', mode = 'v' },
    -- Add comment on the line above
    { 'gcO', mode = 'n' },
    -- Add comment on the line below
    { 'gco', mode = 'n' },
    -- Add comment at the end of line
    { 'gcA', mode = 'n' },
  },
  config = true,
}
