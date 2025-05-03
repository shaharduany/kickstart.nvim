-- Autoformat
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>fb',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = 'n',
      desc = '[F]ormat [b]uffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timout_ms = 1000, lsp_format = 'fallback' }
    end,
    formatters_by_ft = {
      lua = { 'stylua', stop_after_first = true },
      python = { 'isort', 'black', stop_after_first = true },
      javascript = { 'prettier', 'prettierd', stop_after_first = true },
    },
  },
}
