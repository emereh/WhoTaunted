local ADDON_NAME
WhoTaunted = LibStub("AceAddon-3.0"):NewAddon("WhoTaunted", "AceConsole-3.0", "AceEvent-3.0")

local taunts = {
	-- Death Knights
	56222, -- Dark Command
--	49576, -- Death Grip
	51399, -- Death Grip (taunted)
	-- Warrior
	1161, -- Challenging Shout
	355, -- Taunt
	21008, -- Mocking Blow
	-- Druid
	5209, -- Challenging Roar
	6795, -- Growl
	-- Paladin
	31790, -- Righteous Defense
	62124, -- Hand of Reckoning
	-- Monk
	116189, -- Provoke
	-- Demonhunter
	185245, -- Folter
}

local taunthash = {}

for _, spell in ipairs(taunts) do
	taunthash[spell] = true
end

function WhoTaunted:OnEnable()
	self:Print("Enabled!")
	self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", "COMBAT_LOG_EVENT_UNFILTERED")
end

function WhoTaunted:OnDisable()
	self:UnregisterAllEvents()
end

function WhoTaunted:COMBAT_LOG_EVENT_UNFILTERED(event, timestamp, subevent, hideCaster,	srcGUID, srcname, srcflags, srcRaidFlags, dstGUID, dstname, dstflags, dstRaidFlags, 
	spellID, spellname, spellschool, extraspellID, extraspellname, extraspellschool, auratype)

	if not subevent then
		return
	end
	
	if not taunthash[spellID] then
		-- no taunt
		return
	end
	
	if subevent == "SPELL_MISSED" then
		-- taunt missed
	end
	
	if subevent == "SPELL_AURA_APPLIED" then
		-- taunt succeeded
	end
end
