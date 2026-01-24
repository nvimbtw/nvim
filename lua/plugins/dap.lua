return {
	"mfussenegger/nvim-dap",
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
					{
						elements = {
							{ id = "repl", size = 1.0 }, -- REPL only (no console to avoid confusion)
						},
						size = 10, -- Height of bottom tray
						position = "bottom",
					},
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
	keys = {
		{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
		{ "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
		{ "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
		{ "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
		{ "<leader>du", function() require("dap").step_out() end, desc = "Step Out" },
		{ "<leader>dr", function() require("dap").repl.open() end, desc = "Open REPL" },
		{ "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
		{ "<leader>dt", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
	},
	config = function()
		local dap = require("dap")

		dap.defaults.fallback.terminal_win_cmd = "belowright 10new | terminal"

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
				name = "Launch",
				request = "launch",
				program = function()
					return vim.fn.input(
						"Path to executable/dll: ",
						vim.fn.getcwd() .. "/bin/Debug/net8.0/YourApp.dll",
						"file"
					)
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				console = "externalTerminal",
			},
			{
				type = "coreclr",
				name = "Attach to Process",
				request = "attach",
				processId = require("dap.utils").pick_process,
			},
		}
	end,
}
