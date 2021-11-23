data:extend({
    {    
        type = "int-setting",
        name = "hall-of-fame-playback-time",                   
        setting_type = "startup",
        order = "m",
        default_value = 120,
        minimum_value = 1,
        maximum_value = 10000
    },
    {
        type = "bool-setting",
        name = "hall-of-fame-disable-defaults",
        order = "d",
        setting_type = "startup",
        default_value = true
    },
    {
        type = "bool-setting",
        name = "hall-of-fame-camera-alt-info",
        order = "a",
        setting_type = "startup",
        default_value = false
    },
    {
        type = "double-setting",
        name = "hall-of-fame-volume-modifier",
        order = "o",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0,
        maximum_value = 5
    },
    {
        type = "double-setting",
        name = "hall-of-fame-zoom-modifier",
        order = "n",
        setting_type = "startup",
        default_value = 1,
        minimum_value = 0.5,
        maximum_value = 2.0
    },
    {
        type = "bool-setting",
        name = "hall-of-fame-mute-sound-driven",
        order = "c",
        setting_type = "startup",
        default_value = false
    },
    {
        type = "bool-setting",
        name = "hall-of-fame-moving-camera",
        order = "b",
        setting_type = "startup",
        default_value = false
    },
})