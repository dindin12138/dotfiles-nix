-- Wrapper around vim.keymap.set that will
-- not create a keymap if a lazy key handler exists.
-- It will also set `silent` to true by default.
-- local function map(mode, lhs, rhs, opts)
--   local keys = require("lazy.core.handler").handlers.keys
--   ---@cast keys LazyKeysHandler
--   local modes = type(mode) == "string" and { mode } or mode
--
--   ---@param m string
--   modes = vim.tbl_filter(function(m)
--     return not (keys.have and keys:have(lhs, m))
--   end, modes)
--
--   -- do not create the keymap if a lazy keys handler exists
--   if #modes > 0 then
--     opts = opts or {}
--     opts.silent = opts.silent ~= false
--     if opts.remap and not vim.g.vscode then
--       ---@diagnostic disable-next-line: no-unknown
--       opts.remap = nil
--     end
--     vim.keymap.set(modes, lhs, rhs, opts)
--   end
-- end

-- better up/down
-- map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
-- map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
-- map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
-- map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
-- map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
-- map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
-- map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
-- map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
-- map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines & better indenting
-- map("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- map("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
-- map("v", "<", "<gv", { desc = "Indent forward" })
-- map("v", ">", ">gv", { desc = "Indent backward" })

-- buffers
-- map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
-- map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
-- map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
-- map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
-- map("n", "<leader>q", "<cmd>Bdelete!<cr>", { desc = "Delete buffer" })
-- map("n", "<leader>x", "<cmd>BufferLinePickClose<cr>", { desc = "Close the selected buffer" })

-- Clear search with <esc>
-- map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- save file
-- map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
-- map({ "i", "x", "n", "s" }, "W", "<cmd>w<cr><esc>", { desc = "Save file" })
-- quit quickly
-- map("n", "Q", "<cmd>qa<cr>", { desc = "Quit all" })

-- windows
-- map("n", "<leader>sj", "<C-W>s", { desc = "Split window below", remap = true })
-- map("n", "<leader>sl", "<C-W>v", { desc = "Split window right", remap = true })

-- lazy
-- map("n", "<leader>lz", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Neotree
-- map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Explorer NeoTree" })

-- Telescope
-- map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
-- map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
-- map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
-- map(
--   "n",
--   "<leader>fa",
--   "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<cr>",
--   { desc = "Find all files" }
-- )
-- map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Oldfiles" })
-- map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help page" })
-- map("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Git commits" })
-- map("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
-- map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
local whichkey = {
  show = function()
    vim.fn.VSCodeNotify("whichkey.show")
  end,
}

local comment = {
  selected = function()
    vim.fn.VSCodeNotifyRange("editor.action.commentLine", vim.fn.line("v"), vim.fn.line("."), 1)
  end,
}

local file = {
  new = function()
    vim.fn.VSCodeNotify("workbench.explorer.fileView.focus")
    vim.fn.VSCodeNotify("explorer.newFile")
  end,

  save = function()
    vim.fn.VSCodeNotify("workbench.action.files.save")
  end,

  saveAll = function()
    vim.fn.VSCodeNotify("workbench.action.files.saveAll")
  end,

  format = function()
    vim.fn.VSCodeNotify("editor.action.formatDocument")
  end,

  showInExplorer = function()
    vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
  end,

  rename = function()
    vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
    vim.fn.VSCodeNotify("renameFile")
  end,
}

local error = {
  list = function()
    vim.fn.VSCodeNotify("workbench.actions.view.problems")
  end,
  next = function()
    vim.fn.VSCodeNotify("editor.action.marker.next")
  end,
  previous = function()
    vim.fn.VSCodeNotify("editor.action.marker.prev")
  end,
}

local editor = {
  closeActive = function()
    vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
  end,

  closeOther = function()
    vim.fn.VSCodeNotify("workbench.action.closeOtherEditors")
  end,

  organizeImport = function()
    vim.fn.VSCodeNotify("editor.action.organizeImports")
  end,
}

local workbench = {
  showCommands = function()
    vim.fn.VSCodeNotify("workbench.action.showCommands")
  end,
  previousEditor = function()
    vim.fn.VSCodeNotify("workbench.action.previousEditor")
  end,
  nextEditor = function()
    vim.fn.VSCodeNotify("workbench.action.nextEditor")
  end,
}

local toggle = {
  toggleActivityBar = function()
    vim.fn.VSCodeNotify("workbench.action.toggleActivityBarVisibility")
  end,
  toggleSideBarVisibility = function()
    vim.fn.VSCodeNotify("workbench.action.toggleSidebarVisibility")
  end,
  toggleZenMode = function()
    vim.fn.VSCodeNotify("workbench.action.toggleZenMode")
  end,
  theme = function()
    vim.fn.VSCodeNotify("workbench.action.selectTheme")
  end,
}

local symbol = {
  rename = function()
    vim.fn.VSCodeNotify("editor.action.rename")
  end,
}

-- if bookmark extension is used
local bookmark = {
  toggle = function()
    vim.fn.VSCodeNotify("bookmarks.toggle")
  end,
  list = function()
    vim.fn.VSCodeNotify("bookmarks.list")
  end,
  previous = function()
    vim.fn.VSCodeNotify("bookmarks.jumpToPrevious")
  end,
  next = function()
    vim.fn.VSCodeNotify("bookmarks.jumpToNext")
  end,
}

local search = {
  reference = function()
    vim.fn.VSCodeNotify("editor.action.referenceSearch.trigger")
  end,
  referenceInSideBar = function()
    vim.fn.VSCodeNotify("references-view.find")
  end,
  project = function()
    vim.fn.VSCodeNotify("editor.action.addSelectionToNextFindMatch")
    vim.fn.VSCodeNotify("workbench.action.findInFiles")
  end,
  text = function()
    vim.fn.VSCodeNotify("workbench.action.findInFiles")
  end,
}

local project = {
  findFile = function()
    vim.fn.VSCodeNotify("workbench.action.quickOpen")
  end,
  switch = function()
    vim.fn.VSCodeNotify("workbench.action.openRecent")
  end,
  tree = function()
    vim.fn.VSCodeNotify("workbench.view.explorer")
  end,
}

local git = {
  init = function()
    vim.fn.VSCodeNotify("git.init")
  end,
  status = function()
    vim.fn.VSCodeNotify("workbench.view.scm")
  end,
  switch = function()
    vim.fn.VSCodeNotify("git.checkout")
  end,
  deleteBranch = function()
    vim.fn.VSCodeNotify("git.deleteBranch")
  end,
  push = function()
    vim.fn.VSCodeNotify("git.push")
  end,
  pull = function()
    vim.fn.VSCodeNotify("git.pull")
  end,
  fetch = function()
    vim.fn.VSCodeNotify("git.fetch")
  end,
  commit = function()
    vim.fn.VSCodeNotify("git.commit")
  end,
  publish = function()
    vim.fn.VSCodeNotify("git.publish")
  end,

  -- if gitlens installed
  graph = function()
    vim.fn.VSCodeNotify("gitlens.showGraphPage")
  end,
}

local fold = {
  toggle = function()
    vim.fn.VSCodeNotify("editor.toggleFold")
  end,

  all = function()
    vim.fn.VSCodeNotify("editor.foldAll")
  end,
  openAll = function()
    vim.fn.VSCodeNotify("editor.unfoldAll")
  end,

  close = function()
    vim.fn.VSCodeNotify("editor.fold")
  end,
  open = function()
    vim.fn.VSCodeNotify("editor.unfold")
  end,
  openRecursive = function()
    vim.fn.VSCodeNotify("editor.unfoldRecursively")
  end,

  blockComment = function()
    vim.fn.VSCodeNotify("editor.foldAllBlockComments")
  end,

  allMarkerRegion = function()
    vim.fn.VSCodeNotify("editor.foldAllMarkerRegions")
  end,
  openAllMarkerRegion = function()
    vim.fn.VSCodeNotify("editor.unfoldAllMarkerRegions")
  end,
}

local vscode = {
  focusEditor = function()
    vim.fn.VSCodeNotify("workbench.action.focusActiveEditorGroup")
  end,
  moveSideBarRight = function()
    vim.fn.VSCodeNotify("workbench.action.moveSideBarRight")
  end,
  moveSideBarLeft = function()
    vim.fn.VSCodeNotify("workbench.action.moveSideBarLeft")
  end,
}

local refactor = {
  showMenu = function()
    vim.fn.VSCodeNotify("editor.action.refactor")
  end,
}

-- https://vi.stackexchange.com/a/31887
local nv_keymap = function(lhs, rhs)
  vim.api.nvim_set_keymap("n", lhs, rhs, { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", lhs, rhs, { noremap = true, silent = true })
end

local nx_keymap = function(lhs, rhs)
  vim.api.nvim_set_keymap("n", lhs, rhs, { silent = true })
  vim.api.nvim_set_keymap("v", lhs, rhs, { silent = true })
end

--#region keymap
vim.g.mapleader = " "

nv_keymap("s", "}")
nv_keymap("S", "{")

nv_keymap("<leader>h", "^")
nv_keymap("<leader>l", "$")
nv_keymap("<leader>a", "%")

nx_keymap("j", "gj")
nx_keymap("k", "gk")

vim.keymap.set({ "n", "v" }, "<leader>", whichkey.show)
vim.keymap.set({ "n", "v" }, "<leader>/", comment.selected)

vim.keymap.set({ "n" }, "<leader>i", editor.organizeImport)

-- no highlight
vim.keymap.set({ "n" }, "<leader>n", "<cmd>noh<cr>")

vim.keymap.set({ "n", "v" }, "<leader> ", workbench.showCommands)

vim.keymap.set({ "n", "v" }, "H", workbench.previousEditor)
vim.keymap.set({ "n", "v" }, "L", workbench.nextEditor)

-- error
vim.keymap.set({ "n" }, "<leader>el", error.list)
vim.keymap.set({ "n" }, "<leader>en", error.next)
vim.keymap.set({ "n" }, "<leader>ep", error.previous)

-- git
vim.keymap.set({ "n" }, "<leader>gb", git.switch)
vim.keymap.set({ "n" }, "<leader>gi", git.init)
vim.keymap.set({ "n" }, "<leader>gd", git.deleteBranch)
vim.keymap.set({ "n" }, "<leader>gf", git.fetch)
vim.keymap.set({ "n" }, "<leader>gs", git.status)
vim.keymap.set({ "n" }, "<leader>gp", git.pull)
vim.keymap.set({ "n" }, "<leader>gg", git.graph)

-- project
vim.keymap.set({ "n" }, "<leader>pf", project.findFile)
vim.keymap.set({ "n" }, "<leader>pp", project.switch)
vim.keymap.set({ "n" }, "<leader>pt", project.tree)

-- file
vim.keymap.set({ "n", "v" }, "<space>w", file.save)
vim.keymap.set({ "n", "v" }, "<space>wa", file.saveAll)
vim.keymap.set({ "n", "v" }, "<space>fs", file.save)
vim.keymap.set({ "n", "v" }, "<space>fS", file.saveAll)
vim.keymap.set({ "n" }, "<space>ff", file.format)
vim.keymap.set({ "n" }, "<space>fn", file.new)
vim.keymap.set({ "n" }, "<space>ft", file.showInExplorer)
vim.keymap.set({ "n" }, "<space>fr", file.rename)

-- buffer/editor
vim.keymap.set({ "n", "v" }, "<space>c", editor.closeActive)
vim.keymap.set({ "n", "v" }, "<space>bc", editor.closeActive)
vim.keymap.set({ "n", "v" }, "<space>k", editor.closeOther)
vim.keymap.set({ "n", "v" }, "<space>bk", editor.closeOther)

-- toggle
vim.keymap.set({ "n", "v" }, "<leader>ta", toggle.toggleActivityBar)
vim.keymap.set({ "n", "v" }, "<leader>tz", toggle.toggleZenMode)
vim.keymap.set({ "n", "v" }, "<leader>ts", toggle.toggleSideBarVisibility)
vim.keymap.set({ "n", "v" }, "<leader>tt", toggle.theme)

-- refactor
vim.keymap.set({ "v" }, "<leader>r", refactor.showMenu)
vim.keymap.set({ "n" }, "<leader>rr", symbol.rename)
vim.api.nvim_set_keymap("n", "<leader>rd", "V%d", { silent = true })
vim.api.nvim_set_keymap("n", "<leader>rv", "V%", { silent = true })

-- bookmark
vim.keymap.set({ "n" }, "<leader>m", bookmark.toggle)
vim.keymap.set({ "n" }, "<leader>mt", bookmark.toggle)
vim.keymap.set({ "n" }, "<leader>ml", bookmark.list)
vim.keymap.set({ "n" }, "<leader>mn", bookmark.next)
vim.keymap.set({ "n" }, "<leader>mp", bookmark.previous)

vim.keymap.set({ "n" }, "<leader>sr", search.reference)
vim.keymap.set({ "n" }, "<leader>sR", search.referenceInSideBar)
vim.keymap.set({ "n" }, "<leader>sp", search.project)
vim.keymap.set({ "n" }, "<leader>st", search.text)

-- vscode
vim.keymap.set({ "n" }, "<leader>ve", vscode.focusEditor)
vim.keymap.set({ "n" }, "<leader>vl", vscode.moveSideBarLeft)
vim.keymap.set({ "n" }, "<leader>vr", vscode.moveSideBarRight)

--folding
vim.keymap.set({ "n" }, "<leader>zr", fold.openAll)
vim.keymap.set({ "n" }, "<leader>zO", fold.openRecursive)
vim.keymap.set({ "n" }, "<leader>zo", fold.open)
vim.keymap.set({ "n" }, "<leader>zm", fold.all)
vim.keymap.set({ "n" }, "<leader>zb", fold.blockComment)
vim.keymap.set({ "n" }, "<leader>zc", fold.close)
vim.keymap.set({ "n" }, "<leader>zg", fold.allMarkerRegion)
vim.keymap.set({ "n" }, "<leader>zG", fold.openAllMarkerRegion)
vim.keymap.set({ "n" }, "<leader>za", fold.toggle)

vim.keymap.set({ "n" }, "zr", fold.openAll)
vim.keymap.set({ "n" }, "zO", fold.openRecursive)
vim.keymap.set({ "n" }, "zo", fold.open)
vim.keymap.set({ "n" }, "zm", fold.all)
vim.keymap.set({ "n" }, "zb", fold.blockComment)
vim.keymap.set({ "n" }, "zc", fold.close)
vim.keymap.set({ "n" }, "zg", fold.allMarkerRegion)
vim.keymap.set({ "n" }, "zG", fold.openAllMarkerRegion)
vim.keymap.set({ "n" }, "za", fold.toggle)
--#endregion keymap

----------------------------------------------------------------
-- Explorer -----------------------------------------------------
----------------------------------------------------------------
local explorer = {
  -- 打开并聚焦 Explorer 视图
  open = function()
    vim.fn.VSCodeNotify("workbench.view.explorer")
  end,

  -- 关闭侧边栏（间接隐藏 Explorer）
  hide = function()
    vim.fn.VSCodeNotify("workbench.action.closeSidebar")
  end,

  -- 如果侧边栏已隐藏 → 打开并聚焦 Explorer
  -- 如果侧边栏已显示   → 关闭侧边栏
  toggle = function()
    vim.fn.VSCodeNotify("workbench.action.toggleSidebarVisibility")
    -- VS Code 会在“侧边栏已隐藏”时自动退出，所以下一行只在需要时才生效
    vim.fn.VSCodeNotify("workbench.view.explorer")
  end,
}

-- ⇢⇢⇢ 绑定按键（Normal 模式即可）
vim.keymap.set("n", "<leader>eo", explorer.open, { silent = true, desc = "Explorer Open" })
vim.keymap.set("n", "<leader>eh", explorer.hide, { silent = true, desc = "Explorer Hide" })
vim.keymap.set("n", "<leader>et", explorer.toggle, { silent = true, desc = "Explorer Toggle" })
