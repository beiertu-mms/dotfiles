return {
  -- https://github.com/nathom/filetype.nvim
  'nathom/filetype.nvim',
  lazy = false,
  config = {
    overrides = {
      extensions = {
        gotmpl = 'helm',
        tf = 'terraform',
        tfvars = 'terraform',
        zsh = 'sh',
      },
      complex = {
        ['.*/templates/*.yaml'] = 'helm',
        ['.*/templates/*.tpl'] = 'helm',
        ['helmfile*.yaml'] = 'helm',
      },
    },
  },
}
