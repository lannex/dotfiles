local nvimtree = {
	opts = {
		git = {
			enable = true,
			ignore = false,
		},
		renderer = {
			highlight_git = true,
			icons = {
				show = {
					git = true,
				},
			},
		},
		view = {
			width = 36,
		},
		filters = {
			custom = {
				".DS_Store",
				"__pycache__",
			},
		},
	},
}

return nvimtree
