return {
	"tpope/vim-fugitive",
	vim.keymap.set("n", "<leader>gs", vim.cmd.Git),
	vim.keymap.set("n", "gf", "<cmd>diffget //2<CR>", { desc = "accept the left git merge change" }),
	vim.keymap.set("n", "gj", "<cmd>diffget //3<CR>", { desc = "accept the right git merge change" }),

	vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit!<CR>", { desc = "[G]it vertical [D]iff" }),
	vim.keymap.set("n", "<leader>gh", "/HEAD<CR>", { desc = "[G]oto next [H]EAD" }),
}
