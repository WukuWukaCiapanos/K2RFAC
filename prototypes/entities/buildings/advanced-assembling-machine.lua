function assemblerkpipepictures()
	return
	{
		north =
		{
			filename = kr_entities_path .. "advanced-assembling-machine/advanced-assembling-machine-k-pipe-N.png",
			priority = "extra-high",
			width = 35,
			height = 18,
			shift = util.by_pixel(2.5, 14),
			hr_version =
			{
				filename = kr_entities_path .. "advanced-assembling-machine/hr-advanced-assembling-machine-k-pipe-N.png",
				priority = "extra-high",
				width = 71,
				height = 38,
				shift = util.by_pixel(2.25, 13.5),
				scale = 0.5
			}
		},
		east =
		{
			filename = kr_entities_path .. "advanced-assembling-machine/advanced-assembling-machine-k-pipe-E.png",
			priority = "extra-high",
			width = 20,
			height = 38,
			shift = util.by_pixel(-25, 1),
			hr_version =
			{
				filename = kr_entities_path .. "advanced-assembling-machine/hr-advanced-assembling-machine-k-pipe-E.png",
				priority = "extra-high",
				width = 42,
				height = 76,
				shift = util.by_pixel(-24.5, 1),
				scale = 0.5
			}
		},
		south =
		{
			filename = kr_entities_path .. "advanced-assembling-machine/advanced-assembling-machine-k-pipe-S.png",
			priority = "extra-high",
			width = 44,
			height = 31,
			shift = util.by_pixel(0, -31.5),
			hr_version =
			{
				filename = kr_entities_path .. "advanced-assembling-machine/hr-advanced-assembling-machine-k-pipe-S.png",
				priority = "extra-high",
				width = 88,
				height = 61,
				shift = util.by_pixel(0, -31.25),
				scale = 0.5
			}
		},
		west =
		{
			filename = kr_entities_path .. "advanced-assembling-machine/advanced-assembling-machine-k-pipe-W.png",
			priority = "extra-high",
			width = 19,
			height = 37,
			shift = util.by_pixel(25.5, 1.5),
			hr_version =
			{
				filename = kr_entities_path .. "advanced-assembling-machine/hr-advanced-assembling-machine-k-pipe-W.png",
				priority = "extra-high",
				width = 39,
				height = 73,
				shift = util.by_pixel(25.75, 1.25),
				scale = 0.5
			}
		}
	}
end

local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds      = require("__base__/prototypes/entity/sounds")

local K2RFACList = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid", "smelting-crafting"}
if (settings.startup["K2RFAC-bool-use-added-crusher-recipes-setting"].value) then
	table.insert(K2RFACList, "crushing")
end

if (mods['space-exploration']) then
	table.insert(K2RFACList, "crafting-or-electromagnetics")
end

if (mods['space-exploration']) and (settings.startup["K2RFAC-bool-add-SE-pulverising-recipes-to-assembler-setting"].value) then
	table.insert(K2RFACList, "pulverising")
end

if (mods['space-exploration']) and (settings.startup["K2RFAC-bool-add-SE-core-fragment-recipes-to-assembler-setting"].value) then
	table.insert(K2RFACList, "core-fragment-processing")
end

data:extend(
{   
	{
		type = "assembling-machine",
		name = "kr-advanced-assembling-machine",
		icon = kr_entities_icons_path .. "advanced-assembling-machine.png",
		icon_size = 64,
		flags = {"placeable-neutral","placeable-player", "player-creation"},
		minable = {mining_time = 1, result = "kr-advanced-assembling-machine"},
		max_health = 800,
		corpse = "kr-medium-random-pipes-remnant",
		dying_explosion = "big-explosion",
		resistances = 
		{
			{type = "physical", percent = 50},
			{type = "fire", percent = 95},
			{type = "impact", percent = 80}
		},
		collision_box = {{-2.25, -2.25}, {2.25, 2.25}},
		selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
		damaged_trigger_effect = hit_effects.entity(),
		fluid_boxes =
		{
			{
				production_type = "input",
				pipe_picture = assemblerkpipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 10,
				base_level = -1,
				pipe_connections = {{ type="input", position = {0, -3} }},
				secondary_draw_orders = { north = -1 }
			},
			{
				production_type = "output",
				pipe_picture = assemblerkpipepictures(),
				pipe_covers = pipecoverspictures(),
				base_area = 10,
				base_level = 1,
				pipe_connections = {{ type="output", position = {0, 3} }},
				secondary_draw_orders = { north = -1 }
			},
			off_when_no_fluid_recipe = true
		},
		
		animation =
		{
			layers =
			{
				{
					filename = kr_entities_path .. "advanced-assembling-machine/advanced-assembling-machine.png",
					priority = "high",
					width = 160,
					height = 160,
					frame_count = 1,
					repeat_count = 32,
					animation_speed = 0.25,
					shift = {0, 0},
					hr_version =
					{
						filename = kr_entities_path .. "advanced-assembling-machine/hr-advanced-assembling-machine.png",
						priority = "high",
						width = 320,
						height = 320,
						frame_count = 1,
						repeat_count = 32,
						animation_speed = 0.25,
						shift = {0, 0},
						scale = 0.5
					}
				},
				{
					filename = kr_entities_path .. "advanced-assembling-machine/advanced-assembling-machine-w1.png",
					priority = "high",
					width = 64,
					height = 72,
					shift = {-1.02, 0.29},
					frame_count = 32,
					line_length = 8,
					animation_speed = 0.1,
					hr_version =
					{
						filename = kr_entities_path .. "advanced-assembling-machine/hr-advanced-assembling-machine-w1.png",
						priority = "high",
						width = 128,
						height = 144,
						shift = {-1.02, 0.29},
						frame_count = 32,
						line_length = 8,
						animation_speed = 0.1,
						scale = 0.5
					}
				},
				{
					filename = kr_entities_path .. "advanced-assembling-machine/advanced-assembling-machine-steam.png",
					priority = "high",
					width = 40,
					height = 40,
					shift = {-1.2, -2.1},
					frame_count = 32,
					line_length = 8,
					animation_speed = 1.5,
					hr_version =
					{
						filename = kr_entities_path .. "advanced-assembling-machine/hr-advanced-assembling-machine-steam.png",
						priority = "high",
						width = 80,
						height = 81,
						shift = {-1.2, -2.1},
						frame_count = 32,
						line_length = 8,
						animation_speed = 1.5,
						scale = 0.5
					}
				},
				{
					filename = kr_entities_path .. "advanced-assembling-machine/advanced-assembling-machine-sh.png",
					priority = "high",
					width = 173,
					height = 151,
					shift = {0.32, 0.12},
					frame_count = 1,
					repeat_count = 32,
					animation_speed = 0.1,
					draw_as_shadow = true,
					hr_version =
					{
						filename = kr_entities_path .. "advanced-assembling-machine/hr-advanced-assembling-machine-sh.png",
						priority = "high",
						width = 346,
						height = 302,
						shift = {0.32, 0.12},
						frame_count = 1,
						repeat_count = 32,
						animation_speed = 0.1,
						draw_as_shadow = true,
						scale = 0.5
					}
				},
				{
					filename = kr_entities_path .. "advanced-assembling-machine/advanced-assembling-machine-w2.png",
					priority = "high",
					width = 19,
					height = 13,
					frame_count = 8,
					line_length = 4,
					repeat_count = 4,
					animation_speed = 0.1,
					shift = {0.17, -1.445},
					hr_version =
					{
						filename = kr_entities_path .. "advanced-assembling-machine/hr-advanced-assembling-machine-w2.png",
						priority = "high",
						width = 37,
						height = 25,
						frame_count = 8,
						line_length = 4,
						repeat_count = 4,
						animation_speed = 0.1,
						shift = {0.17, -1.445},
						scale = 0.5
					}
				},
				{
					filename = kr_entities_path .. "advanced-assembling-machine/advanced-assembling-machine-w3.png",
					priority = "high",
					width = 12,
					height = 9,
					frame_count = 8,
					line_length = 4,
					repeat_count = 4,
					animation_speed = 0.1,
					shift = {0.93, -2.05},
					hr_version =
					{
						filename = kr_entities_path .. "advanced-assembling-machine/hr-advanced-assembling-machine-w3.png",
						priority = "high",
						width = 23,
						height = 15,
						frame_count = 8,
						line_length = 4,
						repeat_count = 4,
						animation_speed = 0.1,
						shift = {0.93, -2.05},
						scale = 0.5
					}
				},
				{
					filename = kr_entities_path .. "advanced-assembling-machine/advanced-assembling-machine-w3.png",
					priority = "high",
					width = 12,
					height = 9,
					frame_count = 8,
					line_length = 4,
					repeat_count = 4,
					animation_speed = 0.1,
					shift = {0.868, -0.082},
					hr_version =
					{
						filename = kr_entities_path .. "advanced-assembling-machine/hr-advanced-assembling-machine-w3.png",
						priority = "high",
						width = 23,
						height = 15,
						frame_count = 8,
						line_length = 4,
						repeat_count = 4,
						animation_speed = 0.1,
						shift = {0.868, -0.082},
						scale = 0.5
					}
				},
				{
					filename = kr_entities_path .. "advanced-assembling-machine/advanced-assembling-machine-w3.png",
					priority = "high",
					width = 12,
					height = 9,
					frame_count = 8,
					line_length = 4,
					repeat_count = 4,
					animation_speed = 0.1,
					shift = {0.868, 0.552},
					hr_version =
					{
						filename = kr_entities_path .. "advanced-assembling-machine/hr-advanced-assembling-machine-w3.png",
						priority = "high",
						width = 23,
						height = 15,
						frame_count = 8,
						line_length = 4,
						repeat_count = 4,
						animation_speed = 0.1,
						shift = {0.868, 0.552},
						scale = 0.5
					}
				}
			}
		},
		crafting_categories = K2RFACList,
		scale_entity_info_icon = true,
		vehicle_impact_sound = sounds.generic_impact,
		working_sound =
		{
			sound =
			{
				{
					filename = kr_buildings_sounds_path .. "advanced-assembling-machine.ogg",
					volume = 0.8
				},
			},
			idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.3 },
			apparent_volume = 1.5,
			max_sounds_per_type = 3,
			fade_in_ticks = 10,
			fade_out_ticks = 30
		},
		idle_sound = { filename = "__base__/sound/idle1.ogg" },
		crafting_speed = 5,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = 5
		},
		
		water_reflection =
		{
			pictures =
			{
				filename = kr_entities_path .. "advanced-assembling-machine/advanced-assembling-machine-reflection.png",
				priority = "extra-high",
				width = 70,
				height = 50,
				shift = util.by_pixel(0, 40),
				variation_count = 1,
				scale = 5,
			},
			rotate = false,
			orientation_to_variation = false
		},
		
		energy_usage = "0.925MW",
		ingredient_count = 255,
		module_specification = { module_slots = 4, module_info_icon_shift = {0, 1.7}, module_info_icon_scale = 1 },
		allowed_effects = {"consumption", "speed", "productivity", "pollution"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.75 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 }
	}
})
