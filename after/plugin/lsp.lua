local lsp = require("lsp-zero")

lsp.present("recommended")
lsp.setup()

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"rust_analyzer"
})
