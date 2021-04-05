data:extend({
    {    
        type = "int-setting",
        name = "hall-of-fame-playback-time",           
        setting_type = "startup",        
        default_value = 120,
        minimum_value = 1,
        maximum_value = 10000
    },
    {
        type = "bool-setting",
        name = "hall-of-fame-disable-defaults",        
        setting_type = "startup",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "hall-of-fame-camera-alt-info",        
        setting_type = "startup",
        default_value = false
    },
    {
        type = "double-setting",
        name = "hall-of-fame-volume-modifier",        
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0,
        maximum_value = 5
    }
})