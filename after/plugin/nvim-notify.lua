local utils = require("almagest.utils")

utils.cfgplugin("notify", {
    background_colour = '#000',
    fps = 30,
    icons = {
        DEBUG = '',
        ERROR = '',
        INFO = '',
        TRACE = '✎',
        WARN = ''
    },
    level = 2,
    minimum_width = 50,
    render = 'default',
    stages = 'fade_in_slide_out',
    timeout = 2000,
    top_down = true
})
