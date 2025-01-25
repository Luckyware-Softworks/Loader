repeat task.wait() until game:IsLoaded()

local script_key = script_key or key or ""

local AA = {
    8304191830, 8349889591, 10098525303, 14229762361, 14229839966, 14918509670
}

local JI = {
    10450270085, 14659177645, 16377799387, 16379657109, 16379684339, 16379688837, 17677080566, 17677081746, 75962882346490, 78904562518018, 99012371516746, 118693886221846, 119359147980471
}

if AA[game.PlaceId] then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0bd8fd6455fc4e4e8453091023892b7c.lua"))()
elseif JI[game.PlaceId] then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/9b5ab79f8007e89b695dac53c55f0904.lua"))()
end