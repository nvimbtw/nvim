return {
	"mfussenegger/nvim-dap",
	lazy = false, -- Load early
	dependencies = {
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio", -- Required for dap-ui's async features
		},
		config = function()
			local dapui = require("dapui")
			dapui.setup({
				layouts = {
					{
						elements = {
							{ id = "scopes", size = 0.75 }, -- Variables/scopes
							{ id = "breakpoints", size = 0.25 }, -- Breakpoint list
						},
						size = 50, -- Width of left sidebar
						position = "left",
					},
					-- {
					-- 	elements = {
					-- 		{ id = "repl", size = 1.0 }, -- REPL only (no console to avoid confusion)
					-- 	},
					-- 	size = 10, -- Height of bottom tray
					-- 	position = "bottom",
					-- },
				},
				floating = {
					max_height = nil, -- Will fit to content
					max_width = nil,
					border = "single", -- Nice rounded borders
					mappings = { close = { "q", "<Esc>" } }, -- Easy close
				},
				controls = { enabled = true }, -- Toolbar with play/pause/step buttons
				icons = { expanded = "▾", collapsed = "▸", current_frame = "→" }, -- Tree icons
				render = { max_type_length = 30, max_value_lines = 100 }, -- Formatting limits
			})

			-- Auto-open/close UI on debug events
			local dap = require("dap")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	config = function()
		local dap = require("dap")

		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
		vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
		vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step Over" })
		vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Step Out" })
		vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
		vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run Last" })

		dap.defaults.fallback.terminal_win_cmd = "belowright 10new | terminal"

		vim.keymap.set("n", "<leader>dt", function()
			require("dapui").toggle()
		end, { desc = "Toggle DAP UI" })

		dap.adapters.coreclr = {
			type = "executable",
			command = vim.fn.expand("~/.local/share/netcoredbg/netcoredbg"),
			args = { "--interpreter=vscode" },
			env = {
				LD_LIBRARY_PATH = vim.fn.expand("~/.local/share/netcoredbg"),
			},
		}

		-- C# Configurations
		dap.configurations.cs = {
			{
				type = "coreclr",
				name = "Attach to Process",
				request = "attach",
				processId = require("dap.utils").pick_process,
			},
		}
	end,
}
