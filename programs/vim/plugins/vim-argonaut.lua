require('argonaut').setup({
    brace_last_indent = false,
    brace_last_wrap = true,
    brace_pad = false,
    by_filetype = {
      json = {comma_last = false},
    },
    comma_last = true,
    comma_prefix = false,
    comma_prefix_indent = false,
    limit_cols = 512,
    limit_rows = 64,
})

vim.keymap.set('n', '<leader>w', ':<c-u>ArgonautToggle<cr>', {noremap = true, silent = true})
