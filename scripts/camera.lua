local camera = {}

-- NOTE: All ticks are relative to the start tick!
-- NOTE: All zooms are relative to the zoom setting already!

-- Call this to initialize your camera_waypoints
-- see camera.poll for the contents on camera_waypoints
function camera.init(waypoints)
    for i, waypoint in pairs(waypoints) do
        waypoints[i].start_position = waypoint.start_position or (i > 1 and waypoints[i-1].end_position)
        waypoints[i].start_tick = waypoint.start_tick or (i > 1 and waypoints[i-1].end_tick) or 0
        waypoints[i].start_zoom = waypoint.start_zoom or (i > 1 and waypoints[i-1].end_tick) or waypoint.end_zoom
    end
    
    return [[
        if not interpolate then interpolate = function (a, b, x) return a + x * (b - a) end end
        camera = {
            waypoints = ]]..serpent.line(waypoints)..[[,
            start_tick = game.tick,
            zoom_modifier = ]]..settings.startup["hall-of-fame-zoom-modifier"].value..[[,
            interpolate = function(waypoint, factor)                
                return {
                    position = {
                        x = interpolate(waypoint.start_position.x, waypoint.end_position.x, factor),
                        y = interpolate(waypoint.start_position.y, waypoint.end_position.y, factor),
                    },
                    zoom = waypoint.end_zoom and interpolate(waypoint.start_zoom, waypoint.end_zoom, factor) or nil,
                }
            end,
        }
    ]]
end

-- Call this every in your tick handler
-- It will return generated code that can
-- run in the handler every tick
-- note: camera_waypoints is the NAME of the variable
function camera.tick()    
    --  camera_waypoints = {
    --      array of camera_waypoints
    --      waypoint = {
    --          -- Required/Optional
    --          end_tick = ??    
    --          end_position = ??
    --          end_zoom = ??
    --          entity_to_follow = ?? -- Takes preference if defined
    --
    --          -- Generated
    --          start_tick = ??
    --          start_position = ??
    --          start_zoom = ??
    --          
    --      }
    --  }
    return [[
        do
            local tick = game.tick - camera.start_tick

            -- Get the waypoint
            local waypoint
            for i = 1, #camera.waypoints do            
                if camera.waypoints[i].start_tick <= tick and tick <= camera.waypoints[i].end_tick then
                    waypoint = camera.waypoints[i]
                    break
                end
            end
            
            -- Abort if out of waypoints
            -- TODO Add repeat option?
            if not waypoint then return end
            
            -- Get the pan location
            local progress = (tick - waypoint.start_tick) / (waypoint.end_tick - waypoint.start_tick)
            local current_camera = camera.interpolate(waypoint, progress)            

            -- Set the current camera position
            game.camera_position = {current_camera.position.x, current_camera.position.y}
            if current_camera.zoom then game.camera_zoom = camera.zoom_modifier * current_camera.zoom end
        end
    ]]
end



return camera