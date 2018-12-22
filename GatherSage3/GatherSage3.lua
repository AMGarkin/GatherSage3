local _, ns = ...

------------------------------------------------
-- Build an array of Gathering Nodes to watch --
------------------------------------------------
ns.Name, ns.Chance, ns.ID = {}, {}, {};

----------------------------
-- Skills we are watching --
----------------------------
local gsP, gsAP = {}, {};
gsP["Fishing"] = "Chance of ...";
gsP["Mining"] = "Chance of ...";
gsP["Herbalism"] = "Chance of ...";
gsP["Milling"] = "(5) mill into ...";
gsP["Prospecting"] = "Chance of ...";

gsAP["Inscription"] = "Milling";
gsAP["Jewelcrafting"] = "Prospecting";

local gsDB = {};

-- Capture the current version of the addon from the .toc file
local CURRENT_VERSION = GetAddOnMetadata('GatherSage3', 'Version');


------------------------------------------------------------------------------------------------------------------------------
-- Create a Frame for this addon so we can attach scripts and define the array for the functions that need to be registered --
------------------------------------------------------------------------------------------------------------------------------
local GatherSage3, events = CreateFrame('Frame'), {};
-------------------------------------------------
-- Fired when a new skill has been learned --
-------------------------------------------------
function events:CHAT_MSG_SKILL()
	-- Scan the current players Professions and store them in the DB
	GatherSage3:ScanProfessions();
end;
--------------------------------------------------------------------------------------------------------------------------
-- Triggered immediately before PLAYER_ENTERING_WORLD on login and UI Reload, but NOT when entering/leaving instances.  --
--------------------------------------------------------------------------------------------------------------------------
function events:PLAYER_LOGIN()
	-- Scan the current players Professions and store them in the DB
	GatherSage3:ScanProfessions();
end;
--------------------------------------------------------------------------------------------------------------
-- Set the 'OnEvent' trigger assigned to GatherSage3 and execute the function based on the Event that fired --
--------------------------------------------------------------------------------------------------------------
GatherSage3:SetScript('OnEvent', function(self, event, ...) events[event](self, ...); end);
-- Loop thru all the 'events' array and register the 'Events'
for k, v in pairs(events) do
	-- Register all events for which handlers have been defined
	GatherSage3:RegisterEvent(k);
end;

------------------------------------------------------
-- Function to scan the players current Professions --
------------------------------------------------------
function GatherSage3:ScanProfessions()
	-- Capture the SkillIndex for the players Professions
	local prof1, prof2, archaeology, fishing, cooking, firstAid = GetProfessions();
	-- Build an array of the Professions we track
	local profs = {prof1, prof2, fishing};
	-- Loop thru the Professions and find the Name and SkillLevel
	for k, v in pairs(profs) do
		-- Fetch the details for each Profession
		local name, icon, skillLevel, maxSkillLevel, numAbilities, spelloffset, skillLine, skillModifier = GetProfessionInfo(v);
		-- Make sure we save the name of the actual skill not it's parent ("Milling" instead of "Inscription") etc...
		if gsAP[name] then name = gsAP[name]; end;
		-- If we are tracking thsi Profession then process it
		if gsP[name] ~= nil then
			-- Remember this toons skill level in this Profession
			gsDB[name] = skillLevel;
		end;
	end;
end;

---------------------------------------------
-- Create the actual Hook into the Tooltip --
---------------------------------------------
GameTooltip:HookScript('OnShow', function(tooltip, ...)
	-- Define a few things
	local gsName, gsChance = nil, nil;
	-- Check to see if the mouse if over an Item
	local gsHover, gsLink = GameTooltip:GetItem();
	-- Check to see if we are over a Node
	if not gsHover then
		-- Capture the first line of the Tooltip
		local gsTooltip = _G["GameTooltipTextLeft1"]:GetText();
		-- Check to see if it is a Gather Node
		if ns.Name[gsTooltip] then
			-- Remember the Profession/Skill for later
			gsName = ns.Name[gsTooltip];
			gsChance = gsTooltip;
		end;
	-- We are mousing over an Item so process it
	else
		--Get the ItemID of the item
		local gsID = select(2, strsplit(":", gsLink));
		-- Check to see if it is a Item we monitor
		if ns.ID[gsID] ~= nil then
			-- Remember the Profession/Skill for later
			gsName = ns.ID[gsID];
			gsChance = gsID;
		end;
	end;
	-- If we are mousing over an object we support then update the Tooltip
	if gsName then
		-- Start the Tooltip color out as Red
		-- Seperate the Profession and the required level
		local prof, level = strsplit(':', gsName);
		-- Scan all the existing Tooltipl lines for "Requires xxx" and replace it
		local tipLine, r, g, b
		local found = false
		for x = 1, GameTooltip:NumLines() do
			-- Capture the current Tooltip line
			tipLine = _G["GameTooltipTextLeft"..x]:GetText();
			r, g, b = _G["GameTooltipTextLeft"..x]:GetTextColor();
			-- Build a list of lines to replace
			-- Check to see if the line starts with "Requires xxx", Millable or Prospectable
			for _, v in pairs({'^Requires', ITEM_MILLABLE, ITEM_PROSPECTABLE}) do
				if string.find(tipLine, v) then
					_G["GameTooltipTextLeft"..x]:SetText();
					found = true;
				end;
			end;
		end;
		if ((not gsHover) or (gsHover and found)) then
			-- Add a line that shows the Professions and Skill Level required
			--level = '|cffffffff(|r'..level..(gsDB[prof] and '|cffffffff/|r'..gsDB[prof] or "")..'|cffffffff)|r'
			if gsDB[prof] then
				level = string.format('|cffffffff(|r%s|cffffffff/%s)|r', level, gsDB[prof])
			else
				level = string.format('|cffffffff(|r%s|cffffffff)|r', level)
			end
			GameTooltip:AddDoubleLine(tipLine, level, r,g,b, r,g,b);
			-- Add the line that shows what will be done
			GameTooltip:AddLine(gsP[prof]);
			-- Loop thru all the Gathers that are available from this node
			for _, v in pairs(ns.Chance[gsChance]) do
				--Split each one into the Item Name and Drop Percentage
				local i, p = strsplit(':', v);
				-- Add the data to the Tooltip
				if not tonumber(i) then
					GameTooltip:AddDoubleLine(i, p, 1,1,1, 1,1,1);
				else
					GameTooltip:AddDoubleLine(GatherSage3:GetItemColor(i), p..'%', 1,1,1, 1,1,1);
				end
			end;
			-- Redraw the GameTooltip
			GameTooltip:Show();
		end
	end;
end)

-----------------------------------------------------------
-- Function to return a colorized version of an ItemLink --
-----------------------------------------------------------
function GatherSage3:GetItemColor(link)
	-- Define the defaults
	local iColor = 'ff0000';
	-- Try and extract the ItemName, ItemLink and ItemType
	local iName, iLink, _, _, _, iType = GetItemInfo(link);
	-- IF we found an ItemLink then process it
	if iLink then
		-- Extract the color from the ItemLink
		_, _, iColor = string.find(iLink, "|?c?f?f?(%x*)|?H?([^:]*):?(%d+):?");
		-- If the ItemType is a "Quest" then mark it so
		if iType == "Quest" then iName = iName..' |cffffffff(|r|cffffff00Quest|r|cffffffff)|r'; end;
		iName = string.format('|cff%s%s|r', iColor, iName)
	else
		iName = link;
	end;
	-- Return the colorized ItemName 
	return iName;
end;
