local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")

-- Capabilities for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.default_capabilities(capabilities)

-- Servers to install with Mason
mason_lspconfig.setup({
  ensure_installed = {
    "html",
    "cssls",
    "ts_ls",
    "jdtls",
  },
})

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
    })
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
})

-- Replace signs with clean icons (or no icons)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Enable inlay hints safely
if vim.lsp.inlay_hint then
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      local buf = args.buf
      if client and client.server_capabilities.inlayHintProvider then
        pcall(function()
          vim.lsp.inlay_hint.enable(buf, true)
        end)
      end
    end,
  })
end