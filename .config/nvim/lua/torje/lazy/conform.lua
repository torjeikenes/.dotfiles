local format_on_save_enabled = true

return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
		{
			"<leader>tfs",
			function()
				format_on_save_enabled = not format_on_save_enabled
			end,
			mode = "",
			desc = "[T]oggle [F]ormat on [S]ave",
		},
	},
	opts = {
		notify_on_error = false,
		--format_on_save = {
		--	lsp_format = "fallback",
		--	timeout_ms = 500,
		--},
		format_on_save = function(bufnr)
			if not format_on_save_enabled then
				return nil
			end
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = { c = false, cpp = false }
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform can also run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			-- You can use 'stop_after_first' to run the first available formatter from the list
			-- javascript = { "prettierd", "prettier", stop_after_first = true },
		},
	},
}
