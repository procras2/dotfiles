return {
  {
    "praem90/nvim-phpcsf",
    config = function()
      vim.g.nvim_phpcs_config_phpcs_pat = 'phpcs'
      vim.g.nvim_phpcs_config_phpcbf_path = 'phphcbf'
      vim.g.nvim_phpcs_config_phpcs_standard = 'Wordpress'
    end
  },
}
