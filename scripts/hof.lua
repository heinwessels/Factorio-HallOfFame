local hof = {}

-- Create a function that will create code to draw the text boxes
function hof.draw_label_code_runtime(position_name, text, text_scale, rect_width, overwrite_header)
  -- overwrite_header: '' to disable, 'something_else' to display 'something_else'
  -- Here 'position' is a runtime string
  
  -- The code that we will generate to draw the label
  code = [[
    do
      -- Clear previous
      rendering.clear()

      -- Do deep copy
      local position_name = {
        x = ]]..position_name..[[.x,
        y = ]]..position_name..[[.y
      }
  ]]

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

  -- Setup locals

  -- Draw outer rectangle
  code = code .. [[
    rendering.draw_rectangle{
      color={]]..colour_rect_out.r..[[,]]..colour_rect_out.g..[[,]]..colour_rect_out.b..[[},      
      filled=true,
      left_top = {
        position_name.x -(]]..rect_pad[1]+border_width[1]..[[),
        position_name.y -(]]..rect_pad[2]+border_width[2]..[[)
      },
      right_bottom = {
        position_name.x + ]]..rect_width + rect_pad[1] + border_width[1]..[[,
        position_name.y + ]]..rect_pad[2] + (num_of_lines+header_scale)*spacing[2] + border_width[2]..[[
      },
      surface = game.surfaces.nauvis
    }

    -- Draw inner rectangle
    rendering.draw_rectangle{
      color={]]..colour_rect_in.r..[[,]]..colour_rect_in.g..[[,]]..colour_rect_in.b..[[},
      filled=true,
      left_top = {position_name.x-(]]..rect_pad[1]..[[), position_name.y-(]]..rect_pad[2]..[[)},
      right_bottom = {
        position_name.x + ]]..rect_width + rect_pad[1]..[[,
        position_name.y + ]]..rect_pad[2] + (num_of_lines + header_scale) * spacing[2]..[[
      },
      surface = game.surfaces.nauvis
    }
  ]]

  if header ~= nil then
    code = code .. [[
      rendering.draw_text{
        text="]]..header..[[", 
        surface=game.surfaces.nauvis, 
        target=position_name,
        color={]]..colour_text_hof.r..[[,]]..colour_text_hof.g..[[,]]..colour_text_hof.b..[[}, 
        scale=]]..text_scale*header_scale..[[
      }

      -- Update the 'cursor' after the heading
      position_name = {
        x = position_name.x+]]..spacing[1]..[[, 
        y = position_name.y+]]..spacing[2]*header_scale..[[
      }
    ]]    
  end

  -- Draw the text
  for _, snippet in ipairs(text) do

    -- Now generate the code    
    code = code .. [[
      rendering.draw_text{
        text="]]..snippet..[[",
        surface=game.surfaces.nauvis, 
        target=position_name,
        color={]]..colour_text.r..[[,]]..colour_text.g..[[,]]..colour_text.b..[[}, 
        scale=]]..text_scale..[[
      }

      -- Update the 'cursor'
      position_name = {
        x = position_name.x+]]..spacing[1]..[[, 
        y = position_name.y+]]..spacing[2]*spacing[2]..[[
      }
    ]]
  end

  code = code..[[
    end
  ]]

  return code

end

-- Create a function that will create code to draw the text boxes
function hof.draw_label_code(position, text, text_scale, rect_width, overwrite_header)
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

return hof