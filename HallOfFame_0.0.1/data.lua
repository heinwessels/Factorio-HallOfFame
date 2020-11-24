local styles = data.raw["gui-style"]["default"]
styles.waypoints_switch_padding = {type = "switch_style", parent="switch", top_padding=3}  -- Fixes height of switch to be the same as its labels
styles.waypoints_empty_filler = {type = "empty_widget_style", horizontally_stretchable="on"}

local menu_simulations = require("__base__/menu-simulations/menu-simulations")
if not data.raw["utility-constants"]["default"].main_menu_simulations then
  data.raw["utility-constants"]["default"].main_menu_simulations = {}
end
local main_menu_simulations = data.raw["utility-constants"]["default"].main_menu_simulations

main_menu_simulations.kfitik_14kpms = {
  checkboard = false,
  save = "__HallOfFame__/menu-simulations/kfitik_14kpms.zip",
  length = 60 * 60,
  init =
  [[    
    
    local middle={3120, 1287}

    game.camera_position = middle
    game.camera_zoom = 0.5
    game.tick_paused = false
    game.surfaces.nauvis.daytime = 1

    local text_scale = 3
    local header_scale = 0.65 

    local border_witdh = {0.1*text_scale, 0.1*text_scale}
    local rect_pad = {0.3,0}
    local rect_num_of_lines = 3.5
    local rect_colour = {48,48,48}
    local rect_width = 11

    local top_left = {middle[1]-rect_width/2, 1307}
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
    rendering.draw_text{text="Kfitik", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
    current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
    rendering.draw_text{text="14 kSPM Vanilla-ish", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
    current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
    rendering.draw_text{text="Factorio 1.0", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
  ]],
  update =
  [[
  ]]
}

-- main_menu_simulations.Gh0stP1rate_vanilla_10kspm = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/Gh0stP1rate_vanilla_10kspm.zip",
--   length = 60 * 60,
--   init =
--   [[    
    
--     local middle={1029, 712}

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
--     local rect_width = 30

--     local top_left = {middle[1]-rect_width/2, 750}
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
--     rendering.draw_text{text="Gh0stP1rate and Hamiebarmund", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="10 kSPM Vanilla", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}
--     current_pos = {current_pos[1]+spacing[1], current_pos[2]+spacing[2]}
--     rendering.draw_text{text="Factorio 1.0", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.accidentalchef_10rpm = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/p0ober_jdplays_spaghetti_world.zip",
--   length = 60 * 60,
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
--     rendering.draw_text{text="Factorio 0.18", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.accidentalchef_10rpm = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/accidentalchef_10rpm.zip",
--   length = 60 * 60,
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
--     rendering.draw_text{text="Factorio 0.14", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.swolar_20kspm = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/swolar_20kspm.zip",
--   length = 60 * 60,
--   init =
--   [[    

--     local middle={307, -443}

--     game.camera_position = middle
--     game.camera_zoom = 0.35
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1

--     local text_scale = 5
--     local header_scale = 0.65   

--     local border_witdh = {0.1*text_scale, 0.1*text_scale}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 19

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
--     rendering.draw_text{text="Factorio 0.18", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.horvenbeestinger_2500spm = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/horvenbeestinger_2500spm.zip",
--   length = 60 * 60,
--   init =
--   [[    

--     local middle={1595, 100}

--     game.camera_position = middle
--     game.camera_zoom = 0.25
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 0.5

--     local text_scale = 7
--     local header_scale = 0.65  

--     local border_witdh = {0.1*text_scale, 0.1*text_scale}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 30

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
--     rendering.draw_text{text="Factorio 1.0", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.lilyrose_beltmegabase = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/lilyrose_belt_megabase.zip",
--   length = 60 * 60,
--   init =
--   [[    

--     local middle={951009, 950060}

--     game.camera_position = middle
--     game.camera_zoom = 0.3
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1

--     local text_scale = 7
--     local header_scale = 0.65

--     local border_witdh = {0.1*text_scale, 0.1*text_scale}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 19

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
--     rendering.draw_text{text="Factorio 0.16", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }

-- main_menu_simulations.davemcw_1rdpm = {
--   checkboard = false,
--   save = "__HallOfFame__/menu-simulations/davemcw_1rdpm.zip",
--   length = 60 * 60,
--   init =
--   [[    

--     local middle={-185, -338}

--     game.camera_position = middle
--     game.camera_zoom = 0.7
--     game.tick_paused = false
--     game.surfaces.nauvis.daytime = 1
    
--     local border_witdh = {0.2, 0.2}
--     local rect_pad = {0.3,0}
--     local rect_num_of_lines = 3.5
--     local rect_colour = {48,48,48}
--     local rect_width = 6.5

--     local text_scale = 2.8
--     local header_scale = 0.65

--     local scale_name = 2.8
--     local text_colour = {204,102,0}    
--     local top_left = {middle[1] - rect_width/2, -322}
--     local spacing = {0, 1}

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
--     rendering.draw_text{text="Factorio 0.11", surface=game.surfaces.nauvis, target=current_pos, color=text_colour, scale=text_scale}    
--   ]],
--   update =
--   [[
--   ]]
-- }
