local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "Rayfield Example Window",
	Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
	LoadingTitle = "ArcadePro3000",
	LoadingSubtitle = "by ducc",
	ShowText = "ArcadePro3000", -- for mobile users to unhide Rayfield, change if you'd like
	Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes

	ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.
})

local _PLAYING = "NONE"
local _MACHINE = nil

local Tab_Main = Window:CreateTab("Main")
local Label_Main_Detection = Tab_Main:CreateLabel("Playing: None")

local connections = {}

local games = {
	["Customer Service: The Game"] = function(post)
		local questions = {
			["autoclick"] = "Autoclicking is against the rules and can get you pbanned.",
			["stupid"] = "Please be nice to other customers.",
			["blocking the metro"] = "Please get out of the doorway.",
			["bobux for mod"] = "Bribes are not permitted.",
			["do prizes save"] = "Prizes save unless otherwise noted.",
			["or else"] = "Sir, please refrain from making threats.",
			["fulfillment"] = "Press the ? button on your station to view the instructions.",
			["appeal"] = "You can do so in our community server.",
			["earn credits"] = "One of the ways is through Lost Tokens.",
			["pls play"] = "Please stop spamming.",
			["pls donate"] = "Please don't excessively beg.",
			["broken"] = "Sorry about that, we will refund and disable the machine.",
			["250 back"] = "Please do not attempt to scam others.",
			["in ohio"] = "[Say nothing]",
			["rigged"] = "It's on purpose to recreate the typical experience.",
			["unlucky"] = "I'm sorry, maybe next time's a charm.",
			["should not exist"] = "Would you be willing to explain why?",
			["stars"] = "They are earned from robux purchases.",
			["club membership"] = "Purchase the gamepass from our shop.",
			["become staff"] = "You can apply in the server if you're 13+.",
			["jackpot stolen"] = "Do not steal stations from other users.",
			["stole my jackpot"] = "So sorry about that, who was it?",
			["lost all my"] = "Don't worry, make a ticket in our community server and we will help you.",
			["inappropriate"] = "We treat staff mistreatment very seriously. You should report the issue to our comms server.",
			["randomburg"] = "In the 2nd floor of Another Round.",
			["restricted"] = "Due to policies in your country.",
			["regen"] = "Sure, I'll be right over!",
			["help!"] = "What do need help with?",
			["sucks"] = "I'm sorry, what can we do to do better?",
		}

		local bubble = post.Screen.SurfaceGui.Gameplay.SpeechBubble.TextLabel
		local credits = post.Screen.SurfaceGui.Gameplay.Credits

		local options = {
			post.Screen.SurfaceGui.Gameplay["1"].TextLabel,
			post.Screen.SurfaceGui.Gameplay["2"].TextLabel,
			post.Screen.SurfaceGui.Gameplay["3"].TextLabel,
		}

		local old = options[1].Text
		local old2 = options[2].Text
		local old3 = options[3].Text

		local initialConnect

		local function check()
			if initialConnect then
				initialConnect:Disconnect()
				initialConnect = nil
			end
			old = options[1].Text
			old2 = options[2].Text
			old3 = options[3].Text
			local question = bubble.Text:lower()
			print("Q: " .. bubble.Text)
			for key, answer in pairs(questions) do
				if question:find(key) then
					print("Q contains: " .. key)
					print("A: " .. answer)

					for i, optionsLabel in ipairs(options) do
						print("Checking option " .. i .. ": " .. optionsLabel.Text)
						if optionsLabel.Text == answer then
							print("Firing proximity prompt for option " .. i)
							fireproximityprompt(post[i].ProximityPrompt)
							break
						end
					end
					break
				end
			end
		end

		initialConnect = options[1]:GetPropertyChangedSignal("Text"):Connect(function()
			task.wait(0.1)
			if options[1].Text ~= "" then
				check()
			end
		end)

		local function preCheck()
			while connections["Customer Service: The Game"] do
				task.wait(0.01)
				if options[1].Text ~= old or options[2].Text ~= old2 or options[3].Text ~= old3 then
					check()
					break
				end
			end
		end

		connections["Customer Service: The Game"] = {
			credits:GetPropertyChangedSignal("Text"):Connect(preCheck),
		}

		local state = post.CardReader.GameInfo.State
		state:GetPropertyChangedSignal("Value"):Connect(function()
			if state.Value == "IDLE" then
				for _, connection in ipairs(connections["Customer Service: The Game"]) do
					connection:Disconnect()
				end
				-- reset toggle
				Label_Main_Detection:Set("Playing: None")
			end
		end)
	end,
	["Fast Food Frenzy (Remastered)"] = function(post)
		local debounce = false
		connections["Fast Food Frenzy (Remastered)"] = post.Screen.SurfaceGui.Main.ChatBubble.Say
			:GetPropertyChangedSignal("Text")
			:Connect(function()
				local text = post.Screen.SurfaceGui.Main.ChatBubble.Say.Text
				if string.find(text, "Cheeseburger") and not debounce then
					print("Order: Cheeseburger")
					debounce = true
					fireclickdetector(post.Food["Cheeseburger"].ClickDetector)
					return
				end
				if string.find(text, "Bloxy Cola") and not debounce then
					print("Order: Bloxy Cola")
					debounce = true
					fireclickdetector(post.Food["Bloxy Cola"].ClickDetector)
					return
				end
				if string.find(text, "Hotdog") and not debounce then
					print("Order: Hotdog")
					debounce = true
					fireclickdetector(post.Food["Hotdog"].ClickDetector)
					return
				end
				if string.find(text, "Taco") and not debounce then
					print("Order: Taco")
					debounce = true
					fireclickdetector(post.Food["Taco"].ClickDetector)
					return
				end
				if string.find(text, "Cake") and not debounce then
					print("Order: Cake")
					debounce = true
					fireclickdetector(post.Food["Cake"].ClickDetector)
					return
				end
				if string.find(text, "Witches Brew") and not debounce then
					print("Order: Witches Brew")
					debounce = true
					fireclickdetector(post.Food["Witches Brew"].ClickDetector)
					return
				end
				if string.find(text, "all") and not debounce then
					print("End of order")
					debounce = true
					fireclickdetector(post.Check.ClickDetector)
					return
				end
				debounce = false
			end)

		post.Quit.ClickDetector.MouseClick:Connect(function()
			print("Quit post")
			connections["Fast Food Frenzy (Remastered)"]:Disconnect()
		end)
	end,
}

-- UI Manager - Handles all UI element creation and visibility
local UIManager = {}
UIManager.elements = {}
UIManager.isCreated = false

function UIManager:init()
	if self.isCreated then
		return
	end

	self.elements["Customer Service: The Game"] = Tab_Main:CreateToggle({
		Name = "Auto Worker (Customer Service)",
		CurrentValue = false,
		Flag = "CSAutoWorker",
		Callback = function(value)
			if value then
				games["Customer Service: The Game"](_MACHINE)
			else
				if connections["Customer Service: The Game"] then
					for _, connection in ipairs(connections["Customer Service: The Game"]) do
						connection:Disconnect()
					end
				end
			end
		end,
	})

	self.elements["Fast Food Frenzy (Remastered)"] = Tab_Main:CreateToggle({
		Name = "Auto Worker (Fast Food Frenzy)",
		CurrentValue = false,
		Flag = "FFFRAutoWorker",
		Callback = function(value)
			if value then
				games["Fast Food Frenzy (Remastered)"](_MACHINE)
			else
				if connections["Fast Food Frenzy (Remastered)"] then
					connections["Fast Food Frenzy (Remastered)"]:Disconnect()
				end
			end
		end,
	})

	self.isCreated = true
end

function UIManager:setStatus(statusText)
	Label_Main_Detection:Set(statusText)
end

-- Initialize UI Manager
UIManager:init()

local swipeEvents = {}
for _, v in pairs(workspace:GetDescendants()) do
	if v:IsA("ProximityPrompt") and v.Parent.Name == "CardReader" then
		table.insert(swipeEvents, v)
		v.Triggered:Connect(function(player)
			-- Detect which game is being played
			local name = v.Parent.Parent.Parent.Parent.Name
			_MACHINE = v.Parent.Parent.Parent

			if name == "Game" then
				name = v.Parent.Parent.Parent.Name
			end
			if name == "Workspace" then
				name = v.Parent.Parent.Name
				_MACHINE = v.Parent.Parent
			end

			_PLAYING = name
			UIManager:setStatus("Playing: " .. name)

			-- Set up state listener
			local state = v.Parent.GameInfo.State
			state:GetPropertyChangedSignal("Value"):Connect(function()
				if state.Value == "IDLE" then
					-- Game ended
					_PLAYING = "NONE"
					_MACHINE = nil
					UIManager:setStatus("Playing: None")

					-- Disconnect game connections and reset toggles
					if connections["Customer Service: The Game"] then
						for _, connection in ipairs(connections["Customer Service: The Game"]) do
							connection:Disconnect()
						end
						connections["Customer Service: The Game"] = nil
					end
					if connections["Fast Food Frenzy (Remastered)"] then
						connections["Fast Food Frenzy (Remastered)"]:Disconnect()
						connections["Fast Food Frenzy (Remastered)"] = nil
					end

					-- Reset toggle states
					UIManager.elements["Customer Service: The Game"]:Set(false)
					UIManager.elements["Fast Food Frenzy (Remastered)"]:Set(false)
				end
			end)
		end)
	end
end
