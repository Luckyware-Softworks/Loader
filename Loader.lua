repeat task.wait() until game:IsLoaded()

local script_key = script_key or key or ""

local AA = {
    [8304191830] = true,
    [8349889591] = true,
    [10098525303] = true,
    [14229762361] = true,
    [14229839966] = true,
    [14918509670] = true
}

local JI = {
    [10450270085] = true,
    [14659177645] = true,
    [16377799387] = true,
    [16379657109] = true,
    [16379684339] = true,
    [16379688837] = true,
    [17677080566] = true,
    [17677081746] = true,
    [75962882346490] = true,
    [78904562518018] = true,
    [99012371516746] = true,
    [118693886221846] = true,
    [119359147980471] = true
}

if AA[game.PlaceId] then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0bd8fd6455fc4e4e8453091023892b7c.lua"))()
elseif JI[game.PlaceId] then
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/9b5ab79f8007e89b695dac53c55f0904.lua"))()
end