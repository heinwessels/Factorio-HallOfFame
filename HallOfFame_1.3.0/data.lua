-- Get the menu simulations
local main_menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations

-- Remove vanilla menu simulations if the user wants
if settings.startup["hall-of-fame-disable-defaults"].value == true then
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
local header_scale = 0.65                 -- Relative to text size
local spacing_factor = 0.4                -- Vertical spacing between text (multiplied by text scale)
local rect_pad = {0.3, 0}               -- Padding between text and rectangle corner
local border_factor = {0.1, 0.1}          -- Factor to scale border width by (multiplied by text scale)

local colour_text = {r=204,g=102,b=0}         -- Colour of main text
local colour_text_hof = {r=200,g=180,b=150}   -- Colour of the Hall of Fame text
local colour_rect_out = {r=35,g=35,b=35}      -- Colour of the outer rectangle
local colour_rect_in = {r=48,g=48,b=48}      -- Colour of the inner rectangle

-- Add all the simulations

-- main_menu_simulations.griswold_ant_farm = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/griswold_ant_farm.zip",
--   length = playtime,
--   init =
--   [[    
    
--     local middle= {-820, -1017.5}

--     local rect_width = 15
--     local top_left = {-897, -992}
--     local text_scale = 4.5
--     local rect_num_of_lines = 3.5

--     game.camera_position = middle
--     game.camera_zoom = 0.35
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1
    
--     local header_scale = ]]..header_scale..[[ 
--     local border_width = {]]..border_factor[1]..[[*text_scale, ]]..border_factor[2]..[[*text_scale}
--     local rect_pad = {]]..rect_pad[1]..[[, ]]..rect_pad[2]..[[}
        
--     local text_colour = {]]..colour_text.r..[[,]]..colour_text.g..[[,]]..colour_text.b..[[}
--     local spacing = {0, ]]..spacing_factor..[[*text_scale}
    
--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_out.r..[[,]]..colour_rect_out.g..[[,]]..colour_rect_out.b..[[},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_width[1],
--         top_left[2]-rect_pad[2]-border_width[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_width[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_width[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_in.r..[[,]]..colour_rect_in.g..[[,]]..colour_rect_in.b..[[},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines + header_scale) * spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, 
--         color={]]..colour_text_hof.r..[[,]]..colour_text_hof.g..[[,]]..colour_text_hof.b..[[}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="Griswold", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="Antfarm 1RPM", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="16 October 2017", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- mulations.niftymaniac_greygoo1 = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/niftymaniac_greygoo1.zip",
--   length = playtime,
--   init =
--   [[    
    
--     local middle= {126, -132.5}

--     local rect_width = 23
--     local top_left = {55, -115}
--     local text_scale = 5
--     local rect_num_of_lines = 4.5

--     game.camera_position = middle
--     game.camera_zoom = 0.3
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1
    
--     local header_scale = ]]..header_scale..[[ 
--     local border_width = {]]..border_factor[1]..[[*text_scale, ]]..border_factor[2]..[[*text_scale}
--     local rect_pad = {]]..rect_pad[1]..[[, ]]..rect_pad[2]..[[}
        
--     local text_colour = {]]..colour_text.r..[[,]]..colour_text.g..[[,]]..colour_text.b..[[}
--     local spacing = {0, ]]..spacing_factor..[[*text_scale}
    
--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_out.r..[[,]]..colour_rect_out.g..[[,]]..colour_rect_out.b..[[},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_width[1],
--         top_left[2]-rect_pad[2]-border_width[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_width[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_width[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_in.r..[[,]]..colour_rect_in.g..[[,]]..colour_rect_in.b..[[},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines + header_scale) * spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, 
--         color={]]..colour_text_hof.r..[[,]]..colour_text_hof.g..[[,]]..colour_text_hof.b..[[}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="NiftyManiac", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="GreyGoo Mk I", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="A Self-Expanding Factory", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="16 February 2017", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.t1024_diag = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/t1024_diag.zip",
--   length = playtime,
--   init =
--   [[    
    
--     local middle= {-135, -6}

--     local rect_width = 11
--     local top_left = {-162, 15}
--     local text_scale = 3.8
--     local rect_num_of_lines = 3.5

--     game.camera_position = middle
--     game.camera_zoom = 0.45
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 0.5
    
--     local header_scale = ]]..header_scale..[[ 
--     local border_width = {]]..border_factor[1]..[[*text_scale, ]]..border_factor[2]..[[*text_scale}
--     local rect_pad = {]]..rect_pad[1]..[[, ]]..rect_pad[2]..[[}
        
--     local text_colour = {]]..colour_text.r..[[,]]..colour_text.g..[[,]]..colour_text.b..[[}
--     local spacing = {0, ]]..spacing_factor..[[*text_scale}
    
--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_out.r..[[,]]..colour_rect_out.g..[[,]]..colour_rect_out.b..[[},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_width[1],
--         top_left[2]-rect_pad[2]-border_width[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_width[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_width[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_in.r..[[,]]..colour_rect_in.g..[[,]]..colour_rect_in.b..[[},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines + header_scale) * spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, 
--         color={]]..colour_text_hof.r..[[,]]..colour_text_hof.g..[[,]]..colour_text_hof.b..[[}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="T-1024", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="Diagonal Base", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="31 March 2018", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.stevetrov_15rpm = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/stevetrov_15rpm.zip",
--   length = playtime,
--   init =
--   [[    
    
--     local middle= {1636, 1405}

--     local rect_width = 12
--     local top_left = {1567, 1389.5}
--     local text_scale = 4.5
--     local rect_num_of_lines = 3.5

--     game.camera_position = middle
--     game.camera_zoom = 0.365
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1
    
--     local header_scale = ]]..header_scale..[[ 
--     local border_width = {]]..border_factor[1]..[[*text_scale, ]]..border_factor[2]..[[*text_scale}
--     local rect_pad = {]]..rect_pad[1]..[[, ]]..rect_pad[2]..[[}
        
--     local text_colour = {]]..colour_text.r..[[,]]..colour_text.g..[[,]]..colour_text.b..[[}
--     local spacing = {0, ]]..spacing_factor..[[*text_scale}
    
--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_out.r..[[,]]..colour_rect_out.g..[[,]]..colour_rect_out.b..[[},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_width[1],
--         top_left[2]-rect_pad[2]-border_width[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_width[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_width[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_in.r..[[,]]..colour_rect_in.g..[[,]]..colour_rect_in.b..[[},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines + header_scale) * spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, 
--         color={]]..colour_text_hof.r..[[,]]..colour_text_hof.g..[[,]]..colour_text_hof.b..[[}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="SteveTrov", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="15 RPM", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="13 April 2017", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.xterminator_ssts = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/xterminator_ssts.zip",
--   length = playtime,
--   init =
--   [[    
    
--     local middle= {-1909, -862.5}

--     local rect_width = 28
--     local top_left = {-1956, -820}
--     local text_scale = 6 
--     local rect_num_of_lines = 3.5

--     game.camera_position = middle
--     game.camera_zoom = 0.26
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1
    
--     local header_scale = ]]..header_scale..[[ 
--     local border_width = {]]..border_factor[1]..[[*text_scale, ]]..border_factor[2]..[[*text_scale}
--     local rect_pad = {]]..rect_pad[1]..[[, ]]..rect_pad[2]..[[}
        
--     local text_colour = {]]..colour_text.r..[[,]]..colour_text.g..[[,]]..colour_text.b..[[}
--     local spacing = {0, ]]..spacing_factor..[[*text_scale}
    
--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_out.r..[[,]]..colour_rect_out.g..[[,]]..colour_rect_out.b..[[},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_width[1],
--         top_left[2]-rect_pad[2]-border_width[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_width[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_width[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_in.r..[[,]]..colour_rect_in.g..[[,]]..colour_rect_in.b..[[},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines + header_scale) * spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, 
--         color={]]..colour_text_hof.r..[[,]]..colour_text_hof.g..[[,]]..colour_text_hof.b..[[}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="Xterminator", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="Send Supporters to Space", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="12 September 2017", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.challenge_32x32 = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/32x32_challenge.zip",
--   length = playtime,
--   init =
--   [[    
    
--     local middle= {-41.5, -83}

--     local rect_width = 13
--     local top_left = {middle[1]-rect_width/2, -64}
--     local text_scale = 2.4
--     local rect_num_of_lines = 3.5

--     game.camera_position = middle
--     game.camera_zoom = 0.65
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1
    
--     local header_scale = ]]..header_scale..[[ 
--     local border_width = {]]..border_factor[1]..[[*text_scale, ]]..border_factor[2]..[[*text_scale}
--     local rect_pad = {]]..rect_pad[1]..[[, ]]..rect_pad[2]..[[}
        
--     local text_colour = {]]..colour_text.r..[[,]]..colour_text.g..[[,]]..colour_text.b..[[}
--     local spacing = {0, ]]..spacing_factor..[[*text_scale}
    
--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_out.r..[[,]]..colour_rect_out.g..[[,]]..colour_rect_out.b..[[},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_width[1],
--         top_left[2]-rect_pad[2]-border_width[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_width[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_width[2]
--       },
--       surface = game.surfaces.nauvis
--     }
--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_in.r..[[,]]..colour_rect_in.g..[[,]]..colour_rect_in.b..[[},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines + header_scale) * spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the main text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, 
--         color={]]..colour_text_hof.r..[[,]]..colour_text_hof.g..[[,]]..colour_text_hof.b..[[}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="One Chunk Factory Challenge", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="All sciences within 32x32 tiles", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="December 2019", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}

--     -- Left guy
--     --------------------------------------------
--     local rect_width = 6
--     top_left = {middle[1] - 27 - rect_width/2, -63.5}    
--     local rect_num_of_lines = 2.5

--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_out.r..[[,]]..colour_rect_out.g..[[,]]..colour_rect_out.b..[[},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_width[1],
--         top_left[2]-rect_pad[2]-border_width[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_width[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_width[2]
--       },
--       surface = game.surfaces.nauvis
--     }
--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_in.r..[[,]]..colour_rect_in.g..[[,]]..colour_rect_in.b..[[},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines + header_scale) * spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }
--     local current_pos = top_left
--     rendering.draw_text{text="1st", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="acmemyst", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="9.2 SPM", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     --------------------------------------------

--     -- Right guy
--     --------------------------------------------    
--     top_left = {middle[1] + 27 - rect_width/2, -63.5}    
--     local rect_num_of_lines = 2.5

--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_out.r..[[,]]..colour_rect_out.g..[[,]]..colour_rect_out.b..[[},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_width[1],
--         top_left[2]-rect_pad[2]-border_width[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_width[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_width[2]
--       },
--       surface = game.surfaces.nauvis
--     }
--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_in.r..[[,]]..colour_rect_in.g..[[,]]..colour_rect_in.b..[[},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines + header_scale) * spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }
--     local current_pos = top_left
--     rendering.draw_text{text="2nd", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="ostertoasterii", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="8.7 SPM", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     --------------------------------------------


--   ]],
--   update =
--   [[
--   ]]
-- }


-- main_menu_simulations.kos_mmo_202001 = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/kos_mmo_202001.zip",
--   length = playtime,
--   init =
--   [[    
    
--     local middle= {506, -560}

--     local rect_width = 25
--     local top_left = {445, -588}
--     local text_scale = 4    
--     local rect_num_of_lines = 4.5

--     game.camera_position = middle
--     game.camera_zoom = 0.4
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1
    
--     local header_scale = ]]..header_scale..[[ 
--     local border_width = {]]..border_factor[1]..[[*text_scale, ]]..border_factor[2]..[[*text_scale}
--     local rect_pad = {]]..rect_pad[1]..[[, ]]..rect_pad[2]..[[}
        
--     local text_colour = {]]..colour_text.r..[[,]]..colour_text.g..[[,]]..colour_text.b..[[}
--     local spacing = {0, ]]..spacing_factor..[[*text_scale}
    
--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_out.r..[[,]]..colour_rect_out.g..[[,]]..colour_rect_out.b..[[},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_width[1],
--         top_left[2]-rect_pad[2]-border_width[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_width[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_width[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={]]..colour_rect_in.r..[[,]]..colour_rect_in.g..[[,]]..colour_rect_in.b..[[},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines + header_scale) * spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, 
--         color={]]..colour_text_hof.r..[[,]]..colour_text_hof.g..[[,]]..colour_text_hof.b..[[}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="KatherineOfSky and Caledorn", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="Massive Multiplayer World Record", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="Peak 521 Concurrent Players", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="25 January 2020", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.PM_ME_DELICIOUS_FOOD_bagel = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/PM_ME_DELICIOUS_FOOD_bagel.zip",
--   length = playtime,
--   init =
--   [[    
    
--     local middle= {82.5, -102}

--     game.camera_position = middle
--     game.camera_zoom = 0.30
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1

--     local text_scale = 4.5
--     local header_scale = 0.65 

--     local border_witdh = {0.1*text_scale, 0.1*text_scale}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 23

--     local top_left = {135, -77}
--     local scale_name = 2.8
--     local text_colour = {204,102,0}        
--     local spacing = {0, 0.4*text_scale}

--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={35,35,35},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_witdh[1],
--         top_left[2]-rect_pad[2]-border_witdh[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_witdh[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_witdh[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={48,48,48},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, color={200,180,150}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="PM_ME_DELICIOUS_FOOD", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="BadBagel Spaghetti", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="30 October 2020", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.goose_Burner_inserter_megabase = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/goose_Burner_inserter_megabase.zip",
--   length = playtime,
--   init =
--   [[    
    
--     local middle= {1515, 1295}

--     game.camera_position = middle
--     game.camera_zoom = 0.30
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1

--     local text_scale = 5.5
--     local header_scale = 0.65 

--     local border_witdh = {0.1*text_scale, 0.1*text_scale}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 26

--     local top_left = {1562, 1333}
--     local scale_name = 2.8
--     local text_colour = {204,102,0}        
--     local spacing = {0, 0.4*text_scale}

--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={35,35,35},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_witdh[1],
--         top_left[2]-rect_pad[2]-border_witdh[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_witdh[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_witdh[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={48,48,48},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, color={200,180,150}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="Goose", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="Burner Inserter Megabase", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="Factorio 0.17", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.Quazarz_science_rivier = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/Quazarz_science_rivier.zip",
--   length = playtime,
--   init =
--   [[    
    
--     local middle={28, -147.5}

--     game.camera_position = middle
--     game.camera_zoom = 0.30
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1

--     local text_scale = 6
--     local header_scale = 0.65 

--     local border_witdh = {0.1*text_scale, 0.1*text_scale}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 18

--     local top_left = {79, -180}
--     local scale_name = 2.8
--     local text_colour = {204,102,0}        
--     local spacing = {0, 0.4*text_scale}

--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={35,35,35},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_witdh[1],
--         top_left[2]-rect_pad[2]-border_witdh[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_witdh[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_witdh[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={48,48,48},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, color={200,180,150}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="Quazarz_", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="Science River", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="1 May 2019", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.soelless_gaming_beautiful = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/soelless_gaming_beautiful.zip",
--   length = playtime,
--   init =
--   [[    
    
--     local middle={11.5, 23.5}

--     game.camera_position = middle
--     game.camera_zoom = 0.45
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1

--     local text_scale = 3
--     local header_scale = 0.65 

--     local border_witdh = {0.1*text_scale, 0.1*text_scale}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 11

--     local top_left = {37, -7}
--     local scale_name = 2.8
--     local text_colour = {204,102,0}        
--     local spacing = {0, 0.35*text_scale}

--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={35,35,35},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_witdh[1],
--         top_left[2]-rect_pad[2]-border_witdh[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_witdh[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_witdh[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={48,48,48},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, color={200,180,150}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="Soelless Gaming", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="Beautiful Megabase", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="31 October 2017", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.kfitik_14kpms = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/kfitik_14kpms.zip",
--   length = playtime,
--   init =
--   [[    
    
--     local middle={3120, 1287}

--     game.camera_position = middle
--     game.camera_zoom = 0.5
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1

--     local text_scale = 3
--     local header_scale = 0.65 

--     local border_witdh = {0.1*text_scale, 0.1*text_scale}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 9

--     local top_left = {middle[1]-rect_width/2, 1307}
--     local scale_name = 2.8
--     local text_colour = {204,102,0}        
--     local spacing = {0, 0.35*text_scale}

--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={35,35,35},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_witdh[1],
--         top_left[2]-rect_pad[2]-border_witdh[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_witdh[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_witdh[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={48,48,48},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, color={200,180,150}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="Kfitik", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="14 kSPM", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="16 October 2020", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

main_menu_simulations.Gh0stP1rate_vanilla_10kspm = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/Gh0stP1rate_vanilla_10kspm.zip",
  length = playtime,
  init =
  [[    
    
    local middle={1029, 712}

    game.camera_position = middle
    game.camera_zoom = 0.3
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    local text_scale = 6
    local header_scale = 0.65 

    local border_witdh = {0.1*text_scale, 0.1*text_scale}
    local rect_pad = {0.3,0}
    local rect_num_of_lines = 3.5
    local rect_colour = {48,48,48}
    local rect_width = 35

    local top_left = {950, 670} --{middle[1]-rect_width/2, 750}
    local scale_name = 2.8
    local text_colour = {204,102,0}        
    local spacing = {0, 0.35*text_scale}

    -- Draw outer rectangle
    rendering.draw_rectangle{
      color={35,35,35},      
      filled=true,
      left_top = {
        top_left[1]-rect_pad[1]-border_witdh[1],
        top_left[2]-rect_pad[2]-border_witdh[2]
      },
      right_bottom = {
        top_left[1] + rect_width + rect_pad[1] + border_witdh[1],
        top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_witdh[2]
      },
      surface = game.surfaces.nauvis
    }

    -- Draw inner rectangle
    rendering.draw_rectangle{
      color={48,48,48},
      filled=true,
      left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
      right_bottom = {
        top_left[1] + rect_width + rect_pad[1],
        top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2]
      },
      surface = game.surfaces.nauvis
    }

    -- Draw the text
    local current_pos = top_left
    rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, color={200,180,150}, scale=text_scale*header_scale}
    current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
    rendering.draw_text{text="Gh0stP1rate and Hamiebarmund", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
    current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
    rendering.draw_text{text="10 kSPM Vanilla", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
    current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
    rendering.draw_text{text="7 November 2020", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
  ]],
  update =
  [[
  ]]
}

-- main_menu_simulations.p0ober_jdplays_spaghetti_world = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/p0ober_jdplays_spaghetti_world.zip",
--   length = playtime,
--   init =
--   [[    
    
--     local middle={11.7, -275}

--     game.camera_position = middle
--     game.camera_zoom = 0.35
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 0.5

--     local text_scale = 5
--     local header_scale = 0.65 

--     local border_witdh = {0.1*text_scale, 0.1*text_scale}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 17

--     local top_left = {-50, -259}
--     local scale_name = 2.8
--     local text_colour = {204,102,0}        
--     local spacing = {0, 0.35*text_scale}

--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={35,35,35},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_witdh[1],
--         top_left[2]-rect_pad[2]-border_witdh[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_witdh[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_witdh[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={48,48,48},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, color={200,180,150}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="P0ober & JD-Plays", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="Spaghetti Base", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="9 May 2020", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.accidentalchef_10rpm = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/accidentalchef_10rpm.zip",
--   length = playtime,
--   init =
--   [[    
    
--     local middle={-200, 590}

--     game.camera_position = middle
--     game.camera_zoom = 0.8
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 0.5

--     local text_scale = 2.5
--     local header_scale = 0.65    

--     local border_witdh = {0.1*text_scale, 0.1*text_scale}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 7

--     local top_left = {-176.5, 603.5}
--     local scale_name = 2.8
--     local text_colour = {204,102,0}        
--     local spacing = {0, 0.35*text_scale}

--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={35,35,35},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_witdh[1],
--         top_left[2]-rect_pad[2]-border_witdh[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_witdh[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_witdh[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={48,48,48},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, color={200,180,150}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="AccidentalChef", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="10 RPM", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="18 January 2017", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.swolar_20kspm = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/swolar_20kspm.zip",
--   length = playtime,
--   init =
--   [[    

--     local middle={307, -443}

--     game.camera_position = middle
--     game.camera_zoom = 0.35
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1

--     local text_scale = 4.5
--     local header_scale = 0.65   

--     local border_witdh = {0.1*text_scale, 0.1*text_scale}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 15

--     local scale_name = 2.8
--     local text_colour = {204,102,0}    
--     local top_left = {354, -411}
--     local spacing = {0, 0.35*text_scale}

--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={35,35,35},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_witdh[1],
--         top_left[2]-rect_pad[2]-border_witdh[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_witdh[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_witdh[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={48,48,48},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, color={200,180,150}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="swolar", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="20 kSPM 60 UPS", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="6 May 2020", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.horvenbeestinger_2500spm = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/horvenbeestinger_2500spm.zip",
--   length = playtime,
--   init =
--   [[    

--     local middle={1595, 100}

--     game.camera_position = middle
--     game.camera_zoom = 0.25
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 0.5

--     local text_scale = 6
--     local header_scale = 0.65  

--     local border_witdh = {0.1*text_scale, 0.1*text_scale}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 24

--     local scale_name = 2.8
--     local text_colour = {204,102,0}    
--     local top_left = {1660, 142}
--     local spacing = {0, 0.35*text_scale}

--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={35,35,35},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_witdh[1],
--         top_left[2]-rect_pad[2]-border_witdh[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_witdh[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_witdh[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={48,48,48},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, color={200,180,150}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="Horvenbeestinger", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="Beautiful Megabase", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="26 September 2020", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.lilyrose_beltmegabase = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/lilyrose_belt_megabase.zip",
--   length = playtime,
--   init =
--   [[    

--     local middle={951009, 950060}

--     game.camera_position = middle
--     game.camera_zoom = 0.3
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1

--     local text_scale = 5
--     local header_scale = 0.65

--     local border_witdh = {0.1*text_scale, 0.1*text_scale}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 15

--     local scale_name = 2.8
--     local text_colour = {204,102,0}    
--     local top_left = {middle[1] - rect_width/2, 950092}
--     local spacing = {0, 0.35*text_scale}

--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={35,35,35},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_witdh[1],
--         top_left[2]-rect_pad[2]-border_witdh[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_witdh[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_witdh[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={48,48,48},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, color={200,180,150}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="Lily Rose", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="Belt Megabase", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="17 April 2018", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.davemcw_1rdpm = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/davemcw_1rdpm.zip",
--   length = playtime,
--   init =
--   [[    
--     local middle={-185, -338}

--     game.camera_position = middle
--     game.camera_zoom = 0.6
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1

--     local text_scale = 3
--     local header_scale = 0.65

--     local border_witdh = {0.1*text_scale, 0.1*text_scale}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 7

--     local scale_name = 2.8
--     local text_colour = {204,102,0}    
--     local top_left = {middle[1] - rect_width/2, -322}
--     local spacing = {0, 0.35*text_scale}

--     -- Draw outer rectangle
--     rendering.draw_rectangle{
--       color={35,35,35},      
--       filled=true,
--       left_top = {
--         top_left[1]-rect_pad[1]-border_witdh[1],
--         top_left[2]-rect_pad[2]-border_witdh[2]
--       },
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1] + border_witdh[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2] + border_witdh[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw inner rectangle
--     rendering.draw_rectangle{
--       color={48,48,48},
--       filled=true,
--       left_top = {top_left[1]-rect_pad[1],top_left[2]-rect_pad[2]},
--       right_bottom = {
--         top_left[1] + rect_width + rect_pad[1],
--         top_left[2] + rect_pad[2] + (rect_num_of_lines+header_scale)*spacing[2]
--       },
--       surface = game.surfaces.nauvis
--     }

--     -- Draw the text
--     local current_pos = top_left
--     rendering.draw_text{text="Hall of Fame", surface=game.surfaces.nauvis, target=current_pos, color={200,180,150}, scale=text_scale*header_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]*header_scale}
--     rendering.draw_text{text="DaveMcW", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="1 RDPH", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="29 June 2015", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }
