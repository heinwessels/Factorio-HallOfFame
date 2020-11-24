data:extend({
    -- {    -- This default value does not work. It's a bug I think.
    --     type = "int-setting",
    --     name = "hall-of-fame-playback-time",           
    --     setting_type = "startup",        
    --     minimum_value = 1,
    --     maximum_value = 10000,
    --     default_value = 60
    -- },
    {
        type = "bool-setting",
        name = "hall-of-fame-disable-defaults",        
        setting_type = "startup",
        default_value = false
    }
})