return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	opts = {
		suggestion = {
			auto_trigger = true,
			keymap = {
				accept = "<A-/>",
				accept_line = "<A-l>",
				accept_word = "<A-k>",
				next = "<A-]>",
				prev = "<A-[>",
				dismiss = "<A-c>",
			},
		},
		filetypes = {
			yaml = true,
		},
	},
}
