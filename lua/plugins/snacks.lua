return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			bigfile = { enabled = true },
			dashboard = {
				enabled = true,
				preset = {
					---@type fun(cmd:string, opts:table)|nil
					pick = nil,
					---@type snacks.dashboard.Item[]
					keys = {
						{
							icon = "󰱽 ",
							key = "f",
							desc = "File search",
							action = ":Telescope find_files",
						},
						{
							icon = "󱎸 ",
							key = "g",
							desc = "Grep search",
							action = ":Telescope live_grep",
						},
						{
							icon = " ",
							key = "e",
							desc = "Explore",
							action = function()
								require("snacks").explorer()
							end,
						},
						{
							icon = "󰛢 ",
							key = "a",
							desc = "Harpoon",
							action = function()
								require("harpoon.ui").toggle_quick_menu()
							end,
						},
						{
							icon = "󰁴",
							key = "o",
							desc = "Oil",
							action = function()
								require("oil").open_float()
							end,
						},
						{
							icon = "󰟾 ",
							key = "m",
							desc = "Mason",
							action = function()
								vim.cmd("Mason")
							end,
						},
					},
					header = [[
        _   ____________ _    ________  ___
      / | / / ____/ __ \ |  / /  _/  |/  /
    /  |/ / __/ / / / / | / // // /|_/ /
  / /|  / /___/ /_/ /| |/ // // /  / /
/_/ |_/_____/\____/ |___/___/_/  /_/
          ]],
				},
				sections = {
					{
						section = "header",
					},
					{
						text = "────────────────────────────────────────────────────────────",
					},
					{ text = "" },
					{
						section = "keys",
						gap = 1,
						pane = 1,
					},
				},
			},
			explorer = {
				enabled = true,
				open_on_startup = false,
				hidden = true,
				no_ignore = true,
				no_dot = false,
			},
			indent = { enabled = true },
			input = { enabled = false },
			notifier = {
				enabled = true,
				timeout = 3000,
			},
			picker = { enabled = false },
			quickfile = { enabled = true },
			scope = { enabled = false },
			scroll = { enabled = true },
			statuscolumn = { enabled = false },
			words = { enabled = false },
			styles = {
				notification = {
					border = "single",
				},
			},
			animate = {
				duration = 10,
				fps = 240,
			},
		},
		keys = {
			{
				"<leader>:",
				function()
					require("snacks").picker.command_history()
				end,
				desc = "command history",
			},
			{
				"<leader>n",
				function()
					require("snacks").picker.notifications()
				end,
				desc = "notification history",
			},
			{
				"<leader>e",
				function()
					require("snacks").explorer()
				end,
				desc = "file explorer",
			},
			{
				"<leader>.",
				function()
					require("snacks").scratch()
				end,
				desc = "toggle scratch buffer",
			},
			{
				"<leader>n",
				function()
					require("snacks").notifier.show_history()
				end,
				desc = "notification history",
			},
			{
				"]]",
				function()
					require("snacks").words.jump(vim.v.count1)
				end,
				desc = "next reference",
				mode = { "n", "t" },
			},
			{
				"[[",
				function()
					require("snacks").words.jump(-vim.v.count1)
				end,
				desc = "prev reference",
				mode = { "n", "t" },
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("user", {
				pattern = "verylazy",
				callback = function()
					local snacks = require("snacks")
					-- setup some globals for debugging (lazy-loaded)
					_G.dd = function(...)
						snacks.debug.inspect(...)
					end
					_G.bt = function()
						snacks.debug.backtrace()
					end
					-- vim.print = _g.dd -- override print to use snacks for `:=` command

					-- create some toggle mappings
					snacks.toggle.option("spell", { name = "spelling" }):map("<leader>us")
					snacks.toggle.option("wrap", { name = "wrap" }):map("<leader>uw")
					snacks.toggle.option("relativenumber", { name = "relative number" }):map("<leader>ul")
					snacks.toggle.diagnostics():map("<leader>ud")
					snacks.toggle.line_number():map("<leader>ul")
					snacks.toggle
						.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map("<leader>uc")
					snacks.toggle.treesitter():map("<leader>ut")
					snacks.toggle
						.option("background", { off = "light", on = "dark", name = "dark background" })
						:map("<leader>ub")
					snacks.toggle.inlay_hints():map("<leader>uh")
					snacks.toggle.indent():map("<leader>ug")
					snacks.toggle.dim():map("<leader>ud")

					---@type table<number, {token:lsp.progresstoken, msg:string, done:boolean}[]>
					local progress = vim.defaulttable()
					vim.api.nvim_create_autocmd("lspprogress", {
						---@param ev {data: {client_id: integer, params: lsp.progressparams}}
						callback = function(ev)
							local client = vim.lsp.get_client_by_id(ev.data.client_id)
							local value = ev.data.params.value --[[@as {percentage?: number, title?: string, message?: string, kind: "begin" | "report" | "end"}]]
							if not client or type(value) ~= "table" then
								return
							end
							local p = progress[client.id]

							for i = 1, #p + 1 do
								if i == #p + 1 or p[i].token == ev.data.params.token then
									p[i] = {
										token = ev.data.params.token,
										msg = ("[%3d%%] %s%s"):format(
											value.kind == "end" and 100 or value.percentage or 100,
											value.title or "",
											value.message and (" **%s**"):format(value.message) or ""
										),
										done = value.kind == "end",
									}
									break
								end
							end

							local msg = {} ---@type string[]
							progress[client.id] = vim.tbl_filter(function(v)
								return table.insert(msg, v.msg) or not v.done
							end, p)

							local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
							vim.notify(table.concat(msg, "\n"), "info", {
								id = "lsp_progress",
								title = client.name,
								opts = function(notif)
									notif.icon = #progress[client.id] == 0 and " "
										or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
								end,
							})
						end,
					})
				end,
			})
		end,
	},
},
	vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#89b4fa", force = true })
