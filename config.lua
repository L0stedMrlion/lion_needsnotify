Config.TimeBetweenChecking = 60 -- In seconds, ideal is something like in from 60s to 120s

Config.Lang {
    hungry = "You are hungry! Go eat something.",
    thirsty = "You are thirsty! Go drink some water.",
    veryhungry = "You are very hungry! Go eat something.",
    verythirsty = "You are very thirsty! Go drink some water.",
}

Notify = function(description, icon, iconcolor, duration) -- EDIT TO YOUR OWN NOTIFICATIONS IF YOU DONT USE LIB NOTIFICATIONS!
    lib.notify({
        id = "status",
        title = "Status",
        description = description,
        icon = icon,
        iconColor = iconcolor,
        duration = duration,
    })
end