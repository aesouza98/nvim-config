require('telescope').setup {
  extensions = {
    project = {
      hidden_files = true, -- default: false
      theme = "darkplus",
      order_by = "recent",
      sync_with_nvim_tree = true, -- default false
    }
  }
}
pcall(require('telescope').load_extension, 'fzf')
