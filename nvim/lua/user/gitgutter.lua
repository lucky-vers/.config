vim.cmd[[
  hi GitGutterAdd          guibg=NONE
  hi GitGutterChange       guibg=NONE
  hi GitGutterDelete       guibg=NONE
  hi GitGutterChangeDelete guibg=NONE guifg=#fabd2f

  let g:gitgutter_sign_added                   = '│'
  let g:gitgutter_sign_modified                = '│'
  let g:gitgutter_sign_removed                 = '│'
  let g:gitgutter_sign_removed_first_line      = '│'
  let g:gitgutter_sign_removed_above_and_below = '│'
  let g:gitgutter_sign_modified_removed        = '│'
]]
