require('todo-comments').setup({
  signs = false,
  keywords = {
    Todo = { color = "info" },
  },
  gui_style = {
    fg = "BOLD",
    bg = "BOLD",
  },
  highlight = {
    multiline = false, -- enable multine todo comments
    multiline_pattern = "", -- lua pattern to match the next multiline from the start of the matched keyword
    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
    before = "", -- "fg" or "bg" or empty
    keyword = "fg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    after = "", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  colors = {
    info = { "#DC2626", "#DC2626" },
  },
})
