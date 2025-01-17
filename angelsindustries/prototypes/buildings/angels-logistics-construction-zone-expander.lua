circuit_connector_definitions["angels-construction-zone-expander-1"] = circuit_connector_definitions.create(
  universal_connector_template,
  {
    {variation = 26, main_offset = util.by_pixel(0, 0), shadow_offset = util.by_pixel(2, 12), show_shadow = false}
  }
)

circuit_connector_definitions["angels-construction-zone-expander-2"] = circuit_connector_definitions.create(
  universal_connector_template,
  {
    {variation = 26, main_offset = util.by_pixel(8, 0), shadow_offset = util.by_pixel(10, 12), show_shadow = false}
  }
)

data:extend(
  {
    {
      type = "item",
      name = "angels-construction-zone-expander",
      icon = "__angelsindustries__/graphics/icons/small-construction-zone-expander-icon.png",
      icon_size = 32,
      subgroup = "angels-cargo-expander",
      order = "b[expander]-c[construction]-a",
      place_result = "angels-construction-zone-expander",
      stack_size = 50
    },
    {
      type = "roboport",
      name = "angels-construction-zone-expander",
      icon = "__angelsindustries__/graphics/icons/small-construction-zone-expander-icon.png",
      icon_size = 32,
      flags = {"placeable-player", "player-creation"},
      minable = {mining_time = 0.5, result = "angels-construction-zone-expander"},
      fast_replaceable_group = "roboport",
      max_health = 500,
      corpse = "small-remnants",
      collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      drawing_box = {{-0.5, -2.1}, {0.5, 0.5}},
      dying_explosion = "medium-explosion",
      energy_source = {
        type = "void",
        render_no_power_icon = false,
        render_no_network_icon = false,
        --input_flow_limit = "0.10MW", -- 50 drain + 50kW buffer filling
        --buffer_capacity = "2MJ",
        --drain = "50kW"
      },
      charging_energy = "0kW",
      recharge_minimum = "0MJ",
      energy_usage = "0kW",
      --energy_usage = "50kW",
      logistics_radius = 0,
      logistics_connection_distance = 4.5,
      construction_radius = 22.5,
      charge_approach_distance = 0,
      robot_slots_count = 0,
      material_slots_count = 0,
      -- stationing_offset = {0, 0},
      -- charging_offsets = {{0, 0}},
      base = {
        filename = "__angelsindustries__/graphics/entity/zone-expander/small-base-lr.png",
        width = 64,
        height = 112,
        shift = {0.25, -1}
      },
      base_animation = {
        filename = "__angelsindustries__/graphics/entity/zone-expander/small-construction-zone-expander-lr.png",
        priority = "medium",
        width = 64,
        height = 112,
        frame_count = 16,
        line_length = 4,
        shift = {0.25, -1},
        animation_speed = 0.25
      },
      base_patch = {
        filename = "__angelsindustries__/graphics/entity/empty.png",
        width = 1,
        height = 1,
        frame_count = 1
      },
      door_animation_up = {
        filename = "__angelsindustries__/graphics/entity/empty.png",
        width = 1,
        height = 1,
        frame_count = 1
      },
      door_animation_down = {
        filename = "__angelsindustries__/graphics/entity/empty.png",
        width = 1,
        height = 1,
        frame_count = 1
      },
      recharging_animation = {
        filename = "__angelsindustries__/graphics/entity/empty.png",
        width = 1,
        height = 1,
        frame_count = 1
      },
      recharging_light = {intensity = 0, size = 0},
      request_to_open_door_timeout = 0,
      spawn_and_station_height = 0,
      draw_logistic_radius_visualization = true,
      draw_construction_radius_visualization = true,
      circuit_wire_connection_point = circuit_connector_definitions["angels-construction-zone-expander-1"].points,
      circuit_connector_sprites = circuit_connector_definitions["angels-construction-zone-expander-1"].sprites,
      circuit_wire_max_distance = default_circuit_wire_max_distance,
      default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
      default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
      default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
      default_total_construction_output_signal = {type = "virtual", name = "signal-T"}
    },
    {
      type = "item",
      name = "angels-construction-zone-expander-2",
      icon = "__angelsindustries__/graphics/icons/medium-construction-zone-expander-icon.png",
      icon_size = 32,
      subgroup = "angels-cargo-expander",
      order = "b[expander]-c[construction]-b",
      place_result = "angels-construction-zone-expander-2",
      stack_size = 50
    },
    {
      type = "roboport",
      name = "angels-construction-zone-expander-2",
      icon = "__angelsindustries__/graphics/icons/medium-construction-zone-expander-icon.png",
      icon_size = 32,
      flags = {"placeable-player", "player-creation"},
      minable = {mining_time = 0.5, result = "angels-construction-zone-expander-2"},
      fast_replaceable_group = "roboport",
      max_health = 500,
      corpse = "small-remnants",
      collision_box = {{-0.65, -0.65}, {0.65, 0.65}},
      selection_box = {{-1, -1}, {1, 1}},
      drawing_box = {{-1, -4.1}, {1, 1}},
      dying_explosion = "medium-explosion",
      energy_source = {
        type = "void",
        render_no_power_icon = false,
        render_no_network_icon = false,
        --input_flow_limit = "0.3MW", -- 100kW drain + 200kW buffer filling
        --buffer_capacity = "6MJ",
        --drain = "100kW"
      },
      charging_energy = "0kW",
      recharge_minimum = "0MJ",
      energy_usage = "0kW",
      --energy_usage = "100kW",
      logistics_radius = 0,
      logistics_connection_distance = 10 * 1.5,
      construction_radius = 45,
      charge_approach_distance = 0,
      robot_slots_count = 0,
      material_slots_count = 0,
      -- stationing_offset = {0, 0},
      -- charging_offsets = {{0, 0}},
      base = {
        filename = "__angelsindustries__/graphics/entity/zone-expander/medium-base-lr.png",
        width = 128,
        height = 224,
        shift = {0.5, -1.75}
      },
      base_animation = {
        filename = "__angelsindustries__/graphics/entity/zone-expander/medium-construction-zone-expander-lr.png",
        priority = "medium",
        width = 128,
        height = 224,
        frame_count = 16,
        line_length = 4,
        shift = {0.5, -1.75},
        animation_speed = 0.25
      },
      base_patch = {
        filename = "__angelsindustries__/graphics/entity/empty.png",
        width = 1,
        height = 1,
        frame_count = 1
      },
      door_animation_up = {
        filename = "__angelsindustries__/graphics/entity/empty.png",
        width = 1,
        height = 1,
        frame_count = 1
      },
      door_animation_down = {
        filename = "__angelsindustries__/graphics/entity/empty.png",
        width = 1,
        height = 1,
        frame_count = 1
      },
      recharging_animation = {
        filename = "__angelsindustries__/graphics/entity/empty.png",
        width = 1,
        height = 1,
        frame_count = 1
      },
      recharging_light = {intensity = 0, size = 0},
      request_to_open_door_timeout = 0,
      spawn_and_station_height = 0,
      draw_logistic_radius_visualization = true,
      draw_construction_radius_visualization = true,
      circuit_wire_connection_point = circuit_connector_definitions["angels-construction-zone-expander-2"].points,
      circuit_connector_sprites = circuit_connector_definitions["angels-construction-zone-expander-2"].sprites,
      circuit_wire_max_distance = default_circuit_wire_max_distance,
      default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
      default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
      default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
      default_total_construction_output_signal = {type = "virtual", name = "signal-T"}
    },
    {
      type = "item",
      name = "angels-construction-zone-expander-3",
      icon = "__angelsindustries__/graphics/icons/large-construction-zone-expander-icon.png",
      icon_size = 64,
      subgroup = "angels-cargo-expander",
      order = "b[expander]-c[construction]-c",
      place_result = "angels-construction-zone-expander-3",
      stack_size = 50
    },
    {
      type = "roboport",
      name = "angels-construction-zone-expander-3",
      icon = "__angelsindustries__/graphics/icons/large-construction-zone-expander-icon.png",
      icon_size = 64,
      flags = {"placeable-player", "player-creation"},
      minable = {mining_time = 0.5, result = "angels-construction-zone-expander-3"},
      fast_replaceable_group = "roboport",
      max_health = 500,
      corpse = "small-remnants",
      collision_box = {{-1.25, -1.25}, {1.25, 1.25}},
      selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
      drawing_box = {{-1.5, -6.5}, {1.5, 1.5}},
      dying_explosion = "medium-explosion",
      energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        input_flow_limit = "0.6MW", -- 200kW drain + 1 * 200kW recharging bots + 200kW buffer filling
        buffer_capacity = "12MJ",
        --drain = "100kW"
      },
      charging_energy = "200kW",
      recharge_minimum = "3MJ",
      energy_usage = "100kW",
      --energy_usage = "100kW",
      logistics_radius = 0,
      logistics_connection_distance = 10 * 3,
      construction_radius = 62.5,
      charge_approach_distance = 0,
      robot_slots_count = 0,
      material_slots_count = 0,
      stationing_offset = {0, -5},
      charging_offsets = {{0, -5}},
      base = {
        filename = "__angelsindustries__/graphics/entity/empty.png",
        width = 1,
        height = 1,
      },
      base_animation = {
        filename = "__angelsindustries__/graphics/entity/zone-expander/large-construction-zone-expander-lr.png",
        priority = "medium",
        width = 234,
        height = 308,
        frame_count = 16,
        line_length = 4,
        shift = {1.475, -2.65},
        animation_speed = 0.25
      },
      base_patch = {
        filename = "__angelsindustries__/graphics/entity/empty.png",
        width = 1,
        height = 1,
        frame_count = 1
      },
      door_animation_up = {
        filename = "__angelsindustries__/graphics/entity/empty.png",
        width = 1,
        height = 1,
        frame_count = 1
      },
      door_animation_down = {
        filename = "__angelsindustries__/graphics/entity/empty.png",
        width = 1,
        height = 1,
        frame_count = 1
      },
      recharging_animation =
      {
        filename = "__angelsindustries__/graphics/entity/cargo-roboport/cargoroboport-recharging.png",
        priority = "high",
        width = 74,
        height = 70,
        frame_count = 16,
        scale = 1.5,
        animation_speed = 0.5
      },
      recharging_light = {intensity = 0, size = 0},
      request_to_open_door_timeout = 0,
      spawn_and_station_height = 0,
      draw_logistic_radius_visualization = true,
      draw_construction_radius_visualization = true,
      circuit_wire_connection_point = circuit_connector_definitions["angels-construction-zone-expander-2"].points,
      circuit_connector_sprites = circuit_connector_definitions["angels-construction-zone-expander-2"].sprites,
      circuit_wire_max_distance = default_circuit_wire_max_distance,
      default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
      default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
      default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
      default_total_construction_output_signal = {type = "virtual", name = "signal-T"}
    }
  }
)