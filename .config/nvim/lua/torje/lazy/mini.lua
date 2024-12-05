return { -- Collection of various small independent plugins/modules
	"echasnovski/mini.nvim",
	config = function()
		-- Better Around/Inside textobjects
		--
		-- Examples:
		--  - va)  - [V]isually select [A]round [)]paren
		--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
		--  - ci'  - [C]hange [I]nside [']quote
		require("mini.ai").setup({ n_lines = 500 })

		-- Add/delete/replace surroundings (brackets, quotes, etc.)
		--
		-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
		-- - sd'   - [S]urround [D]elete [']quotes
		-- - sr)'  - [S]urround [R]eplace [)] [']
		require("mini.surround").setup()

		-- Simple and easy statusline.
		--  You could remove this setup call if you don't like it,
		--  and try some other statusline plugin
		local statusline = require("mini.statusline")

		local my_active_content = function()
			local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
			local git = MiniStatusline.section_git({ trunc_width = 40 })
			local diff = MiniStatusline.section_diff({ trunc_width = 75 })
			local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
			local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
			local filename = MiniStatusline.section_filename({ trunc_width = 140 })
			local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
			local location = MiniStatusline.section_location({ trunc_width = 75 })
			local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
			local status = Format_status()

			return MiniStatusline.combine_groups({
				{ hl = mode_hl, strings = { mode } },
				{ hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp } },
				"%<", -- Mark general truncate point
				{ hl = "MiniStatuslineFilename", strings = { filename } },
				"%=", -- End left alignment
				{ hl = "MiniStatuslineFileinfo", strings = { fileinfo, status } },
				{ hl = mode_hl, strings = { search, location } },
			})
		end
		-- set use_icons to true if you have a Nerd Font
		statusline.setup({ use_icons = vim.g.have_nerd_font, content = { active = my_active_content } })

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return "%2l:%-2v"
		end

		statusline.section_fileinfo({})

		-----@diagnostic disable-next-line: duplicate-set-field
		--statusline.section_fileinfo = function(args)
		--	local filetype = vim.bo.filetype

		--	-- Don't show anything if there is no filetype
		--	if filetype == "" then
		--		return ""
		--	end

		--	-- Add filetype icon
		--	--H.ensure_get_icon()
		--	--if H.get_icon ~= nil then
		--	--	filetype = H.get_icon(filetype) .. " " .. filetype
		--	--end

		--	-- Construct output string if truncated or buffer is not normal
		--	if MiniStatusline.is_truncated(args.trunc_width) or vim.bo.buftype ~= "" then
		--		return filetype
		--	end

		--	-- Construct output string with extra file info
		--	local encoding = vim.bo.fileencoding or vim.bo.encoding
		--	local format = vim.bo.fileformat
		--	local size = "" --H.get_filesize()

		--	return string.format("%s %s[%s] %s TEST", filetype, encoding, format, size)
		--end

		-- ... and there is more!
		--  Check out: https://github.com/echasnovski/mini.nvim
	end,
}