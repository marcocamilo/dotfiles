vim.filetype.add({
  pattern = {
    [".*%.env.*"] = "sh",  -- maps .env, .env.prod, .env.dev → sh
  },
})
