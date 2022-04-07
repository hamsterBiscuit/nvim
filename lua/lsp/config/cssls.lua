local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
  capabilities = capabilities
}

return {
  opts = opts,
  on_setup = function(server)
    server:setup(opts)
  end
}
