-- This a purely debugging function to isolate a single simulation
-- to make sure it looks nice
for name, simulation in pairs(
    data.raw["utility-constants"]["default"].main_menu_simulations
) do
    if simulation.isolate then        
        data.raw["utility-constants"]["default"].main_menu_simulations = {simulation}
        log("Isolating simulation for debugging: "..name)
    end
end
