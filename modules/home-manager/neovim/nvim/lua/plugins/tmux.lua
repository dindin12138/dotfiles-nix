return {
  "aserowy/tmux.nvim",
  enabled = os.getenv("TMUX") ~= nil,
  event = { "BufReadPost", "BufNewFile" },
  config = true,
}
