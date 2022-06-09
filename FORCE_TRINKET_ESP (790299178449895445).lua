local esp_module = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))(); do
	esp_module:Toggle(true);

	esp_module.Players = false;
	esp_module.Tracers = false; 
	esp_module.Boxes = false;

	local function check_childrens(parent)
		if (parent:FindFirstChildWhichIsA("StringValue") and parent:FindFirstChild("Rarity")) then 
			if (parent.Rarity.Value:lower() == "common") then
				esp_module:Add(parent, {Name = "COMMON TRINKET"; Color = Color3.fromRGB(255, 255, 255);});
			elseif (parent.Rarity.Value:lower() == "uncommon") then 
			    esp_module:Add(parent, {Name = "UNCOMMON TRINKET"; Color = Color3.fromRGB(0, 191, 255);});
			elseif (parent.Rarity.Value:lower() == "rare") then 
				esp_module:Add(parent, {Name = "RARE TRINKET"; Color = Color3.fromRGB(138, 43, 226);});
			elseif (parent.Rarity.Value:lower():find("legendary")) then 
				esp_module:Add(parent, {Name = "LEGENDARY TRINKET"; Color = Color3.fromRGB(255, 255, 0);});
			else
				esp_module:Add(parent, {Name = "TRINKET | RARITY : " .. tostring(parent.Rarity.Value):upper(); Color = Color3.fromRGB(124, 252, 0)});
			end;
		end;
	end;

	for i, v in next, workspace:GetChildren() do 
		check_childrens(v);
	end;
	workspace.ChildAdded:connect(function(v)
		check_childrens(v);
	end);
end;
