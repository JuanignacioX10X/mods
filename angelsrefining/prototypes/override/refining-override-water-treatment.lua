local OV = angelsmods.functions.OV

angelsmods.functions.move_item("water", "water-treatment-fluid", "a", "fluid")

-------------------------------------------------------------------------------
-- REFINERY ACID WASTE PRODUCTS -----------------------------------------------
-------------------------------------------------------------------------------
if angelsmods.petrochem and angelsmods.trigger.enableacids then
  OV.patch_recipes(
    {
      {
        name = "angelsore2-chunk",
        results = {{name = "water-greenyellow-waste", type = "fluid", amount = "water-yellow-waste"}},
        crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-greenyellow-waste",angelsmods.refining.ore_tints["ore2"]})
      },
      {
        name = "angelsore4-chunk",
        results = {{name = "water-green-waste", type = "fluid", amount = "water-yellow-waste"}},
        crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-green-waste",angelsmods.refining.ore_tints["ore4"]})
      },
      {
        name = "angelsore5-chunk",
        results = {{name = "water-red-waste", type = "fluid", amount = "water-yellow-waste"}},
        crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-red-waste",angelsmods.refining.ore_tints["ore5"]})
      },
      {
        name = "greenyellow-waste-water-purification",
        results = {{name = "fluorite-ore", type = "item", amount = 1}}
      },
      {
        name = "red-waste-water-purification",
        results = {{name = "solid-sodium-nitrate", type = "item", amount = 1}}
      },
      {
        name = "green-waste-water-purification",
        results = {{name = "solid-salt", type = "item", amount = 1}}
      }
    }
  )
elseif angelsmods.functions.is_special_vanilla() then
  --still needed outside of spec vanilla
  OV.disable_recipe(
    {
      "red-waste-water-purification",
      "green-waste-water-purification",
      "greenyellow-waste-water-purification",
      "solid-salt-dissolving"
    }
  )
end

-------------------------------------------------------------------------------
-- WASHING --------------------------------------------------------------------
-------------------------------------------------------------------------------
if angelsmods.trigger.washing_tech == false then --not angelsmods.smelting then
  -- disable products
  OV.disable_recipe(
    {
      "water-viscous-mud",
      "washing-1",
      "washing-2",
      "washing-3",
      "washing-4",
      "washing-5",
      "solid-mud-landfill",
      "solid-geodes",
      "solid-clay",
      "solid-limestone",
      "solid-sand",
    }
  )
  angelsmods.functions.add_flag({
    "water-viscous-mud",
    "water-heavy-mud",
    "water-concentrated-mud",
    "water-light-mud",
    "water-thin-mud",
    "solid-mud",
    "solid-clay",
    "solid-limestone",
    "solid-sand"
  }, "hidden")
  -- disable the buildings as well
  OV.disable_recipe(
    {
      "seafloor-pump",
      "washing-plant",
      "washing-plant-2"
    }
  )
  angelsmods.functions.add_flag({
    "seafloor-pump",
    "washing-plant",
    "washing-plant-2"
  }, "hidden")
  -- disable technology
  OV.disable_technology({"water-washing-1", "water-washing-2"})
  OV.remove_prereq("geode-processing-2", "water-washing-2")
end

angelsmods.functions.move_item("offshore-pump", "washing-building", "d")

-------------------------------------------------------------------------------
-- SALT -----------------------------------------------------------------------
-------------------------------------------------------------------------------
if mods["bobplates"] then
  angelsmods.functions.add_flag("salt", "hidden")

  if not angelsmods.petrochem then
    OV.disable_recipe({"solid-salt-from-saline", "solid-salt"})

    data:extend(
      {
        {
          type = "recipe",
          name = "salt-water-electrolysis-2",
          category = "electrolysis",
          enabled = false,
          energy_required = 1,
          ingredients = {
            {type = "fluid", name = "water-saline", amount = 40}
          },
          results = {
            {type = "item", name = "sodium-hydroxide", amount = 1},
            {type = "fluid", name = "chlorine", amount = 20},
            {type = "fluid", name = "hydrogen", amount = 20}
          },
          --icon = "__angelsrefining__/graphics/icons/electrolysis-salt-water.png",
          --icon_size = 32,
          icons = angelsmods.functions.create_viscous_liquid_recipe_icon(
            {
              "chlorine",
              "hydrogen",
              "sodium-hydroxide"
            },
            {
              {039, 112, 194}, {168, 173, 173}, {070, 133, 232}, {185, 185, 185, 0.8}
            }
          ),
          crafting_machine_tint = angelsmods.functions.get_recipe_tints({"water-saline","chlorine","hydrogen"}),
          subgroup = "bob-fluid-electrolysis",
          order = "b[fluid-chemistry]-b[salt-water-electrolysis]"
        }
      }
    )
    OV.add_unlock("water-treatment", "salt-water-electrolysis-2")
  end
end

-------------------------------------------------------------------------------
-- LITHIA WATER ---------------------------------------------------------------
-------------------------------------------------------------------------------
if mods["bobplates"] then
  data.raw.fluid["lithia-water"].icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, { {032,118,206}, {248,083,099}, {038,137,237,0.8}, {255,073,072,0.8} })
  data.raw.fluid["lithia-water"].icon = nil
  data.raw.fluid["lithia-water"].icon_size = nil
  data.raw.fluid["lithia-water"].icon_mipmaps = nil
  data.raw.fluid["lithia-water"].base_color = angelsmods.functions.fluid_color("Ws4Tw")
  data.raw.fluid["lithia-water"].flow_color = angelsmods.functions.flow_color("Ws4Tw")
  angelsmods.functions.move_item("lithia-water", "water-treatment-fluid", "ea", "fluid")

  data:extend(
    {
      {
        type = "recipe",
        name = "water-thermal-lithia",
        category = "water-treatment",
        subgroup = "water-treatment",
        enabled = false,
        energy_required = 1,
        ingredients = {
          {type = "fluid", name = "thermal-water", amount = 100}
        },
        results = {
          {type = "fluid", name = "lithia-water", amount = 40},
          {type = "fluid", name = "water-purified", amount = 60}
        },
        --icon = "__angelsrefining__/graphics/icons/water-thermal-lithia.png",
        --icon_size = 32,
        icons = angelsmods.functions.create_liquid_recipe_icon(
          {
            "lithia-water",
            "water-purified"
          },
          {
            {243,135,000}, {247,140,003}, {247,140,003}
          }
        ),
        crafting_machine_tint = angelsmods.functions.get_recipe_tints({"thermal-water","lithia-water","water-purified"}),
        order = "g[water-thermal-lithia]"
      }
    }
  )
  OV.add_unlock("thermal-water-extraction", "water-thermal-lithia")
end

-------------------------------------------------------------------------------
-- PURE-WATER -----------------------------------------------------------------
-------------------------------------------------------------------------------
if mods["bobplates"] then
  if data.raw.fluid["pure-water"] then
    OV.global_replace_item("pure-water", "water-purified")
    OV.disable_recipe({"pure-water", "pure-water-from-lithia"})
    data.raw.fluid["pure-water"].hidden = true
    angelsmods.functions.disable_barreling_recipes("pure-water")
  end

  --Insert water resources to bob recipes (NEED A WAY TO PATCH A SPECIFIC TINT)
  OV.patch_recipes(
    {
      {name = "water-electrolysis", ingredients = {{name = "water-purified", type = "fluid", amount = "water"}}},
      {name = "nitric-acid", ingredients = {{name = "water-purified", type = "fluid", amount = "water"}}},
      {name = "sulfuric-acid-2", ingredients = {{name = "water-purified", type = "fluid", amount = "water"}}},
      {name = "petroleum-gas-cracking", ingredients = {{name = "water-purified", type = "fluid", amount = "water"}}},
      {name = "coal-cracking", ingredients = {{name = "water-purified", type = "fluid", amount = "water"}}},
      {name = "lithium-water-electrolysis", ingredients = {{name = "water-purified", type = "fluid", amount = "water"}}},
      {name = "explosives", ingredients = {{name = "water-purified", type = "fluid", amount = "water"}}},
      {name = "sulfur", ingredients = {{name = "water-purified", type = "fluid", amount = "water"}}},
      {name = "sulfuric-acid", ingredients = {{name = "water-purified", type = "fluid", amount = "water"}}},
      {name = "heavy-oil-cracking", ingredients = {{name = "water-purified", type = "fluid", amount = "water"}}},
      {name = "light-oil-cracking", ingredients = {{name = "water-purified", type = "fluid", amount = "water"}}},
      {name = "advanced-oil-processing", ingredients = {{name = "water-purified", type = "fluid", amount = "water"}}}
    }
  )
else
  if (angelsmods.smelting and angelsmods.trigger.smelting_products["lithium"].plate or mods["bobplates"]) or
     (angelsmods.industries and angelsmods.industries.overhaul) then
  else
    angelsmods.functions.add_flag("solid-lithium", "hidden")
    OV.disable_recipe("solid-lithium")
  end
end
