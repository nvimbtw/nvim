-- local function show_clipboard_picker()
--   local pickers = require('telescope.pickers')
--   local finders = require('telescope.finders')
--   local conf = require('telescope.config').values
--   local actions = require('telescope.actions')
--   local action_state = require('telescope.actions.state')
--   local previewers = require('telescope.previewers')
--
--   pickers.new({}, {
--     prompt_title = "AI Clipboard History",
--     finder = finders.new_table({
--       results = clipboard_history,
--       entry_maker = function(entry)
--         return {
--           value = entry,
--           display = string.format("%s | %s", entry.title, os.date("%H:%M", entry.timestamp)),
--           ordinal = entry.title .. " " .. entry.content,
--         }
--       end,
--     }),
--     sorter = conf.generic_sorter({}),
--     previewer = previewers.new_buffer_previewer({
--       title = "Clipboard Content",
--       define_preview = function(self, entry, status)
--         local content = entry.value.content
--         local lines = vim.split(content, '\n')
--         vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
--
--         local ft = "text"
--         if content:match("^%s*[%{%[]") then
--           ft = "json"
--         elseif content:match("function%s*%(") or content:match("const%s+") or content:match("let%s+") then
--           ft = "javascript"
--         elseif content:match("def%s+") or content:match("import%s+") then
--           ft = "python"
--         elseif content:match("<%w+") then
--           ft = "html"
--         elseif content:match("local%s+") or content:match("function%(") then
--           ft = "lua"
--         end
--
--         vim.api.nvim_buf_set_option(self.state.bufnr, 'filetype', ft)
--       end
--     }),
--     attach_mappings = function(prompt_bufnr, map)
--       actions.select_default:replace(function()
--         local selection = action_state.get_selected_entry()
--         actions.close(prompt_bufnr)
--         if selection then
--           local content = selection.value.content
--           vim.fn.setreg('"', content) -- unnamed register
--           vim.fn.setreg('0', content) -- yank register
--           vim.fn.setreg('+', content) -- system clipboard
--           print("Selected: " .. selection.value.title)
--         end
--       end)
--       return true
--     end,
--   }):find()
-- end
local M = {}

local db_path = vim.fn.stdpath('data') .. '/clipboardHistory.db'

function M.execute_sql(sql)
  local cmd = string.format('sqlite3 "%s" "%s"', db_path, sql)
  local result = vim.fn.system(cmd)
  return result
end

function M.setup_database()
  local create_table_sql = """
    CREATE TABLE IF NOT EXISTS notes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      content TEXT,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
    );
  """

  local result = M.execute_sql(create_table_sql)
  if result then
    print("Database and table created successfully!")
  else
    print("Error creating database")
  end
end

function M.add_note(title, content)
  local sql = string.format(
    "INSERT INTO notes (title, content) VALUES ('%s', '%s');",
    title or "", content or ""
  )

  local result = M.execute_sql(sql)
  if result then
    print("Note added successfully!")
  else
    print("Error adding note")
  end
end

function M.load_yanks()
  local sql = string.format(
    "SELECT * FROM notes"
  )

  local result = M.execute_sql(sql)
end

local function on_yank()
  local yanked = vim.fn.getreg('"')

  if not yanked or yanked:len() < 3 then
    return
  end

  local title = "yank_" .. os.date("%H:%M:%S")
  local content = "test"
  M.add_note(title, content)
  M.load_yanks()
end

function M.setup()
  M.setup_database()
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = on_yank,
    desc = "Auto-save yanked text to database"
  })
end

return M
