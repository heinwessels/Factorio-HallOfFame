local hof = require("scripts.hof")

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

--------------------------------------------------------------------------
-- Some helper functions
--------------------------------------------------------------------------

-- Define some constants
local playtime = 60 * settings.startup["hall-of-fame-playback-time"].value
local zoom_modifier = settings.startup["hall-of-fame-zoom-modifier"].value

local alt_info = "" 
if settings.startup["hall-of-fame-camera-alt-info"].value then alt_info = "game.camera_alt_info = true" end

-- determine the volume modifier
function get_volume_modifier(ctx)
  ctx = ctx or { }
  return (ctx.sound_driven_simulation and settings.startup["hall-of-fame-mute-sound-driven"].value and 0)
    or settings.startup["hall-of-fame-volume-modifier"].value
end

function keep_entity_filled_at(position, type, items, every)
  -- Returns a code snippet that will keep the entity at shown position
  -- filled with some items. <items> is an list of <ItemStack>. It will
  -- remove any unwanted items too. It will do this <every> ticks.

  local item_add_list = ""
  for _, item in pairs(items) do
    item_add_list = item_add_list..[[
      inventory.insert({name="]]..item.name..[[", count=]]..item.count..[[})
    ]]
  end
  return [[
    do
      if game.tick % ]]..every..[[ == 0 then        
        local entity = game.surfaces.nauvis.find_entity(
          "]]..type..[[", {]]..position[1]..[[,]]..position[2]..[[})
        if entity and entity.valid then
          local inventory = entity.get_inventory(defines.inventory.turret_ammo)
          inventory.clear()        
          ]]..item_add_list..[[
        end
      end
    end
  ]]
end

--------------------------------------------------------------------------
-- Now add all the simulations
--------------------------------------------------------------------------
camera = require("scripts.camera")
character_ai = require("scripts.character_ai")

main_menu_simulations.twitch_plays_factorio = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/twitch_plays_factorio.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  isolate = true,
  init =
  [[    
    game.camera_position = {128, -187}
    game.camera_zoom = ]]..(zoom_modifier * 0.8)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {95.5, -185}, -- position
      {
        "Twitch Plays Factorio",
        "FearThePenguin",
        "14 February 2022"
      },  -- text to display
      2.5,  -- text scale
      9.5 -- rectangle width
    ) .. [[
  ]],
  update = [[
  ]]
}

main_menu_simulations.bbc_baguette_vs_steelaxe = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/bbc_baguette_vs_steelaxe.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {8.5, -71.5}
    game.camera_zoom = ]]..(zoom_modifier * 0.75)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {-22, -85}, -- position
      {
        "Biter Battle Championships",        
        "Aftermath of Season 1's Longest Match",
        "Baguette vs. SteelAxe (Victor)",
        "6 February 2022"
      },  -- text to display
      2.5,  -- text scale
      17.5 -- rectangle width
    ) .. [[

    
    for _, unit in pairs(game.surfaces.nauvis.find_entities_filtered{
      type = "unit"
    }) do
      unit.set_command{
        type = defines.command.wander, 
        radius = 50, 
        distraction = defines.distraction.none
      }
      unit.active = true
    end
  ]],
  update = [[
  ]]
}

main_menu_simulations.warger_100P_5_26_46 = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/warger_100P_5_26_46.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {-8, 826.5}
    game.camera_zoom = ]]..(zoom_modifier * 0.5)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {10, 826.5 - 4}, -- position
      {
        "Warger",        
        "Speedrun 100% Factorio 1.1",
        "World Record: 5h 26m 46s",
        "22 January 2022"
      },  -- text to display
      3.5,  -- text scale
      17 -- rectangle width
    ) .. [[

  ]],
  update = [[
  ]]
}

main_menu_simulations.trailer_2014 = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/trailer_2014.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {-26, -47}
    game.camera_zoom = ]]..(zoom_modifier * 0.5)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {3, -70}, -- position
      {
        "Factorio Trailer 2014",
        "Wube",
        "1 May 2014"
      },  -- text to display
      4,  -- text scale
      17 -- rectangle width
    ) .. [[

  ]],
  update = [[
    -- Ensure the tank technology is always being researched to keep the labs going.
    if game.forces[1].technologies['inserter-capacity-bonus-5'].researched == true then
      game.forces[1].technologies['inserter-capacity-bonus-5'].researched = false
      game.forces[1].add_research('inserter-capacity-bonus-5')
    end
  ]]
}

main_menu_simulations.aaronlecon_smeltery_emporium = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/aaronlecon_smeltery_emporium.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {139, 63}
    game.camera_zoom = ]]..(zoom_modifier * 0.9)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {139-5, 63+10}, -- position
      {
        "Aaron Lecon",
        "The Smeltery Emporium",
        "26 September 2021"
      },  -- text to display
      2.2,  -- text scale
      10 -- rectangle width
    ) .. [[

  ]],
  update = [[

  ]]
}

main_menu_simulations.gotyoke_tas = {
  checkboard = false,  
  save = "__HallOfFame__/menu-simulations/gotyoke_tas.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {-40, 145}
    game.camera_zoom = ]]..(zoom_modifier * 0.7)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[
    
    ]] .. hof.draw_label_code(
      {-25, 142}, -- position name of variable
      {
        "Gotyoke",
        "Tool-Assisted Speedrun (TAS)",
        "Any%: 1h 21m 20s",
        "24 April 2017"
      },  -- text to display
      2.5,  -- text scale
      14 -- rectangle width
    ) .. [[

    -- Remember this simulation has HEAVY scripting
    -- in the scenario. Don't do weird things here.

    local player_offset = {x = 18, y = 0}
    local emblem_offset = {x = 18 - 7, y = -3}
    
    ]]..(settings.startup["hall-of-fame-moving-camera"].value and ([[
    script.on_nth_tick(1, function()
      -- Cannot overwrite 'on_tick' because that overwrites scenario's 'on_tick' for some reason

      -- Update the camera position
      local player = game.connected_players[1]
      game.camera_zoom = ]]..(zoom_modifier * 0.8)..[[
      game.camera_position = {player.position.x + player_offset.x, player.position.y + player_offset.y}  

      -- Update the emblem position
      local emblem_location = {
        x = game.camera_position.x + emblem_offset.x,
        y = game.camera_position.y + emblem_offset.y
      }
        
      ]] .. hof.draw_label_code_runtime(
        "emblem_location", -- position name of variable
        {
          "Gotyoke",
          "Tool-Assisted Speedrun (TAS)",
          "Any%: 1h 21m 20s",
          "24 April 2017"
        },  -- text to display
        2.5,  -- text scale
        14 -- rectangle width
      ) .. [[
    end) ]]) or [[]]),
    update = [[ ]]
  }  
  
  main_menu_simulations.arrowgluteus_trainclock = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/arrowgluteus_trainclock.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {247, -43}
    game.camera_zoom = ]]..(zoom_modifier * 0.3)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {247-16, -43+32}, -- position
      {
        "arrow in my gluteus maximus",
        "Real Time Train Clock",
        "24 April 2017"
      },  -- text to display
      6,  -- text scale
      32 -- rectangle width
    ) .. [[

  ]],
  update = [[

  ]]
}

main_menu_simulations.dentoid_sushiloop = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/dentoid_sushiloop.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {740, -1463}
    game.camera_zoom = ]]..(zoom_modifier * 0.8)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {757, -1451}, -- position
      {
        "dentoid",
        "Sushi Loop",
        "17 October 2021"
      },  -- text to display
      2.5,  -- text scale
      8 -- rectangle width
    ) .. [[

  ]],
  update = [[

  ]]
}

main_menu_simulations.root_breakthegame = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/root_breakthegame.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {-329, -375}
    game.camera_zoom = ]]..(zoom_modifier * 0.4)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {-329-6, -375+25}, -- position
      {
        "RootNegative",
        "Break The Game",
        "2 January 2016"
      },  -- text to display
      4,  -- text scale
      12 -- rectangle width
    ) .. [[

  ]],
  update = [[]]
}

main_menu_simulations.DaftPunk = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/DaftPunk.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{sound_driven_simulation=true},
  init =
  [[    
    game.camera_position = {85, -62}
    game.camera_zoom = ]]..(zoom_modifier * 0.4)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {85-(18/2), -60+25}, -- position
      {
        "Tritex989",
        "Daft Punk Cover",
        "Programmable Speakers",
        "22 May 2017"
      },  -- text to display
      4,  -- text scale
      18 -- rectangle width
    ) .. [[

    -- Turn on the constant combinator to start the music
    script.on_nth_tick(game.tick + 2*60, function()
      local entity = game.surfaces.nauvis.find_entity("constant-combinator", {85.5, -72.5}) 
      local control = entity.get_or_create_control_behavior() 
      control.enabled = true
    end)
  ]],
  update = [[]]
}

main_menu_simulations.Stevetrov_40kspm_60ups = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/Stevetrov_40kspm_60ups.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {-156, 1316}
    game.camera_zoom = ]]..(zoom_modifier * 0.7)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {-156-(8/2), 1316+13}, -- position
      {
        "SteveTrov",
        "40 kSPM 60 UPS",
        "26 May 2021"
      },  -- text to display
      2.7,  -- text scale
      8 -- rectangle width
    ) .. [[

  ]],
  update = [[]]
}

main_menu_simulations.post_nauvis_collapse = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/post_nauvis_collapse.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[        
    game.camera_position = {-625, -1350}
    game.camera_zoom = ]]..(zoom_modifier * 0.11)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {-625-(60/2), -1350+85}, -- position
      {
        "Maelstrom",
        "Nauvis Post Collapse",
        "16 August 2019"
      },  -- text to display
      16,  -- text scale
      60 -- rectangle width
    ) .. [[
    
    ]]..camera.init{
      {
        start_position = {x=-815+50, y=-1348},
        end_position = {x=-714+50, y=-1444},
        end_tick = 20*60,
        start_zoom = 0.2,
        end_zoom = 0.4
      },
      {        
        end_position = {x=-714+150, y=-1444},
        end_tick = 40*60,
        end_zoom = 0.4
      },
      {        
        end_position = {x=-625, y=-1350},
        end_tick = 50*60,
        end_zoom = 0.13
      },
    }..[[
    ]]..character_ai.init{
      name = "Alden",
      start_position = {x=-815, y=-1348},
      waypoints = {
        {          
          end_position = {x=-714, y=-1464},
        },
        {          
          end_position = {x=-714+50, y=-1464},
        },
        {          
          end_position = {x=-714+300, y=-1464-10},
        },
      }
    }..[[

    script.on_event(defines.events.on_tick, function()        
      ]]..(settings.startup["hall-of-fame-moving-camera"].value and ([[
        ]]..camera.tick()..[[
      ]]) or [[]])..[[
      ]]..character_ai.tick()..[[
    end)
  ]],
  update = [[]]
}

main_menu_simulations.pirusama = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/pirusama.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {-1053, -283}
    game.camera_zoom = ]]..(zoom_modifier * 0.4)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {-1022, -287}, -- position
      {
        "PIrusama",
        "Symbiotic Utopia",
        "July 2021"
      },  -- text to display
      4.5,  -- text scale
      14 -- rectangle width
    ) .. [[

  ]],
  update = [[]]
}

main_menu_simulations.DrogiwanCannobi_josef = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/DrogiwanCannobi_josef.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {-256, -32}
    game.camera_zoom = ]]..(zoom_modifier * 0.4)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {-310, -36.5}, -- position
      {
        "Drogiwan Cannobi",
        "JOSEF",
        "A Self-Expanding Factory",
        "May 2021"
      },  -- text to display
      4.5,  -- text scale
      20 -- rectangle width
    ) .. [[

  ]],
  update = [[]]
}

main_menu_simulations.franqly_any1h29m43s = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/franqly_any1h29m43s.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {34.5, 75}
    game.camera_zoom = ]]..(zoom_modifier * 0.8)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {50, 86}, -- position
      {
        "Franqly",        
        "Speedrun Any%",
        "First Sub 90m Ever: 1h 29m 43s",
        "2 June 2021"
      },  -- text to display
      2,  -- text scale
      11.5 -- rectangle width
    ) .. [[

  ]],
  update = [[]]
}

main_menu_simulations.Stevetrov_monolithic_train_10k = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/Stevetrov_monolithic_train_10k.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {-45, -595}
    game.camera_zoom = ]]..(zoom_modifier * 0.25)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {-62, -560}, -- position
      {
        "SteveTrov",        
        "10 kSPM Monolithic Train Base",
        "7 January 2020"
      },  -- text to display
      6,  -- text scale
      34 -- rectangle width
    ) .. [[
  ]],
  update = [[]]
}

main_menu_simulations.Valkhiya_Beehive = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/Valkhiya_Beehive.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[
    -- game.camera_position = {592, 189}
    game.camera_position = {575, 189}
    game.camera_zoom = ]]..(zoom_modifier * 0.4)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {608.5, 186}, -- position
      {
        "Valkhiya",        
        "Beehive",
        "4 August 2019"
      },  -- text to display
      4,  -- text scale
      13 -- rectangle width
    ) .. [[
  ]],
  update = [[]]
}

main_menu_simulations.rain9441_defaultfirstbots = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/rain9441_defaultfirstbots.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {197, -90}
    game.camera_zoom = ]]..(zoom_modifier * 1)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.35

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {210, -82.5}, -- position
      {
        "Rain9441",        
        "Speedrun Default Settings Factorio 0.15",
        "First speedrun using Construction Bots",
        "3 December 2017"
      },  -- text to display
      1.8,  -- text scale
      12.5 -- rectangle width
    ) .. [[
  ]],
  update =
  [[
    ]]..keep_entity_filled_at({177, -90}, "gun-turret", {{name="firearm-magazine", count=50}}, 60)..[[
    ]]..keep_entity_filled_at({175, -90}, "gun-turret", {{name="firearm-magazine", count=50}}, 60)..[[
    ]]..keep_entity_filled_at({196, -90}, "gun-turret", {{name="firearm-magazine", count=50}}, 60)..[[
    ]]..keep_entity_filled_at({198, -90}, "gun-turret", {{name="firearm-magazine", count=50}}, 60)..[[
    ]]..keep_entity_filled_at({216, -90}, "gun-turret", {{name="firearm-magazine", count=50}}, 60)..[[
    ]]..keep_entity_filled_at({218, -90}, "gun-turret", {{name="firearm-magazine", count=50}}, 60)..[[
    

    if game.tick % (60*10) == 0 then
      local entity_positions = {{x=177, y=-90}, {x=196, y=-90}, {x=218, y=-90}}      
      local entity = game.surfaces.nauvis.find_entity(
        "gun-turret", entity_positions[math.random(3)]
      )
      
      local position
      local command = { }
      if entity and entity.valid then
        position = {x=entity.position.x, y=-150}
        command = {
          type = defines.command.attack, 
          target = entity, 
          distraction = defines.distraction.none
        }
        local surface = game.surfaces.nauvis
        local names = {"medium-biter", "medium-biter", "small-biter", "small-biter"}
        for k = 1, 50 do
          local spawn_position = {position.x + math.random(-5, 5), position.y + math.random(-10, 10)}
          local name = names[math.random(#names)]
          local biter = surface.create_entity{name = name, position = spawn_position}
          biter.set_command(command)
        end
      end      
    end 
  ]]
}

main_menu_simulations.V453000_GridLock = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/V453000_GridLock.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {-220, 115}
    game.camera_zoom = ]]..(zoom_modifier * 0.35)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {-198, 121}, -- position
      {
        "V453000",        
        "GridLock",
        "Factorio.com Background",
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {-53.5, 90}
    game.camera_zoom = ]]..(zoom_modifier * 0.75)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {-467, 460}
    game.camera_zoom = ]]..(zoom_modifier * 0.7)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {45.5, 207.5}
    game.camera_zoom = ]]..(zoom_modifier * 0.6)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {585.5, -38.5}
    game.camera_zoom = ]]..(zoom_modifier * 0.5)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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

main_menu_simulations.mangledpork_livingwithbiters = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/mangledpork_livingwithbiters.zip",
  length = playtime,  
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {360, -78}
    game.camera_zoom = ]]..(zoom_modifier * 0.7)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {330, -75}, -- position
      {
        "MangledPork (Bentham)",
        "Living With Biters",
        "14 June 2016"
      },  -- text to display
      2.5,  -- text scale
      11 -- rectangle width
    ) .. [[

    -- Kill naughty biters that try to destroy the base
    -- Due to pathfinding changes it's no longer possible to live
    -- peacefully with biters.
    script.on_event(defines.events.on_entity_damaged, nil)  -- First reset any other handlers
    script.on_event(defines.events.on_entity_damaged, function (event)
      local biter = event.cause
      if biter and biter.valid then biter.destroy() end
      log("Biter killed at ["..event.entity.position.x..", "..event.entity.position.y.."]")
    end)

  ]],
  update = [[]]
}

main_menu_simulations.mangledpork_towns = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/mangledpork_towns.zip",
  length = playtime,
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {-174, 489}
    game.camera_zoom = ]]..(zoom_modifier * 0.5)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {-144, 506}, -- position
      {
        "MangledPork (Bentham)",
        "Towns",
        "27 July 2015"
      },  -- text to display
      4,  -- text scale
      17 -- rectangle width
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {6, 292}
    game.camera_zoom = ]]..(zoom_modifier * 0.25)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {-765, 6}
    game.camera_zoom = ]]..(zoom_modifier * 0.3)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {-184, -58224}
    game.camera_zoom = ]]..(zoom_modifier * 0.35)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {-820, -1017.5}
    game.camera_zoom = ]]..(zoom_modifier * 0.35)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {126, -132.5}
    game.camera_zoom = ]]..(zoom_modifier * 0.3)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {-135, -6}
    game.camera_zoom = ]]..(zoom_modifier * 0.45)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {1636, 1405}
    game.camera_zoom = ]]..(zoom_modifier * 0.365)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {-1909, -862.5}
    game.camera_zoom = ]]..(zoom_modifier * 0.26)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {-41.5, -83}
    game.camera_zoom = ]]..(zoom_modifier * 0.65)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {-48, -64}, -- position
      {
        "One Chunk Factory Challenge",
        "All sciences within 32x32 tiles",
        "December 2019"
      },  -- text to display
      2.4,  -- text scale
      13 -- rectangle width
    ) .. [[

    ]] .. hof.draw_label_code(
      {-72, -63.5}, -- position
      {
        "acmemyst",
        "9.2 SPM"
      },  -- text to display
      2.4,  -- text scale
      6, -- rectangle width
      '1st' -- overwrite header
    ) .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {506, -560}
    game.camera_zoom = ]]..(zoom_modifier * 0.4)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {82.5, -102}
    game.camera_zoom = ]]..(zoom_modifier * 0.30)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {1515, 1295}
    game.camera_zoom = ]]..(zoom_modifier * 0.35)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {1504, 1263}, -- position
      {
        "Goose",
        "Burner Inserter Megabase",
        "September 2019"
      },  -- text to display
      4.5,  -- text scale
      22 -- rectangle width
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {28, -147.5}
    game.camera_zoom = ]]..(zoom_modifier * 0.30)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {11.5, 23.5}
    game.camera_zoom = ]]..(zoom_modifier * 0.45)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {3120, 1287}
    game.camera_zoom = ]]..(zoom_modifier * 0.5)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {1029, 712}
    game.camera_zoom = ]]..(zoom_modifier * 0.3)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {11.7, -275}
    game.camera_zoom = ]]..(zoom_modifier * 0.35)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {-200, 590}
    game.camera_zoom = ]]..(zoom_modifier * 0.8)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {307, -443}
    game.camera_zoom = ]]..(zoom_modifier * 0.35)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {1595, 100}
    game.camera_zoom = ]]..(zoom_modifier * 0.25)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 0.5

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
  volume_modifier = get_volume_modifier{},
  init =
  [[    
    game.camera_position = {-90, -14}
    game.camera_zoom = ]]..(zoom_modifier * 0.3)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
      {-97.5, 18}, -- position
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
  volume_modifier = get_volume_modifier{},
  init =
  [[
    game.camera_position = {-185, -338}
    game.camera_zoom = ]]..(zoom_modifier * 0.6)..[[
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    ]] .. alt_info .. [[

    ]] .. hof.draw_label_code(
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
