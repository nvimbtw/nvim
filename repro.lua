
local lang = "lua"
print("Runtime files for " .. lang .. "/highlights.scm:")
print(vim.inspect(vim.api.nvim_get_runtime_file("queries/" .. lang .. "/highlights.scm", true)))

local parser = vim.treesitter.get_parser(0, lang)
print("Parser lang: " .. parser:lang())

local query = vim.treesitter.query.get(lang, "highlights")
print("Query loaded successfully")

-- Let's try to find a binary expression and see its fields
local src = "local a = 1 + 2"
local bufnr = vim.api.nvim_create_buf(false, true)
vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {src})
local p = vim.treesitter.get_parser(bufnr, "lua")
local t = p:parse()[1]
local r = t:root()

local function dump_nodes(node, indent)
    indent = indent or ""
    print(indent .. node:type())
    for child, field in node:iter_children() do
        if field then
            print(indent .. "  field: " .. field)
        end
        dump_nodes(child, indent .. "  ")
    end
end

dump_nodes(r)
