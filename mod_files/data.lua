-- Get the menu simulations
local main_menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations

-- Remove vanilla menu simulations if the user wants
if settings.startup["hall-of-fame-disable-defaults"].value then
  main_menu_simulations.solar_power_construction = nil
  main_menu_simulations.lab = nil
  main_menu_simulations.burner_city = nil
  main_menu_simulations.mining_defense = nil
  main_menu_simulations.forest_fire = nil
  main_menu_simulations.oil_pumpjacks = nil
  main_menu_simulations.oil_refinery = nil
  main_menu_simulations.early_smelting = nil
  main_menu_simulations.train_station = nil
  main_menu_simulations.logistic_robots = nil
  main_menu_simulations.nuclear_power = nil
  main_menu_simulations.train_junction = nil
  main_menu_simulations.artillery = nil
  main_menu_simulations.biter_base_spidertron = nil
  main_menu_simulations.biter_base_artillery = nil
  main_menu_simulations.biter_base_laser_defense = nil
  main_menu_simulations.biter_base_player_attack = nil
  main_menu_simulations.biter_base_steamrolled = nil
  main_menu_simulations.chase_player = nil
  main_menu_simulations.big_defense = nil
  main_menu_simulations.brutal_defeat = nil
  main_menu_simulations.spider_ponds = nil
end

-- Define some constants
local playtime = 60 * settings.startup["hall-of-fame-playback-time"].value

local alt_info = "" 
if settings.startup["hall-of-fame-camera-alt-info"].value then alt_info = "game.camera_alt_info = true" end

-- Create a function that will create code to draw the text boxes
function draw_label_code(position, text, text_scale, rect_width, overwrite_header)
  -- overwrite_header: '' to disable, 'something_else' to display 'something_else'
  
  -- The code that we will generate to draw the label
  code = "" 

  -- Constants
  local header_scale = 0.65                 -- Relative to text size
  local spacing_factor = 0.4                -- Vertical spacing between text (multiplied by text scale)
  local rect_pad = {0.3, 0}               -- Padding between text and rectangle corner
  local border_factor = {0.1, 0.1}          -- Factor to scale border width by (multiplied by text scale)

  local colour_text = {r=204,g=102,b=0}         -- Colour of main text
  local colour_text_hof = {r=200,g=180,b=150}   -- Colour of the Hall of Fame text
  local colour_rect_out = {r=35,g=35,b=35}      -- Colour of the outer rectangle
  local colour_rect_in = {r=48,g=48,b=48}      -- Colour of the inner rectangle

  -- Variables  
  local border_width = {border_factor[1]*text_scale, border_factor[2]*text_scale}
  local spacing = {0, spacing_factor*text_scale}
  local header = 'Hall of Fame'
  if overwrite_header == '' then 
    header = nil 
  elseif overwrite_header ~= nil then
    header = overwrite_header
  end
  local num_of_lines = #text
  if header ~= nil then num_of_lines = num_of_lines + 0.5 end

  -- Draw outer rectangle
  code = code .. [[
    rendering.draw_rectangle{
      color={]]..colour_rect_out.r..[[,]]..colour_rect_out.g..[[,]]..colour_rect_out.b..[[},      
      filled=true,
      left_top = {
        ]]..position[1]-rect_pad[1]-border_width[1]..[[,
        ]]..position[2]-rect_pad[2]-border_width[2]..[[
      },
      right_bottom = {
        ]]..position[1] + rect_width + rect_pad[1] + border_width[1]..[[,
        ]]..position[2] + rect_pad[2] + (num_of_lines+header_scale)*spacing[2] + border_width[2]..[[
      },
      surface = game.surfaces.nauvis
    }

    -- Draw inner rectangle
    rendering.draw_rectangle{
      color={]]..colour_rect_in.r..[[,]]..colour_rect_in.g..[[,]]..colour_rect_in.b..[[},
      filled=true,
      left_top = {]]..position[1]-rect_pad[1]..[[,]]..position[2]-rect_pad[2]..[[},
      right_bottom = {
        ]]..position[1] + rect_width + rect_pad[1]..[[,
        ]]..position[2] + rect_pad[2] + (num_of_lines + header_scale) * spacing[2]..[[
      },
      surface = game.surfaces.nauvis
    }
  ]]

  -- Draw the Hall of Fame label
  local current_pos = position

  if header ~= nil then
    code = code .. [[
      rendering.draw_text{
        text="]]..header..[[", 
        surface=game.surfaces.nauvis, 
        target={]]..current_pos[1]..[[,]]..current_pos[2]..[[},
        color={]]..colour_text_hof.r..[[,]]..colour_text_hof.g..[[,]]..colour_text_hof.b..[[}, 
        scale=]]..text_scale*header_scale..[[
      }
    ]]

    -- Update the 'cursor' after the heading
    current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
  end

  -- Draw the text
  for _, snippet in ipairs(text) do

    -- Now generate the code    
    code = code .. [[
      rendering.draw_text{
        text="]]..snippet..[[",
        surface=game.surfaces.nauvis, 
        target={]]..current_pos[1]..[[,]]..current_pos[2]..[[},
        color={]]..colour_text.r..[[,]]..colour_text.g..[[,]]..colour_text.b..[[}, 
        scale=]]..text_scale..[[
      }
    ]]
    
    -- Update the 'cursor'
    current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
  end

  return code

end

--------------------------------------------------------------------------
-- Now add all the simulations
--------------------------------------------------------------------------

main_menu_simulations.V453000_GridLock = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/V453000_GridLock.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {-220, 115}
    game.camera_zoom = 0.35
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {-198, 121}, -- position
      {
        "V453000",        
        "GridLock",
        "Used by Wube for Roll-Up",
        "27 March 2018"
      },  -- text to display
      5,  -- text scale
      23 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
    -- Ensure the tank technology is always being researched to keep the labs going.
    if game.forces[1].technologies['mining-productivity-4'].researched == true then
      game.forces[1].technologies['mining-productivity-4'].researched = false
      game.forces[1].add_research('mining-productivity-4')
    end
  ]]
}

main_menu_simulations.antielitz_any15815 = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/antielitz_any15815.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {-53.5, 90}
    game.camera_zoom = 0.75
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {-33, 100}, -- position
      {
        "AntiElitz",        
        "Speedrun Any% Factorio 0.14",
        "World Record: 1h 58m 15s",
        "26 March 2017"
      },  -- text to display
      2.2,  -- text scale
      11.5 -- rectangle width
    ) .. [[
  ]],
  update =
  [[    
  ]]
}

main_menu_simulations.wube_11_officemap = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/wube_11_officemap.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {-467, 460}
    game.camera_zoom = 0.7
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {-471, 475}, -- position
      {
        "Wube",        
        "V1.1 Playtesting",
        "30 January 2021"
      },  -- text to display
      2.5,  -- text scale
      8 -- rectangle width
    ) .. [[
  ]],
  update =
  [[    
  ]]
}

main_menu_simulations.nefrums_13857 = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/nefrums_13857.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {45.5, 207.5}
    game.camera_zoom = 0.6
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {9.5, 199.5}, -- position
      {
        "Nefrums",
        "Speedrun Any%",
        "Former World Record: 1h 38m 58s",
        "4 December 2020"
      },  -- text to display
      2.5,  -- text scale
      15 -- rectangle width
    ) .. [[
  ]],
  update =
  [[    
  ]]
}

main_menu_simulations.flame_Sla_30x1000spm = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/flame_Sla_30x1000spm.zip",
  length = playtime,
  init =
  [[    
    game.camera_position = {585.5, -38.5}
    game.camera_zoom = 0.5
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {599.5, -16.5}, -- position
      {
        "flame_Sla",
        "30 kSPM 60 UPS",
        "7 January 2021"
      },  -- text to display
      3.5,  -- text scale
      11 -- rectangle width
    ) .. [[        
  ]],
  update =
  [[
    -- Ensure the tank technology is always being researched to keep the labs going.
    if game.forces[1].technologies['mining-productivity-4'].researched == true then
      game.forces[1].technologies['mining-productivity-4'].researched = false
      game.forces[1].add_research('mining-productivity-4')
    end
  ]]
}

main_menu_simulations.mangledpork_towns = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/mangledpork_towns.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {-174, 489}
    game.camera_zoom = 0.5
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {-144, 506}, -- position
      {
        "MangledPork",
        "Towns",
        "27 July 2015"
      },  -- text to display
      4,  -- text scale
      12 -- rectangle width
    ) .. [[
  ]], 
  update =
  [[
    -- Ensure the tank technology is always being researched to keep the labs going.
    if game.forces[1].technologies['tank'].researched == true then
      game.forces[1].technologies['tank'].researched = false
      game.forces[1].add_research('tank')
    end
  ]]
}

main_menu_simulations.silverwyrm_gear_mk2 = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/silverwyrm_gear_mk2.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {6, 292}
    game.camera_zoom = 0.25
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {-90, 287}, -- position
      {
        "silverwyrm",
        "The Gear Mk2",
        "24 September 2020"
      },  -- text to display
      7,  -- text scale
      25 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.zisteau_meiosis = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/zisteau_meiosis.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {-765, 6}
    game.camera_zoom = 0.3
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {-837, 29}, -- position
      {
        "Zisteau",
        "Meiosis",
        "8 May 2017"
      },  -- text to display
      6,  -- text scale
      15 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}


main_menu_simulations.Ellipticality_logistic_distribution = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/Ellipticality_logistic_distribution.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {-184, -58224}
    game.camera_zoom = 0.35
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {-130, -58204}, -- position
      {
        "Ellipticality",
        "Logistic Distribution Center",
        "10 October 2020"
      },  -- text to display
      4.6,  -- text scale
      23 -- rectangle width
    ) .. [[
  ]],  
  update =
  [[
  ]]
}

main_menu_simulations.griswold_ant_farm = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/griswold_ant_farm.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {-820, -1017.5}
    game.camera_zoom = 0.35
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {-897, -992}, -- position
      {
        "Griswold",
        "Antfarm 1RPM",
        "16 October 2017"
      },  -- text to display
      4.5,  -- text scale
      15 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.niftymaniac_greygoo1 = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/niftymaniac_greygoo1.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {126, -132.5}
    game.camera_zoom = 0.3
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {55, -115}, -- position
      {
        "NiftyManiac",
        "GreyGoo Mk I",
        "A Self-Expanding Factory",
        "16 February 2017"
      },  -- text to display
      5,  -- text scale
      23 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.t1024_diag = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/t1024_diag.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {-135, -6}
    game.camera_zoom = 0.45
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {-162, 15}, -- position
      {
        "T-1024",
        "Diagonal Base",
        "31 March 2018"
      },  -- text to display
      3.8,  -- text scale
      11 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.stevetrov_15rpm = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/stevetrov_15rpm.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {1636, 1405}
    game.camera_zoom = 0.365
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {1567, 1389.5}, -- position
      {
        "SteveTrov",
        "15 RPM",
        "13 April 2017"
      },  -- text to display
      4.5,  -- text scale
      12 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.xterminator_ssts = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/xterminator_ssts.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {-1909, -862.5}
    game.camera_zoom = 0.26
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {-1956, -820}, -- position
      {
        "Xterminator",
        "Send Supporters to Space",
        "12 September 2017"
      },  -- text to display
      6,  -- text scale
      28 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.challenge_32x32 = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/32x32_challenge.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {-41.5, -83}
    game.camera_zoom = 0.65
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {-48, -64}, -- position
      {
        "One Chunk Factory Challenge",
        "All sciences within 32x32 tiles",
        "December 2019"
      },  -- text to display
      2.4,  -- text scale
      13 -- rectangle width
    ) .. [[

    ]] .. draw_label_code(
      {-72, -63.5}, -- position
      {
        "acmemyst",
        "9.2 SPM"
      },  -- text to display
      2.4,  -- text scale
      6, -- rectangle width
      '1st' -- overwrite header
    ) .. [[

    ]] .. draw_label_code(
      {-18, -63.5}, -- position
      {
        "ostertoasterii",
        "8.7 SPM"
      },  -- text to display
      2.4,  -- text scale
      6, -- rectangle width
      '2nd' -- overwrite header
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.kos_mmo_202001 = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/kos_mmo_202001.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {506, -560}
    game.camera_zoom = 0.4
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {445, -588}, -- position
      {
        "KatherineOfSky and Caledorn",
        "Massive Multiplayer World Record",
        "Peak 521 Concurrent Players",
        "25 January 2020"
      },  -- text to display
      4,  -- text scale
      25 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.PM_ME_DELICIOUS_FOOD_bagel = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/PM_ME_DELICIOUS_FOOD_bagel.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {82.5, -102}
    game.camera_zoom = 0.30
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {135, -77}, -- position
      {
        "PM_ME_DELICIOUS_FOOD",
        "BadBagel Spaghetti",
        "30 October 2020"
      },  -- text to display
      5,  -- text scale
      25 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.goose_Burner_inserter_megabase = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/goose_Burner_inserter_megabase.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {1515, 1295}
    game.camera_zoom = 0.30
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {1562, 1333}, -- position
      {
        "Goose",
        "Burner Inserter Megabase",
        "September 2019"
      },  -- text to display
      5.5,  -- text scale
      26 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.Quazarz_science_rivier = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/Quazarz_science_rivier.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {28, -147.5}
    game.camera_zoom = 0.30
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {79, -180}, -- position
      {
        "Quazarz_",
        "Science River",
        "1 May 2019"
      },  -- text to display
      6,  -- text scale
      18 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.soelless_gaming_beautiful = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/soelless_gaming_beautiful.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {11.5, 23.5}
    game.camera_zoom = 0.45
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {36, -7}, -- position
      {
        "Soelless Gaming",
        "Beautiful Megabase",
        "31 October 2017"
      },  -- text to display
      3.5,  -- text scale
      13 -- rectangle width
    ) .. [[
  ]],  
  update =
  [[
  ]]
}

main_menu_simulations.kfitik_14kpms = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/kfitik_14kpms.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {3120, 1287}
    game.camera_zoom = 0.5
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {3115.5, 1307}, -- position
      {
        "Kfitik",
        "14 kSPM 7 UPS",
        "16 October 2020"
      },  -- text to display
      3,  -- text scale
      9 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.Gh0stP1rate_vanilla_10kspm = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/Gh0stP1rate_vanilla_10kspm.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {1029, 712}
    game.camera_zoom = 0.3
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {950, 670}, -- position
      {
        "Gh0stP1rate and Hamiebarmund",
        "10 kSPM Vanilla",
        "7 November 2020"
      },  -- text to display
      5.5,  -- text scale
      34 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.p0ober_jdplays_spaghetti_world = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/p0ober_jdplays_spaghetti_world.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {11.7, -275}
    game.camera_zoom = 0.35
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {-50, -259}, -- position
      {
        "P0ober & JD-Plays",
        "Spaghetti Base",
        "9 May 2020"
      },  -- text to display
      5,  -- text scale
      17 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.accidentalchef_10rpm = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/accidentalchef_10rpm.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {-200, 590}
    game.camera_zoom = 0.8
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {-176.5, 603}, -- position
      {
        "AccidentalChef",
        "10 RPM",
        "18 January 2017"
      },  -- text to display
      2.5,  -- text scale
      7.5 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.swolar_20kspm = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/swolar_20kspm.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {307, -443}
    game.camera_zoom = 0.35
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {354, -411}, -- position
      {
        "swolar",
        "20 kSPM 60 UPS",
        "6 May 2020"
      },  -- text to display
      4.5,  -- text scale
      15 -- rectangle width
    ) .. [[
  ]],  
  update =
  [[
  ]]
}

main_menu_simulations.horvenbeestinger_2500spm = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/horvenbeestinger_2500spm.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {1595, 100}
    game.camera_zoom = 0.25
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {1660, 142}, -- position
      {
        "Horvenbeestinger",
        "Beautiful Megabase",
        "26 September 2020"
      },  -- text to display
      6,  -- text scale
      24 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.lilyrose_beltmegabase = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/lilyrose_belt_megabase.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {951009, 950060}
    game.camera_zoom = 0.3
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {951001.5, 950092}, -- position
      {
        "Lily Rose",
        "Belt Megabase",
        "17 April 2018"
      },  -- text to display
      5,  -- text scale
      15 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}

main_menu_simulations.davemcw_1rdpm = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/davemcw_1rdpm.zip",
  length = playtime,
  init =
  [[
    game.camera_position = {-185, -338}
    game.camera_zoom = 0.6
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. draw_label_code(
      {-188.5, -322}, -- position
      {
        "DaveMcW",
        "1 RDPM",
        "29 June 2015"
      },  -- text to display
      3,  -- text scale
      7 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
  ]]
}
