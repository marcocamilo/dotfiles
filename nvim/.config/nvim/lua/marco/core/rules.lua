vim.filetype.add({
  pattern = {
    [".*%.env.*"] = "sh",  -- maps .env, .env.prod, .env.dev → sh
  },
})

-- Enable LSP codelens auto-refresh only for markdown buffers
local function codelens_supported(bufnr)
  for _, c in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
    if c.server_capabilities and c.server_capabilities.codeLensProvider then
      return true
    end
  end
  return false
end
-- Refresh codelens only when the current buffer is markdown and the attached client supports it
local function refresh_markdown_codelens(bufnr)
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end
  if vim.bo[bufnr].buftype ~= "" then
    return
  end
  if vim.bo[bufnr].filetype ~= "markdown" then
    return
  end
  if not codelens_supported(bufnr) then
    return
  end
  vim.lsp.codelens.refresh({ bufnr = bufnr })
end
-- Create markdown-only codelens refresh triggers
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave", "TextChanged" }, {
  callback = function(args)
    refresh_markdown_codelens(args.buf)
  end,
})
