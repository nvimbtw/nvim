return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- Wrap telescope calls in functions for better lazy loading and modern API usage
				map("gd", function() require("telescope.builtin").lsp_definitions() end, "[G]oto [D]efinition")
				map("gr", function() require("telescope.builtin").lsp_references() end, "[G]oto [R]eferences")
				map("gI", function() require("telescope.builtin").lsp_implementations() end, "[G]oto [I]mplementation")
				map("<leader>D", function() require("telescope.builtin").lsp_type_definitions() end, "Type [D]efinition")
				map("<leader>ds", function() require("telescope.builtin").lsp_document_symbols() end, "[D]ocument [S]ymbols")
				map("<leader>ws", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, "[W]orkspace [S]ymbols")

				map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("<C-k>", vim.lsp.buf.signature_help, "Signature Help")
				map("<C-k>", vim.lsp.buf.signature_help, "Signature Help", "i")

				---@param client vim.lsp.Client
				---@param method vim.lsp.protocol.Method
				---@param bufnr? integer
				---@return boolean
				local function client_supports_method(client, method, bufnr)
					if vim.fn.has("nvim-0.11") == 1 then
						return client:supports_method(method, bufnr)
					else
						return client.supports_method(method, { bufnr = bufnr })
					end
				end

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				-- Document highlighting
				if
					client
					and client_supports_method(
						client,
						vim.lsp.protocol.Methods.textDocument_documentHighlight,
						event.buf
					)
				then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				-- Inlay hints toggle
				if
					client
					and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
				then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		-- Modern way: let blink.cmp provide capabilities directly (no deprecated API)
		local capabilities = require("blink.cmp").get_lsp_capabilities()
		_G.lsp_capabilities = capabilities

		require("configs.lspconfig")
	end,
}
