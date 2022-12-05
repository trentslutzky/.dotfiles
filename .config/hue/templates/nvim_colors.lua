#[target] /Users/trent/.config/nvim/lua/colors.lua

local set = vim.opt
local cmd = vim.cmd

cmd('syntax on')
set.termguicolors = true

cmd('colorscheme onehalfdark')
set.background = 'dark'

local function gen_highlghts(highlights)
  for name,h in pairs(highlights) do
    local command = "hi " .. name
    if h["fg"] ~= nil then
      command = command .. " guifg=" .. h["fg"]
    end
    if h["bg"] ~= nil then
      command = command .. " guibg=" .. h["bg"]
    end
    if h["gui"] ~= nil then
      command = command .. " gui=" .. h["gui"]
    end
    cmd(command)
  end
end

local bg_0 = "{{background}}"
local bg_1 = "{{background1}}"
local bg_2 = "{{background2}}"
local bg_3 = "{{background3}}"

local foreground = "{{foreground}}"
local foreground1 = "{{foreground1}}"
local foreground2 = "{{foreground2}}"

local red = "{{color1}}"
local green = "{{color2}}"
local yellow = "{{color3}}"
local blue = "{{color4}}"
local magenta = "{{color5}}"
local cyan = "{{color6}}"

local highlghts = {

  Normal = {fg = foreground, bg = bg_0 },
  String = { fg = green },
  Character = { fg = yellow },
  Function = { fg = blue },
  Special = { fg = blue },
  Number = { fg = yellow },
  Constant = { fg = cyan },
  Float = { fg = yellow },
  Boolean = { fg = yellow },
  PreProc = { fg = yellow },
  PreCondit = { fg = yellow },
  Type = { fg = yellow },
  Typedef = { fg = yellow },
  Structure = { fg = yellow },
  StorageClass = { fg = yellow },
  Include = { fg = magenta },
  Statement = { fg = magenta },
  Todo = { fg = magenta },
  Conditional = { fg = magenta },
  Exception = { fg = magenta },
  Define = { fg = magenta },
  Label = { fg = magenta },
  Macro = { fg = magenta },
  Repeat = { fg = magenta },
  Identifier = { fg = red },
  Keyword = { fg = red },

  NormalFloat = {
    bg = bg_1,
    fg = blue,
  },

  -- bufferline

  BufferLineFill = {
    bg = bg_0,
  },

  BufferLineBackground = {
    fg = foreground,
    bg = bg_1,
  },

  BufferLineCloseButton = {
    fg = foreground,
    bg = bg_1,
  },

  BufferLineCloseButtonSelected = {
    fg = green,
    bg = bg_2,
  },

  BufferLineBufferSelected = {
    fg = green,
    bg = bg_2,
    gui = "bold",
  },

  BufferLineModified = {
    fg = green,
    bg = bg_1,
  },

  BufferLineModifiedSelected = {
    fg = green,
    bg = bg_2,
  },

  BufferLineSeparator = {
    fg = bg_0,
    bg = bg_1,
  },

  BufferLineSeparatorVisible = {
    fg = bg_0,
    bg = bg_1,
  },

  BufferLineSeparatorSelected = {
    fg = bg_0,
    bg = bg_2,
  },

  Visual = {
    bg = bg_3,
  },

  -- telescope

  TelescopeNormal = {
    bg = bg_1,
  },

  TelescopeSelection = {
    bg = bg_2,
  },

  TelescopeBorder = {
    fg = bg_1,
    bg = bg_1,
  },

  TelescopePreviewNormal = {
    bg = bg_2,
  },

  TelescopePreviewLine = {
    bg = bg_3,
    fg = blue,
    gui = "bold",
  },

  TelescopePreviewTitle = {
    fg = green,
    bg = bg_2,
    gui = "bold",
  },

  TelescopeResultsTitle = {
    fg = yellow,
    bg = bg_1,
    gui = "bold",
  },

  TelescopePreviewBorder = {
    fg = bg_2,
    bg = bg_2,
  },

  TelescopePromptNormal = {
    bg = bg_3,
  },

  TelescopePromptBorder = {
    bg = bg_3,
    fg = bg_3,
  },

  TelescopePromptTitle = {
    bg = bg_3,
    fg = yellow,
  },

  TelescopePromptCounter = {
    bg = bg_3,
    fg = yellow,
  },

  -- lsp diagnostics

  DiagnosticError = { fg = red },
  DiagnosticWarn = { fg = yellow },
  DiagnosticHint = { fg = yellow },
  DiagnosticInfo = { fg = yellow },

  -- search highlighting
  --
  Search = {
    fg = bg_0,
    bg = yellow,
  },

  HlSearchNear = {
    fg = yellow,
    bg = bg_0,
  },

  HlSearchFloat = {
    fg = magenta,
    bg = bg_0,
  },

  HlSearchLens = {
    fg = magenta,
    bg = bg_0,
  },

  HlSearchLensNear = {
    fg = green,
    bg = bg_2,
  },

  -- cursorline

  Cursorline = {
    gui = "bold",
    bg = bg_1,
  },

  CursorlineNr = {
    gui = "bold",
    fg = foreground,
  },

  -- line numbers

  LineNr = {
    gui = "bold",
    bg = "none",
    fg = bg_3,
  },
  LineNrAbove = {
    gui = "bold",
    bg = "none",
    fg = bg_2,
  },
  LineNrBelow = {
    gui = "bold",
    bg = "none",
    fg = bg_2,
  },

  -- nvim tree

  NvimTreeNormal = {
    bg = bg_1,
  },

  NvimTreeCursorLine = {
    bg = bg_2,
  },

  NvimTreeWinSeparator = {
    bg = bg_1,
    fg = bg_1,
  },

  -- octo

  OctoEditable = {
    bg = bg_1,
  },

  OctoIssueId = {
    bg = bg_1,
    fg = yellow,
  },

  OctoStateOpenFloat = {
    bg = bg_1,
    fg = green,
  },

  OctoStateClosedFloat = {
    bg = bg_1,
    fg = red,
  },

  OctoStateMergedFloat = {
    bg = bg_1,
    fg = cyan,
  },

  OctoUser = {
    bg = bg_2,
    fg = cyan,
  },

  OctoUserViewer = {
    bg = bg_2,
    fg = green,
  },

  -- indentline

  IndentBlankLineChar = {
    fg = bg_2
  },

  -- comments

  Comment = {
    fg = foreground2,
  },

  Operator = {
    fg = yellow,
  },

  -- scrollbar
  
  ScrollbarHandle = {
    bg = bg_1
  },

  ScrollbarErrorHandle = {
    bg = bg_1
  },

  ScrollbarSearchHandle = {
    bg = bg_1
  },

  ScrollbarInfoHandle = {
    bg = bg_1
  },

  ScrollbarHintHandle = {
    bg = bg_1
  },

  ScrollbarWarnHandle = {
    bg = bg_1
  },

  ScrollbarMiscHandle = {
    bg = bg_1
  }

}

-- gitsigns
cmd('hi GitSignsAdd cterm=bold gui=bold guibg=none guifg='..green)
cmd('hi GitSignsAddNr cterm=bold gui=bold guibg=none guifg='..green)
cmd('hi GitSignsChange cterm=bold gui=bold guibg=none guifg='..yellow)
cmd('hi GitSignsChangeNr cterm=bold gui=bold guibg=none guifg='..yellow)
cmd('hi GitSignsDelete cterm=bold gui=bold guibg=none guifg='..red)
cmd('hi GitSignsDeleteNr cterm=bold gui=bold guibg=none guifg='..red)

gen_highlghts(highlghts)

