local character = {}

-- Initialize the character AI
function character.init(ctx)

    if ctx.waypoints then
        -- Fix waypoints
        -- Remember, this does no pathfinding! TODO
        for i, waypoint in pairs(ctx.waypoints) do
            ctx.waypoints[i].start_position = waypoint.start_position or (i > 1 and ctx.waypoints[i-1].end_position) or ctx.start_position            
        end
    else ctx.waypoints = { } end

    return [[
        if not interpolate then interpolate = function (a, b, x) return a + x * (b - a) end end        
        if not character_ai then character_ai = {
            characters = { },
            api = {
                create_character = function (ctx)                    
                    return game.surfaces[1].create_entity{
                        name = "character", 
                        position = ctx.position, 
                        force = "player"
                    }
                end,
                interpolate = function(waypoint, factor)               
                    return {
                        position = {
                            x = interpolate(waypoint.start_position.x, waypoint.end_position.x, factor),
                            y = interpolate(waypoint.start_position.y, waypoint.end_position.y, factor),
                        },                    
                    }
                end,
                direction = function(p_1, p_2)
                    local d_x = (p_2[1] or p_2.x) - (p_1[1] or p_1.x)
                    local d_y = (p_2[2] or p_2.y) - (p_1[2] or p_1.y)
                    local angle = math.atan2(d_y, d_x)                
                    local orientation =  (angle / (2 * math.pi)) - 0.25
                    if orientation < 0 then orientation = orientation + 1 end                
                    local direction = math.floor((orientation * 8) + 0.5)
                    if direction == 8 then direction = 0 end
                    return direction
                end,
                distance = function(p_1, p_2)
                    local dx = (p_1[1] or p_1.x) - (p_2[1] or p_2.x)
                    local dy = (p_1[2] or p_1.y) - (p_2[2] or p_2.y)
                    return ((dx * dx) + (dy * dy)) ^ 0.5
                end,
                get_shoot_target = function(entity)
                    local enemies = entity.surface.find_entities_filtered{force = "enemy", type = {"unit"}, position = entity.position, radius = 15}
                    local closest = entity.surface.get_closest(entity.position, enemies)
                    return closest
                end,
                fluff = function(position, fluff)
                    local x = position.x + ((math.random() - 0.5) * fluff * 2)
                    local y = position.y + ((math.random() - 0.5) * fluff * 2)
                    return {x, y}
                end,
            },
        } end
        character_ai.characters.]]..ctx.name..[[ = {
            waypoints = ]]..serpent.line(ctx.waypoints)..[[,
            current_waypoint = 1,
            start_tick = game.tick,
            entity = character_ai.api.create_character{position={]]..ctx.start_position.x..[[,]]..ctx.start_position.y..[[}},
        }
    ]]
end

function character.tick()
    return [[
        do
            for name, ai in pairs(character_ai.characters) do

                local tick = game.tick - camera.start_tick
                local api = character_ai.api
                local character = ai.entity

                -- Get the destination
                if ai.current_waypoint then
                    local destination = ai.waypoints[ai.current_waypoint].end_position
                    if api.distance(character.position, destination) < 1 then
                        ai.current_waypoint = ai.current_waypoint + 1                    
                    end
                    if ai.current_waypoint > #ai.waypoints then 
                        ai.current_waypoint = nil
                        character.walking_state = {walking = false}
                        break
                    end

                    -- Got a destination, walk in that direction!
                    if game.tick % 17 == 0 then
                        local walking_direction = api.direction(destination, character.position)
                        character.walking_state = {walking = true, direction = walking_direction}
                    end
                end        
        
                if not (shoot_target and shoot_target.valid) or game.tick % 123 == 0 then
                    shoot_target = api.get_shoot_target(character)
                end
        
                if shoot_target then
                    character.shooting_state = {state = defines.shooting.shooting_enemies, position = shoot_target.position}
                    if game.tick % 31 == 0 then
                        character.surface.create_entity{
                            name = "grenade", 
                            position = character.position, 
                            speed = 0.3, 
                            target = api.fluff(shoot_target.position, 2), 
                            force = "player"
                        }
                    end
                else
                    character.shooting_state = {state = defines.shooting.not_shooting}
                end
            end
        end
    ]]
end

return character
 
