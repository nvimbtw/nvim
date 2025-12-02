require("tiny-glimmer").setup({
	enabled = true,
	disable_warnings = true,
	refresh_interval_ms = 8,
	overwrite = {
		auto_map = true,
		yank = {
			enabled = true,
			default_animation = "fade",
		},
		search = {
			enabled = true,
			default_animation = "pulse",
			next_mapping = "n",
			prev_mapping = "N",
		},
		paste = {
			enabled = true,
			default_animation = "fade",
			paste_mapping = "p",
			Paste_mapping = "P",
		},
		undo = {
			enabled = true,
			default_animation = {
				name = "fade",
				settings = {
					from_color = "DiffDelete",
					max_duration = 500,
					min_duration = 500,
				},
			},
			undo_mapping = "u",
		},
		redo = {
			enabled = true,
			default_animation = {
				name = "fade",
				settings = {
					from_color = "DiffAdd",
					max_duration = 500,
					min_duration = 500,
				},
			},
			redo_mapping = "<c-r>",
		},
	},

	support = {
		substitute = {
			enabled = false,
			default_animation = "fade",
		},
	},

	transparency_color = nil,
	animations = {
		fade = {
			max_duration = 250,
			min_duration = 200,
			easing = "outQuad",
			chars_for_max_duration = 10,
			from_color = "#5b5f80",
			to_color = "#2d3040",
		},
		reverse_fade = {
			max_duration = 380,
			min_duration = 300,
			easing = "outBack",
			chars_for_max_duration = 10,
			from_color = "#74c7ec",
			to_color = "#11111b",
		},
		bounce = {
			max_duration = 500,
			min_duration = 400,
			chars_for_max_duration = 20,
			oscillation_count = 1,
			from_color = "#89dceb",
			to_color = "#11111b",
		},
		left_to_right = {
			max_duration = 350,
			min_duration = 350,
			min_progress = 0.85,
			chars_for_max_duration = 25,
			lingering_time = 50,
			from_color = "#89dceb",
			to_color = "#11111b",
		},
		pulse = {
			max_duration = 600,
			min_duration = 400,
			chars_for_max_duration = 15,
			pulse_count = 2,
			intensity = 1.2,
			from_color = "#b4befe",
			to_color = "#11111b",
		},
		rainbow = {
			max_duration = 600,
			min_duration = 350,
			chars_for_max_duration = 20,
		},
	},

	hijack_ft_disabled = {
		"alpha",
		"snacks_dashboard",
	},

	virt_text = {
		priority = 2048,
	},
})
