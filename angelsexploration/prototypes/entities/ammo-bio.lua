data:extend(
  {
    --BIO GUN AMMO
    {
      type = "sticker",
      name = "bio-slowdown-sticker",
      --icon = "__base__/graphics/icons/slowdown-sticker.png",
      icon_size = 32,
      flags = {},
      animation = {
        filename = "__base__/graphics/entity/slowdown-sticker/slowdown-sticker.png",
        priority = "extra-high",
        line_length = 5,
        width = 22,
        height = 24,
        frame_count = 50,
        animation_speed = 0.5,
        tint = {r = 0.250, g = 0.663, b = 0.000, a = 0.694},
        shift = util.by_pixel (2,-1),
        hr_version = 
        {
          filename = "__base__/graphics/entity/slowdown-sticker/hr-slowdown-sticker.png",
          line_length = 5,
          width = 42,
          height = 48,
          frame_count = 50,
          animation_speed = 0.5,
          tint = {r = 0.250, g = 0.663, b = 0.000, a = 0.694},
          shift = util.by_pixel(2, -0.5),
          scale = 0.5
        }
      },
      duration_in_ticks = 30 * 60,
      target_movement_modifier = 0.4
      --damage_per_tick = { amount = 0 / 60, type = "bio" },
    },
    {
      type = "fire",
      name = "bio-splash",
      flags = {"placeable-off-grid", "not-on-map"},
      damage_per_tick = {amount = 0 / 60, type = "bio"},
      on_damage_tick_effect = {
        type = "direct",
        --force = "enemy",
        ignore_collision_condition = true,
        trigger_target_mask = {"ground-unit"},
        filter_enabled = true,
        action_delivery = {
          type = "instant",
          target_effects = {
            {
              type = "create-sticker",
              sticker = "bio-slowdown-sticker",
              show_in_tooltip = true
            },
            {
              type = "damage",
              damage = {amount = 7.5 / 6, type = "bio"}, -- 7.5 dmg/sec
              apply_damage_to_trees = false,
              show_in_tooltip = true
            }
          }
        }
      },
      maximum_damage_multiplier = 5,
      damage_multiplier_increase_per_added_fuel = 1,
      damage_multiplier_decrease_per_tick = 1 / 5 / 60,
      --spawn_entity = "fire-flame-on-tree",
      uses_alternative_behavior = true,
      limit_overlapping_particles = true,
      initial_render_layer = "object",
      render_layer = "lower-object-above-shadow",
      --secondary_render_layer = "higher-object-above",
      --secondary_picture_fade_out_start = 30,
      --secondary_picture_fade_out_duration = 60,

      spread_delay = 300,
      spread_delay_deviation = 180,
      maximum_spread_count = 100,
      particle_alpha = 0.6,
      particle_alpha_blend_duration = 60 * 5,
      --flame_alpha = 0.35,
      --flame_alpha_deviation = 0.05,

      emissions_per_second = 0,
      add_fuel_cooldown = 10,
      fade_in_duration = 1,
      fade_out_duration = 30,
      initial_lifetime = 60 * 20,
      lifetime_increase_by = 60 * 2.5,
      lifetime_increase_cooldown = 60 * 0.5,
      maximum_lifetime = 60 * 30,
      delay_between_initial_flames = 10,
      initial_flame_count = 1,
      burnt_patch_lifetime = 0,
      pictures = {
        {
          filename = "__angelsexploration__/graphics/entity/bio-projectile/splash-1.png",
          line_length = 5,
          width = 199,
          height = 159,
          frame_count = 20,
          shift = {0.484375, -0.171875}
        },
        {
          filename = "__angelsexploration__/graphics/entity/bio-projectile/splash-2.png",
          line_length = 5,
          width = 238,
          height = 157,
          frame_count = 20,
          shift = {0.8125, -0.15625}
        },
        {
          filename = "__angelsexploration__/graphics/entity/bio-projectile/splash-3.png",
          line_length = 5,
          width = 240,
          height = 162,
          frame_count = 20,
          shift = {0.71875, -0.09375}
        },
        {
          filename = "__angelsexploration__/graphics/entity/bio-projectile/splash-4.png",
          line_length = 5,
          width = 241,
          height = 146,
          frame_count = 20,
          shift = {0.703125, -0.375}
        }
      }
    },
    {
      type = "stream",
      name = "bio-stream",
      flags = {"not-on-map"},
      stream_light = {intensity = 1, size = 4},
      ground_light = {intensity = 0.8, size = 4},
      smoke_sources = {
        {
          name = "soft-fire-smoke",
          frequency = 0.05, --0.25,
          position = {0.0, 0}, -- -0.8},
          starting_frame_deviation = 60
        }
      },
      particle_buffer_size = 90,
      particle_spawn_interval = 6,
      particle_spawn_timeout = 24,
      particle_vertical_acceleration = 0.005 * 0.60,
      particle_horizontal_speed = 0.2 * 0.75 * 1.5,
      particle_horizontal_speed_deviation = 0.005 * 0.70,
      particle_start_alpha = 0.5,
      particle_end_alpha = 1,
      particle_start_scale = 0.2,
      particle_loop_frame_count = 3,
      particle_fade_out_threshold = 0.9,
      particle_loop_exit_threshold = 0.25,
      action = {
        {
          type = "area",
          radius = 2.5,
          --repeat_count = 2,
          --force = "enemy",
          --ignore_collision_condition = true,
          action_delivery = {
            type = "instant",
            target_effects = {
              {
                type = "create-sticker",
                sticker = "bio-slowdown-sticker",
                show_in_tooltip = false
              },
              {
                type = "damage",
                damage = {amount = 5, type = "bio"},
                apply_damage_to_trees = false,
                show_in_tooltip = true
              }
            }
          }
        },
        {
          type = "direct",
          action_delivery = {
            type = "instant",
            target_effects = {
              {
                type = "play-sound",
                sound = {
                  {
                    filename = "__base__/sound/creatures/projectile-acid-burn-1.ogg",
                    volume = 0.8
                  },
                  {
                    filename = "__base__/sound/creatures/projectile-acid-burn-2.ogg",
                    volume = 0.8
                  },
                  {
                    filename = "__base__/sound/creatures/projectile-acid-burn-long-1.ogg",
                    volume = 0.8
                  },
                  {
                    filename = "__base__/sound/creatures/projectile-acid-burn-long-2.ogg",
                    volume = 0.8
                  }
                }
              },
              --{
              --  type = "create-entity",
              --  entity_name = "bio-splash"
              --},
              --{
              --  type = "damage",
              --  damage = {amount = 5, type = "bio"}
              --}
              {
                type = "create-fire",
                entity_name = "bio-splash",
                tile_collision_mask = {"water-tile"},
                show_in_tooltip = true
              },
              {
                type = "create-entity",
                entity_name = "water-splash",
                tile_collision_mask = {"ground-tile"},
                show_in_tooltip = false
              }
            }
          }
        }
      },
      spine_animation = {
        filename = "__angelsexploration__/graphics/entity/bio-projectile/bio-projectile.png",
        line_length = 5,
        width = 16,
        height = 18,
        frame_count = 33,
        priority = "high",
        blend_mode = "additive",
        axially_symmetrical = false,
        direction_count = 1,
        animation_speed = 2,
        shift = {0, 0}
      },
      shadow = {
        filename = "__base__/graphics/entity/acid-projectile/acid-projectile-shadow.png",
        line_length = 15,
        width = 22,
        height = 84,
        frame_count = 15,
        priority = "high",
        shift = {-0.09, 0.395}
      },
      particle = {
        filename = "__angelsexploration__/graphics/entity/blank.png",
        priority = "extra-high",
        width = 1,
        height = 1,
        frame_count = 1,
        line_length = 1
      }
    },
    {
      type = "ammo",
      name = "bio-ammo",
      icon = "__angelsexploration__/graphics/icons/bio-ammo.png",
      icon_size = 64,
      icon_mipmaps = 4,
      flags = {},
      ammo_type = {
        {
          source_type = "default",
          category = "bio",
          target_type = "position",
          clamp_position = true,
          action = {
            type = "direct",
            action_delivery = {
              type = "stream",
              stream = "bio-stream",
            }
          }
        }
      },
      magazine_size = 100,
      subgroup = "angels-fire",
      order = "c[basic-ammo]-b[bio-rounds]",
      stack_size = 100
    }
  }
)

