return {
	dir = vim.fn.isdirectory(vim.fn.expand("~/Programming/Personal/tw-todo")) == 1
		and vim.fn.expand("~/Programming/Personal/tw-todo")
		or nil,
	"nvimbtw/tw-todo",
	name = "tw-todo",
	config = function()
		require("tw-todo").setup({
			keymaps = {
				todo = "<leader>tt",
				fix  = "<leader>tf",
				list = "<leader>tl",
			},
			hash_prefix = "tw:", -- prefix on the hash line
			taskwarrior = {
				enabled = true, -- create a taskwarrior task when a comment is inserted
				command = "task",
				project = nil, -- string | fun(buf): string; default: project root directory name
				root_markers = {
					".tw-todo",
					".git",
					"package.json",
					"Cargo.toml",
					"go.mod",
					"pyproject.toml",
					"Makefile"
				},
			},
			sync = {
				on_write = true, -- reconcile comments with taskwarrior after saving a file (async)
			},
			virtual_text = {
				enabled = true, -- show task status/urgency/due next to hash lines
				format = nil, -- fun(task|nil): chunks — override the rendering
			},
			github = {
				enabled = true, -- mirror comments as GitHub issues via the gh CLI
				command = "gh",
				labels = true, -- label issues with the keyword (todo/fix) and your +tags
				extra_args = {}, -- passed to `gh issue create`, e.g. { "--assignee", "@me", "--milestone", "v1.0" }
			},
		})
	end,
}
