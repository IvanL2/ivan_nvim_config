return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
        if (vim.treesitter.language.add(lang)) then
          vim.treesitter.start(args.buf, lang)
        end
      end
    })
  end
}
