return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			highlight_overrides = {
				mocha = function(colors)
					return {
						-- Core Syntax Elements: Variables, Constants, Primitives
						["@variable"] = { fg = colors.blue }, -- controls color of general variables
						["@variable.builtin"] = { fg = colors.blue }, -- controls color of built-in variables (e.g., self, this)
						["@variable.global"] = { fg = colors.blue }, -- controls color of global variables
						["@variable.local"] = { fg = colors.blue }, -- controls color of local variables
						["@variable.field"] = { fg = colors.blue }, -- controls color of field variables (e.g., in structs/objects)
						["@variable.member"] = { fg = colors.lavender }, -- controls color of member variables (e.g., instance members)
						["@variable.parameter"] = { fg = colors.blue }, -- controls color of function parameters
						["@variable.static"] = { fg = colors.blue }, -- controls color of static variables
						["@constant"] = { fg = colors.blue }, -- controls color of constants
						["@constant.builtin"] = { fg = colors.blue }, -- controls color of built-in constants (e.g., nil, true)
						["@constant.macro"] = { fg = colors.blue }, -- controls color of macro constants
						["@boolean"] = { fg = colors.blue }, -- controls color of boolean literals (true/false)
						["@number"] = { fg = colors.blue }, -- controls color of integer numbers
						["@float"] = { fg = colors.blue }, -- controls color of floating-point numbers
						["@character"] = { fg = colors.blue }, -- controls color of character literals (e.g., 'a')

						-- Strings & Escapes
						["@string"] = { fg = colors.lavender }, -- controls color of string literals
						["@string.escape"] = { fg = colors.sky }, -- controls color of escape sequences in strings (e.g., \n)
						["@string.regex"] = { fg = colors.lavender }, -- controls color of regex patterns
						["@string.special"] = { fg = colors.lavender }, -- controls color of special strings (e.g., format strings)

						-- Functions & Methods
						["@function"] = { fg = colors.sapphire }, -- controls color of function definitions
						["@function.builtin"] = { fg = colors.sapphire }, -- controls color of built-in functions (e.g., print)
						["@function.macro"] = { fg = colors.sapphire }, -- controls color of macro functions
						["@function.call"] = { fg = colors.sapphire }, -- controls color of function calls (e.g., require())
						["@function.method"] = { fg = colors.sapphire }, -- controls color of method definitions/calls
						["@method"] = { fg = colors.sapphire }, -- controls color of method definitions
						["@method.call"] = { fg = colors.sapphire }, -- controls color of method calls
						["@constructor"] = { fg = colors.sapphire }, -- controls color of constructor calls (e.g., new())
						["@function.method.call"] = { fg = colors.sapphire }, -- controls color of method definitions/calls
						["@method.call.static"] = { fg = colors.sapphire }, -- controls color of method calls

						-- Keywords & Control Flow
						["@keyword"] = { fg = colors.mauve }, -- controls color of general keywords
						["@keyword.function"] = { fg = colors.mauve }, -- controls color of function keywords (e.g., function, def)
						["@keyword.operator"] = { fg = colors.mauve }, -- controls color of operator keywords (e.g., and, or)
						["@keyword.return"] = { fg = colors.mauve }, -- controls color of return keywords
						["@keyword.conditional"] = { fg = colors.mauve }, -- controls color of conditional keywords (e.g., if, else)
						["@keyword.repeat"] = { fg = colors.mauve }, -- controls color of loop keywords (e.g., while, for)
						["@label"] = { fg = colors.mauve }, -- controls color of labels (e.g., goto targets)

						-- Types & Qualifiers
						["@type"] = { fg = colors.teal }, -- controls color of types
						["@type.builtin"] = { fg = colors.teal }, -- controls color of built-in types (e.g., int, string)
						["@type.definition"] = { fg = colors.teal }, -- controls color of type definitions
						["@type.qualifier"] = { fg = colors.teal }, -- controls color of type qualifiers (e.g., const, static)

						-- Fields, Properties & Namespaces
						["@field"] = { fg = colors.lavender }, -- controls color of object/struct fields (e.g., colors.lavender)
						["@property"] = { fg = colors.lavender }, -- controls color of properties (similar to fields)
						["@attribute"] = { fg = colors.lavender }, -- controls color of attributes or annotations in tags/objects
						["@namespace"] = { fg = colors.lavender }, -- controls color of namespaces/modules (e.g., fmt in fmt.Sprintf)
						["@module"] = { fg = colors.lavender }, -- controls color of module names

						-- Operators & Punctuation
						["@operator"] = { fg = colors.text }, -- controls color of operators (e.g., +, ==)
						["@punctuation"] = { fg = colors.text }, -- controls color of general punctuation
						["@punctuation.bracket"] = { fg = colors.sky }, -- controls color of brackets/parentheses (e.g., (), {}, [])
						["@punctuation.delimiter"] = { fg = colors.text }, -- controls color of delimiters (e.g., comma, semicolon)
						["@punctuation.special"] = { fg = colors.text }, -- controls color of special punctuation (e.g., # for comments)

						-- Includes, Annotations & Errors
						["@include"] = { fg = colors.text }, -- controls color of import/include statements
						["@annotation"] = { fg = colors.text }, -- controls color of annotations/decorators (e.g., @decorator in Python)
						["@error"] = { fg = colors.text }, -- controls color of errors or invalid syntax
						["@tag"] = { fg = colors.lavender }, -- controls color of HTML/XML tags (e.g., <div>)
						["@tag.attribute"] = { fg = colors.sky }, -- controls color of tag attributes (e.g., class="foo")
						["@tag.delimiter"] = { fg = colors.sky }, -- controls color of tag delimiters (e.g., <, >)

						-- Comments
						["@comment"] = { fg = colors.surface2, italic = true }, -- controls color of inline comments
						["@comment.block"] = { fg = colors.surface2, italic = true }, -- controls color of block/multiline comments
						["@comment.documentation"] = { fg = colors.surface2, italic = true }, -- controls color of documentation comments (e.g., JSDoc)
						["@comment.error"] = { fg = colors.surface2, italic = true }, -- controls color of error annotations in comments
						["@comment.warning"] = { fg = colors.surface2, italic = true }, -- controls color of warning annotations in comments

						-- Special/Utility
						["@ignore"] = { fg = colors.text }, -- controls color of ignored or hidden nodes
						["@todo"] = { fg = colors.text }, -- controls color of TODO notes in code
						["@type.cast"] = { fg = colors.text }, -- controls color of type casts (e.g., (int)x)

						-- LSP/Semantic Extensions (if using LSP)
						["@lsp.type.class"] = { fg = colors.text }, -- controls color of LSP-provided class types
						["@lsp.type.comment"] = { fg = colors.text }, -- controls color of LSP-provided comments
						["@lsp.type.constant"] = { fg = colors.text }, -- controls color of LSP-provided constants
						["@lsp.type.enum"] = { fg = colors.text }, -- controls color of LSP-provided enums
						["@lsp.type.enumMember"] = { fg = colors.text }, -- controls color of LSP-provided enum members
						["@lsp.type.function"] = { fg = colors.text }, -- controls color of LSP-provided functions
						["@lsp.type.interface"] = { fg = colors.text }, -- controls color of LSP-provided interfaces
						["@lsp.type.keyword"] = { fg = colors.text }, -- controls color of LSP-provided keywords
						["@lsp.type.namespace"] = { fg = colors.text }, -- controls color of LSP-provided namespaces
						["@lsp.type.number"] = { fg = colors.text }, -- controls color of LSP-provided numbers
						["@lsp.type.operator"] = { fg = colors.text }, -- controls color of LSP-provided operators
						["@lsp.type.parameter"] = { fg = colors.text }, -- controls color of LSP-provided parameters
						["@lsp.type.property"] = { fg = colors.text }, -- controls color of LSP-provided properties
						["@lsp.type.string"] = { fg = colors.text }, -- controls color of LSP-provided strings
						["@lsp.type.struct"] = { fg = colors.text }, -- controls color of LSP-provided structs
						["@lsp.type.type"] = { fg = colors.text }, -- controls color of LSP-provided types
						["@lsp.type.variable"] = { fg = colors.text }, -- controls color of LSP-provided variables
						["@lsp.mod"] = { fg = colors.text }, -- controls color of LSP modifiers
						["@lsp.typemod"] = { fg = colors.text }, -- controls color of LSP type modifiers (e.g., readonly)

						-- Text/Note Groups (for docs/markdown)
						["@text"] = { fg = colors.text }, -- controls color of plain text in docs/markdown
						["@text.literal"] = { fg = colors.text }, -- controls color of literal text blocks
						["@text.reference"] = { fg = colors.text }, -- controls color of references/links
						["@text.title"] = { fg = colors.text }, -- controls color of titles/headings
						["@text.emphasis"] = { fg = colors.text }, -- controls color of emphasized/italic text
						["@text.strong"] = { fg = colors.text }, -- controls color of strong/bold text
						["@text.underline"] = { fg = colors.text }, -- controls color of underlined text
						["@text.strike"] = { fg = colors.text }, -- controls color of strikethrough text
						["@text.uri"] = { fg = colors.text }, -- controls color of URIs/links
						["@text.note"] = { fg = colors.text }, -- controls color of note blocks
						["@text.warning"] = { fg = colors.text }, -- controls color of warning blocks
						["@text.danger"] = { fg = colors.text }, -- controls color of danger/error blocks
					}
				end,
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
