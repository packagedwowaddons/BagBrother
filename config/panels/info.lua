--[[
	info.lua
		Help and credits menus
--]]

local PATRONS = {{title='Jenkins',people={'Gnare','Adcantu','Justin Hall','Debora S Ogormanw','Johnny Rabbit','Francesco Rollo'}},{title='Ambassador',people={'Julia F','Lolari ','Dodgen','Kelly Wolf','Kopernikus ','Ptsdthegamer','Burt Humburg','Adam Mann','Christie Hopkins','Bc Spear','Jury ','Tigran Andrew','Swallow@area52','Peter Hollaubek','Michael Kinasz','Sam Ramji','Syed Hamdani','Ds9293','Charles Howarth'}}} -- generated patron list
local L, ADDON, Addon = select(2, ...).Addon()
local Sushi = LibStub('Sushi-3.2')

local Help = Addon.GeneralOptions:New('Help', '|T516770:13:13:0:0:64:64:14:50:14:50|t')
local Credits = Addon.GeneralOptions:New('Patrons', '|TInterface/Addons/PetTracker/art/patreon:12:12|t'):SetOrientation('HORIZONTAL')

function Help:Populate()
	for i = 1, #L.FAQ, 2 do
		self:Add('ExpandHeader', L.FAQ[i], GameFontHighlightSmall):SetExpanded(self[i]):SetCall('OnClick', function() self[i] = not self[i] end)

		if self[i] then
			local answer = self:Add('Header', L.FAQ[i+1], GameFontHighlightSmall)
			answer.left, answer.right, answer.bottom = 16, 16, 16
		end
	end

	self:Add('RedButton', L.AskCommunity):SetWidth(200):SetCall('OnClick', function()
		Sushi.Popup:External('bit.ly/discord-jaliborc')
		SettingsPanel:Close(true)
	end).top = 10
end

function Credits:Populate()
	for i, rank in ipairs(PATRONS) do
		if rank.people then
			self:Add('Header', rank.title, GameFontHighlight, true).top = i > 1 and 20 or 0

			for j, name in ipairs(rank.people) do
				self:Add('Header', name, i > 1 and GameFontHighlight or GameFontHighlightLarge):SetWidth(180)
			end
		end
	end

	self:AddBreak()
	self:Add('RedButton', L.JoinUs):SetWidth(200):SetCall('OnClick', function()
		Sushi.Popup:External('patreon.com/jaliborc')
		SettingsPanel:Close(true)
	end).top = 20
end