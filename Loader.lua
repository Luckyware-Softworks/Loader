repeat
	task.wait()
until game:IsLoaded()

makefolder("Luckyware")
local key_path = "Luckyware/Key.txt"
script_key = script_key or isfile(key_path) and readfile(key_path) or nil

local Cloneref = cloneref or clonereference or function(instance)
	return instance
end
local Players, HttpService = Cloneref(game:GetService("Players")), Cloneref(game:GetService("HttpService"))
local Request = http_request or request or syn.request or http

local UI = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local API = loadstring(game:HttpGet("https://sdkAPI-public.luarmor.net/library.lua"))()
API.script_id = "0bd8fd6455fc4e4e8453091023892b7c"

local function notify(title, content, duration)
	UI:Notify({ Title = title, Content = content, Duration = duration or 8 })
end

local function checkKey(input_key)
	local status = API.check_key(input_key or script_key)
	if status.code == "KEY_VALID" then
		script_key = input_key or script_key
		writefile(key_path, script_key)
		API.load_script()
	elseif status.code:find("KEY_") then
		local messages = {
			KEY_HWID_LOCKED = "Key linked to a different HWID. Please reset it using our bot",
			KEY_INCORRECT = "Key is incorrect",
			KEY_INVALID = "Key is invalid",
		}
		notify("Key Check Failed", messages[status.code] or "Unknown error")
	else
		Players.LocalPlayer:Kick("Key check failed: " .. status.message .. " Code: " .. status.code)
	end
end

if script_key then
	checkKey()
end

local Window = UI:CreateWindow({
	Title = "Luckyware",
	SubTitle = "Loader",
	TabWidth = 160,
	Size = UDim2.fromOffset(580, 280),
	Acrylic = false,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.End,
})

local Tabs = { Main = Window:AddTab({ Title = "Key", Icon = "" }) }

local Input = Tabs.Main:AddInput("Key", {
	Title = "Enter Key:",
	Default = script_key or "",
	Placeholder = "Example: agKhRikQP..",
	Numeric = false,
	Finished = false,
})

Tabs.Main:AddButton({
	Title = "Get Key",
	Callback = function()
		setclipboard("https://ads.luarmor.net/get_key?for=Luckyware-rIRHwoqvHliI")
		notify("Copied To Clipboard", "Ad Reward Link has been copied to your clipboard", 16)
	end,
})

Tabs.Main:AddButton({
	Title = "Check Key",
	Callback = function()
		checkKey(Input.Value)
	end,
})

Tabs.Main:AddButton({
	Title = "Join Discord",
	Callback = function()
		Request({
			Url = "http://127.0.0.1:6463/rpc?v=1",
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json", ["origin"] = "https://discord.com" },
			Body = HttpService:JSONEncode({ args = { code = "luckyware" }, cmd = "INVITE_BROWSER", nonce = "." }),
		})
	end,
})

Window:SelectTab(1)
notify("Luckyware", "Loader Has Loaded Successfully")

repeat
	task.wait()
until getgenv().Luckyware
UI:Destroy()
