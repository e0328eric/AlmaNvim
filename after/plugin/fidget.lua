local utils = require("almagest.utils")

utils.cfgplugin("fidget", {
    text = {
        spinner = "bouncing_ball",
        -- spinner = "moon",
        done = "✔",
        commenced = "Started",
        completed = "Completed"
    },
    align = {bottom = true, right = true},
    timer = {spinner_rate = 125, fidget_decay = 2000, task_decay = 1000},
    window = {relative = "win", blend = 100, zindex = nil, border = "none"},
    fmt = {
        leftpad = true,
        stack_upwards = true,
        max_width = 0,
        fidget = function(fidget_name, spinner)
            return string.format("%s %s", spinner, fidget_name)
        end,
        task = function(task_name, message, percentage)
            return string.format("%s%s [%s]", message, percentage and
                                     string.format(" (%s%%)", percentage) or "",
                                 task_name)
        end
    },
    debug = {logging = false, strict = false}

})
