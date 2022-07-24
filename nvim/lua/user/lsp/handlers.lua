local M = {}

M.setup = function()

vim.cmd [[
  highlight DiagnosticLineNrError guifg=#FB4934 guibg=#282828 gui=bold
  highlight DiagnosticLineNrWarn  guifg=#FE8019 guibg=#282828 gui=bold
  highlight DiagnosticLineNrInfo  guifg=#83A598 guibg=#282828 gui=bold
  highlight DiagnosticLineNrHint  guifg=#8EC07C guibg=#282828 gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn  text= texthl=DiagnosticSignWarn  linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo  text= texthl=DiagnosticSignInfo  linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint  text= texthl=DiagnosticSignHint  linehl= numhl=DiagnosticLineNrHint
]]

local config = {
  -- disable virtual text
  virtual_text     = false,
  -- show signs
  update_in_insert = true,
  underline        = false,
  severity_sort    = true,
  float = {
    focusable = false,
    style     = "minimal",
    border    = "rounded",
    source    = "always",
    header    = "",
    prefix    = "q",
  },
}

vim.diagnostic.config(config)

end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local map  = vim.api.nvim_buf_set_keymap

  map(bufnr, "n", "gD",        "<cmd>lua vim.lsp.buf.declaration()<CR>",                        opts)
  map(bufnr, "n", "gd",        "<cmd>lua vim.lsp.buf.definition()<CR>",                         opts)
  map(bufnr, "n", "K",         "<cmd>lua vim.lsp.buf.hover()<CR>",                              opts)
  map(bufnr, "n", "gi",        "<cmd>lua vim.lsp.buf.implementation()<CR>",                     opts)
  map(bufnr, "n", "gr",        "<cmd>lua vim.lsp.buf.references()<CR>",                         opts)
  map(bufnr, "n", "[d",        '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  map(bufnr, "n", "]d",        '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  map(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>",                      opts)
  map(
    bufnr,
    "n",
    "gl",
    '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>',
    opts
  )

  -- map(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>",        opts)
  -- map(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>",   opts)
  -- map(bufnr, "n", "<leader>f",  "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]

end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
