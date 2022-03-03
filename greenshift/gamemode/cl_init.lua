include('cl_targetid.lua')
include('cl_scoreboard.lua')
include('shared.lua')
include('precache.lua')

local TimeToRespawn = 0
CreateClientConVar("ta_weapon_primary", 0, true, true)
CreateClientConVar("ta_weapon_primary_ammo", 0, true, true)
CreateClientConVar("ta_weapon_primary_attachment", 0, true, true)
CreateClientConVar("ta_weapon_primary_attachment2", 0, true, true)
CreateClientConVar("ta_weapon_primary_attachment3", 0, true, true)
CreateClientConVar("ta_weapon_secondary", 0, true, true)
CreateClientConVar("ta_weapon_secondary_attachment", 0, true, true)
CreateClientConVar("ta_ef_smoke", 1, true, true)
CreateClientConVar("ta_ef_heat", 1, true, true)
CreateClientConVar("ta_ef_extramuzzle", 1, true, true)
CreateClientConVar("ta_ef_sparks", 1, true, true)
CreateClientConVar("ta_oldacog", 0, true, true)
CreateClientConVar("ta_viewbob_reload", 1, true, true)
CreateClientConVar("ta_viewbob_silencer", 1, true, true)
CreateClientConVar("ta_viewbob_draw", 1, true, true)
CreateClientConVar("ta_different_origins", 0, true, true)
CreateClientConVar("ta_aim_sensitivity", 0.01, true, true)
CreateClientConVar("ta_hold_to_aim", 0, true, true)
CreateClientConVar("ta_personalattribute", 0, true, true)

local AMs = {
	"3",
	"5",
	"19",
	"21" }
	
local lsmgs = {}
local smgs = {}
local ars = {}
local brs = {}
local lmgs = {}
local shotguns = {}
local secweapons = {}
local ammotypes = {}
local attachments = {}
local secattachments = {}
local personalAttributes = {}
local perks = {}
local perksText = {}
local AMSound
EndGameStatus = nil
NextMap = nil
MapChangeTime = 0
CurRound = 0
TotalRounds = 0
EndGameClass = nil
local TextRebelsWin = "The Rebels have won!"
local TextCombineWin = "The Combine have won!"
local VIPText = ""
local PainMod = 0
local TeamMenuOpened = false
local ClassMenuOpened = false
local LastPressedSkillTree
local BlockSkillTreeButton = false
local SkillPoint = nil
local HardCoreMode = 0
local Blur = 0
local PLY = LocalPlayer()
PLY.Exp = 0
PLY.Level = 1
PLY.SkillPoints = 0
PLY.RequiredExp = 1000

function RegisterPersonalAttribute(name, good, bad, concommandnum)
	table.insert(personalAttributes, {name = name, good = good, bad = bad, concommandnum = concommandnum})
end

RegisterPersonalAttribute("Constant Pacing", "Increases walk speed by 30%", "Decreases run speed by 10%", 1)
RegisterPersonalAttribute("Head-first", "Increases run speed by 20%", "Cannot run left/right/backwards", 2)
RegisterPersonalAttribute("Walking Ammo Bag", "Carry an additional mag for each weapon", "Decreases run speed by 10%", 3)
RegisterPersonalAttribute("Agile Hands", "Increases reload speed by 20%", "Decreases draw speed by 15%", 4)
RegisterPersonalAttribute("Spray and Pray", "Decreases spread increase from continuous fire by 30%", "Decreases accuracy by 10%", 5) 
RegisterPersonalAttribute("Free-runner", "Increases maximum wall runs by 1", "Decreases 1 reserve magazine; is useless to Recon class", 6)
RegisterPersonalAttribute("Sharp Shooter", "Increases accuracy when aiming by 15%", "Increases hip-fire spread by 10%", 7)
RegisterPersonalAttribute("Human Tank", "Increases maximum armor by 65 points", "Decreases run speed by 15%; -1 maximum wall-runs", 8)

function RegisterPerk(number, name, availability, effect, tree, row, Yoffset, drawLine, text, textTree)
	table.insert(perks, {number = number, name = name, availability = availability, effect = effect, tree = tree, row = row, Yoffset = Yoffset, drawLine = drawLine, unlocked = false})
	
	if text != nil and textTree != nil then
		table.insert(perksText, {text = text, textTree = textTree})
	end
end

-- the registration of perks must be in reverse order (from perk 10 to perk 1, from tree 10 to tree 1) in order to prevent visual artifacts

RegisterPerk(20, "Quick Fix - Medic Tree", "Class-restricted", "Automatic Health Dispenser heals an additional health point", 4, 4, 0, false, nil, nil)
RegisterPerk(19, "Fast Medicine - Medic Tree", "Class-restricted", "Medkits regenerate 20% faster", 4, 3, 0, true, nil, nil)
RegisterPerk(18, "Battle-Hardened - Medic Tree", "Universal", "Increases maximum health by 10%", 4, 2, 0, true, nil, nil)
RegisterPerk(17, "Efficient Medicine - Medic Tree", "Class-restricted", "Healing yourself as a Medic uses only 1 medkit", 4, 1, 0, true, nil, nil) 
RegisterPerk(16, "Lifesaver - Medic Tree", "Class-restricted", "Your medkits heal your team mates an additional 5HP", 4, 0, 0, true, "Medic Tree", 4)

RegisterPerk(15, "Steady Hand - Assault Tree", "Universal", "Decreases recoil by 10%", 3, 4, 0, false, nil, nil)
RegisterPerk(14, "Regular Routine - Assault Tree", "Universal", "Increases reload speed by 10%", 3, 3, 0, true, nil, nil)
RegisterPerk(13, "Marksman - Assault Tree", "Universal", "Increases accuracy while aiming by 10%", 3, 2, 0, true, nil, nil)
RegisterPerk(12, "Heave-Ho! - Assault Tree", "Universal", "Increases grenade throw range by 15%", 3, 1, 0, true, nil, nil)
RegisterPerk(11, "Full Pockets - Assault Tree", "Universal", "Carry an additional magazine for every weapon", 3, 0, 0, true, "Assault Tree", 3)

RegisterPerk(10, "Explosive Hoarder - Engineer Tree", "Class-restricted", "Carry an additional C4 charge (only 1 is placeable at a time)", 2, 4, 0, false, nil, nil)
RegisterPerk(9, "Armored Knight - Engineer Tree", "Universal", "Increases maximum armor by 15 points", 2, 3, 0, true, nil, nil)
RegisterPerk(8, "Demolition Man - Engineer Tree", "Universal", "Increases explosive damage by 10%", 2, 2, 0, true, nil, nil)
RegisterPerk(7, "Script Kiddie - Engineer Tree", "Class-restricted", "Planting C4 is two times as fast", 2, 1, 0, true, nil, nil)
RegisterPerk(6, "Makeshift Armor - Engineer Tree", "Class-restricted", "Repairing your own armor uses only 150% repair points", 2, 0, 0, true, "Engineer Tree", 2)

RegisterPerk(5, "Invisible Man - Recon Tree", "Class-restricted", "Decreases cloak drain rate by 20%", 1, 4, 0, false, nil, nil)
RegisterPerk(4, "Quickdraw - Recon Tree", "Universal", "Increases weapon draw speed by 10%", 1, 3, 0, true, nil, nil)
RegisterPerk(3, "Lightweight - Recon Tree", "Class-restricted", "Decreases footstep volume by 20%", 1, 2, 0, true, nil, nil)
RegisterPerk(2, "Obstacle Course - Recon Tree", "Universal", "Increases jump height by 10%", 1, 1, 0, true, nil, nil)
RegisterPerk(1, "Butcher - Recon Tree", "Class-restricted", "Knife deals 50% more damage; 0.1 sec faster knife slashes", 1, 0, 0, true, "Recon Tree", 1)

function RegisterWeapon(tbl, model, weaponname, concommandnum, damage, accuracy, rof, mags, clipsize, ypos, stability, mobility)
	table.insert(tbl, {model = model, weaponname = weaponname, concommandnum = concommandnum, damage = damage, accuracy = accuracy, rof = rof, mags = mags, clipsize = clipsize, ypos = ypos, stability = stability, mobility = mobility})
end

RegisterWeapon(lsmgs, "models/weapons/w_smg_skorp.mdl", "Skorpion Vz. 61", 0, 87.5, 94.285, 85.714, 6, 20, 0, 98, 98)
RegisterWeapon(lsmgs, "models/weapons/w_smg_mp7.mdl", "Steyr MP7", 1, 75, 98, 95.238, 3, 40, 90, 78.125, 58.333)
RegisterWeapon(lsmgs, "models/weapons/w_smg_kriss.mdl", "TDI Vector", 2, 98, 94.285, 98, 4, 30, 180, 78.125, 70)

RegisterWeapon(smgs, "models/weapons/w_smg_biz.mdl", "PP-19 Bizon", 3, 50, 81.25, 65.005, 3, 64, 0, 98, 86.956)
RegisterWeapon(smgs, "models/weapons/w_cst_p90.mdl", "FN P90", 4, 77.272, 98, 98, 2, 50, 90, 80, 95.833)
RegisterWeapon(smgs, "models/weapons/w_rif_perdw.mdl", "KAC PDW", 5, 98, 86.666, 60, 3, 30, 180, 71.428, 57.142)

RegisterWeapon(shotguns, "models/weapons/w_shot_m3super90.mdl", "M3 Super 90", 6, 85.714, 98, 35, 24, 8, 0, 98, 98)
RegisterWeapon(shotguns, "models/weapons/w_shot_xm1014.mdl", "M4 Super 90", 7, 57.142, 85.714, 98, 21, 7, 90, 83.333, 98)
RegisterWeapon(shotguns, "models/weapons/w_shot_francspas.mdl", "Franchi SPAS-12", 8, 98, 98, 35, 24, 8, 180, 83.333, 98)

RegisterWeapon(ars, "models/weapons/w_rif_m416.mdl", "H&K M416", 9, 75.862, 75, 77.647, 3, 30, 0, 78.571, 75)
RegisterWeapon(ars, "models/weapons/w_rif_scar.mdl", "FN SCAR-L", 10, 75.862, 78.260, 68.75, 3, 30, 90, 98, 98)
RegisterWeapon(ars, "models/weapons/w_com_sg552.mdl", "SIG SG552 Commando", 11, 75.862, 70.588, 77.647, 3, 30, 180, 89.673, 80)
RegisterWeapon(ars, "models/weapons/w_rif_sr-3m.mdl", "SR-3M 'Vikhr'", 12, 98, 66.666, 95.606, 3, 30, 270, 91.666, 85.714)
RegisterWeapon(ars, "models/weapons/w_rif_g36c.mdl", "H&K G36C", 13, 75.862, 75, 77.647, 3, 30, 360, 91.666, 80)
RegisterWeapon(ars, "models/weapons/w_rif_aa3.mdl", "Steyr AUG A3", 14, 75.862, 98, 74.829, 3, 30, 450, 91.666, 85.714)
RegisterWeapon(ars, "models/weapons/w_rif_sg551.mdl", "SIG SG 551", 15, 75.862, 85.714, 77.647, 3, 30, 540, 85.051, 54.545)
RegisterWeapon(ars, "models/weapons/w_rif_m164.mdl", "M16A4", 16, 75.862, 90, 83, 3, 30, 630, 98, 54.545)
RegisterWeapon(ars, "models/weapons/w_rif_lr300.mdl", "ZM LR300", 17, 75.862, 93.75, 98, 5, 20, 720, 94.827, 66.666)
RegisterWeapon(ars, "models/weapons/w_rif_m4cu.mdl", "M4A1", 18, 75.862, 83.333, 98, 3, 30, 810, 91.666, 54.545)
RegisterWeapon(ars, "models/weapons/w_rif_a74u.mdl", "AK-74U", 19, 86.206, 62.5, 77.647, 3, 30, 900, 98, 98)

RegisterWeapon(brs, "models/weapons/w_rif_hkg3.mdl", "H&K G3A3", 21, 83.333, 83.870, 76.666, 3, 20, 0, 98, 88.888)
RegisterWeapon(brs, "models/weapons/w_rif_fnfal.mdl", "FN FAL 50.61", 22, 85.714, 98, 98, 3, 20, 90, 90.909, 98)
RegisterWeapon(brs, "models/weapons/w_rif_m14.mdl", "M14 EBR", 20, 98, 65, 46, 6, 10, 180, 55.555, 72.727)

RegisterWeapon(lmgs, "models/weapons/w_mach_m249norm.mdl", "M249 SAW", 23, 98, 98, 98, 2, 100, 0, 81.25, 61.363)
RegisterWeapon(lmgs, "models/weapons/w_mach_aresshrk.mdl", "Ares Shrike 5.56", 24, 98, 86.206, 68.75, 1, 200, 90, 98, 98)

function RegisterSecWeapon(model, weaponname, concommandnum, damage, accuracy, rof, mags, clipsize, stability, mobility)
	table.insert(secweapons, {model = model, weaponname = weaponname, concommandnum = concommandnum, damage = damage, accuracy = accuracy, rof = rof, mags = mags, clipsize = clipsize, stability = stability, mobility = mobility})
end

RegisterWeapon(secweapons, "models/weapons/w_pist_swp627.mdl", "S&W Model 627", 0, 98, 98, 20.185, 3, 6, 0, 10, 52.173)
RegisterWeapon(secweapons, "models/weapons/w_pist_cm1911.mdl", "M1911", 1, 77.142, 92.307, 24.772, 4, 7, 90, 41.25, 60)
RegisterWeapon(secweapons, "models/weapons/w_pist_mkrv.mdl", "Makarov Pistol", 2, 42.857, 68.571, 43.6, 8, 8, 180, 98, 98)
RegisterWeapon(secweapons, "models/weapons/w_cstm_glock18.mdl", "Glock-18", 3, 37.142, 80, 98, 3, 19, 270, 50, 66.666)
RegisterWeapon(secweapons, "models/weapons/w_pist_beretta92.mdl", "Beretta 92FS", 4, 62.857, 98, 36.3, 4, 15, 360, 50, 63.157)
RegisterWeapon(secweapons, "models/weapons/w_eq_fraggrenade_thrown.mdl", "Frag grenade", 5, 98, 98, 1, 0, 0, 450, 98, 98)
RegisterWeapon(secweapons, "models/weapons/w_eq_smokegrenade_thrown.mdl", "Smoke grenade", 6, 1, 98, 1, 1, 1, 540, 98, 98)

function RegisterAttachment(model, attachmentname, concom, concommandnum, ypos, textgood, textbad, restricted)
	table.insert(attachments, {model = model, attachmentname = attachmentname, concom = concom, concommandnum = concommandnum, ypos = ypos, textgood = textgood, textbad = textbad, restricted = restricted})
end

RegisterAttachment("models/wystan/attachments/acog.mdl", "Trijicon ACOG Scope (ARs/BRs)", "ta_weapon_primary_attachment", 2, 90, "Very high accuracy increase when taking aim", "Disables crosshair; increases hip-fire inaccuracy by 60%", {0, 1, 2, 3, 4, 5, 6, 7, 8, 12, 19, 23, 24})
RegisterAttachment("models/wystan/attachments/aimpoint.mdl", "Aimpoint red-dot scope (ARs/BRs/LMGs)", "ta_weapon_primary_attachment", 3, 180, "High accuracy increase when taking aim", "Increases hip-fire inaccuracy by 40%", {0, 1, 2, 3, 4, 5, 6, 7, 8, 22})
RegisterAttachment("models/wystan/attachments/eotech557sight.mdl", "EoTech 557 red-dot sight (SMGs/LSMGs/LMGs/Shotguns)", "ta_weapon_primary_attachment", 4, 0, "Moderate accuracy increase when taking aim; caps maximum bullet spread at 45%", "Disables crosshair; increases hip-fire inaccuracy by 20%", {0, 3, 12, 16, 17, 21, 22})
RegisterAttachment("models/wystan/attachments/m203.mdl", "M203 Underslung grenade launcher (ARs)", "ta_weapon_primary_attachment2", 6, 350, "Fires out 40MM HE grenades", "10% draw speed decrease; 10% hip-fire inaccuracy increase", {0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 14, 15, 17, 19, 20, 21, 22, 23, 24}) 
RegisterAttachment("models/wystan/attachments/foregrip1.mdl", "Vert grip", "ta_weapon_primary_attachment2", 7, 440, "Decreases hip-fire spread by 30%; increases mobility by 25%; decreases recoil by 20%", "15% draw speed decrease", {0, 1, 2, 3, 4, 5, 6, 7, 10, 11, 12, 21, 22, 23, 24}) 
RegisterAttachment("models/wystan/cmag.mdl", "Beta C-magazine", "ta_weapon_primary_attachment2", 8, 530, "Increases magazine size to 100 rounds", "20% reload speed decrease; 15% draw speed decrease", {0, 1, 2, 3, 4, 5, 6, 7, 8, 10, 11, 12, 13, 14, 15, 19, 20, 21, 22, 23, 24}) 

function RegisterSecAttachment(model, attachmentname, concom, concommandnum, ypos, textgood, textbad, restricted)
	table.insert(secattachments, {model = model, attachmentname = attachmentname, concom = concom, concommandnum = concommandnum, ypos = ypos, textgood = textgood, textbad = textbad, restricted = restricted})
end

RegisterSecAttachment("models/wystan/attachments/acog.mdl", "Trijicon ACOG Scope", "ta_weapon_secondary_attachment", 2, 0, "Very high accuracy increase when taking aim", "Disables crosshair; increases hip-fire inaccuracy by 30%; decreases draw speed by 11%", {1, 2, 3, 4, 5, 6})
RegisterSecAttachment("models/wystan/attachments/doctorrds.mdl", "Docter red-dot sight", "ta_weapon_secondary_attachment", 9, 90, "Moderate accuracy increase when taking aim", "increases hip-fire inaccuracy by 10%; decreases draw speed by 8%", {0, 2, 4, 5, 6})

function RegisterAmmoType(ammotexttype, ammotextgood, ammotextbad, ypos, concommandnum, restriction)
	table.insert(ammotypes, {ammotexttype = ammotexttype, ammotextgood = ammotextgood, ammotextbad = ammotextbad, ypos = ypos, concommandnum = concommandnum, restriction = restriction})
end

RegisterAmmoType("Default ammo", "None", "None", 0, 1, {55})
RegisterAmmoType("Hollow-point", "130% damage against unarmored enemies", "70% damage against armored enemies", 90, 2, {55})
RegisterAmmoType("Armor-piercing", "130% damage against armored enemies", "70% damage against unarmored enemies", 180, 3, {55})
RegisterAmmoType("Magnum", "115% damage dealt", "130% recoil", 270, 4, {55})
RegisterAmmoType("Slug (Shotguns)", "Fires out a single slug that deals high damage; increases accuracy greatly", "1 pellet; very high mobility decrease", 360, 5, {0, 1, 3, 4, 5, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24})
-- if you're reading this, there was supposed to be Incendiary ammo, which dealt 60% damage while igniting the hit target for 6 seconds. after lots of play-testing it was removed due to being FUCKING OVER-POWERED. FUCK, THE MEMORIES OF GETTING IGNITED AND NOT ABLE TO SEE SHIT. FUCK THAT AMMO TYPE.

function GM:AddNotify( str, type, length )

	notification.AddLegacy( str, type, length )
	
end

local PBAR = {}
 
AccessorFunc( PBAR, "m_iMin", 	"Min" )
AccessorFunc( PBAR, "m_iMax", 	"Max" )
AccessorFunc( PBAR, "m_iValue", 	"Value" )
AccessorFunc( PBAR, "m_Color", 	"Color" )
 
/*---------------------------------------------------------
	Init
---------------------------------------------------------*/
function PBAR:Init()
 
	self.Label = vgui.Create( "DLabel", self )
	self.Label:SetFont( "DefaultSmall" )
	self.Label:SetColor( Color( 0, 0, 0 ) )
 
	self:SetMin( 0 )
	self:SetMax( 1000 )
	self:SetValue( 253 )
	self:SetColor( Color( 50, 205, 255, 255 ) )
 
end
 
function PBAR:LabelAsPecentage()
	self.m_bLabelAsPercentage = true
	self:UpdateText()
end
 
function PBAR:SetMin( i )
	self.m_iMin = i
	self:UpdateText()
end
 
function PBAR:SetMax( i )
	self.m_iMax = i
	self:UpdateText()
end
 
function PBAR:SetValue( i )
	self.m_iValue = i
	self:UpdateText()
end
 
function PBAR:UpdateText()
 
	if ( !self.m_iMax ) then return end
	if ( !self.m_iMin ) then return end
	if ( !self.m_iValue ) then return end
 
	local fDelta = 0;
 
	if ( self.m_iMax-self.m_iMin != 0 ) then
		fDelta = ( self.m_iValue - self.m_iMin ) / (self.m_iMax-self.m_iMin)
	end
 
	if ( self.m_bLabelAsPercentage ) then
		self.Label:SetText( Format( "%.2f%%", fDelta * 100 ) )
		return
	end
 
	if ( self.m_iMin == 0 ) then
 
		self.Label:SetText( Format( "%i / %i", self.m_iValue, self.m_iMax ) )
 
	else
 
		// Todo..
 
	end
 
end
 
 
/*---------------------------------------------------------
	PerformLayout
---------------------------------------------------------*/
function PBAR:PerformLayout()
 
	//self.Label:CopyBounds( self )
	self.Label:SizeToContents()
	self.Label:AlignRight( 5 )
	self.Label:CenterVertical()
 
end
 
function PBAR:Paint()
 
	local fDelta = 0;
 
	if ( self.m_iMax-self.m_iMin != 0 ) then
		fDelta = ( self.m_iValue - self.m_iMin ) / (self.m_iMax-self.m_iMin)
	end
 
	local Width = self:GetWide()
 
	surface.SetDrawColor( 0, 0, 0, 170 )
	surface.DrawRect( 0, 0, Width, self:GetTall() )
 
	surface.SetDrawColor( self.m_Color.r, self.m_Color.g, self.m_Color.b, self.m_Color.a * 0.5 )
	surface.DrawRect( 2, 2, Width - 4, self:GetTall() - 4 )
	surface.SetDrawColor( self.m_Color.r, self.m_Color.g, self.m_Color.b, self.m_Color.a )
	surface.DrawRect( 2, 2, Width * fDelta - 4, self:GetTall() - 4 )
 
end
 
vgui.Register( "DProgressBar", PBAR, "DPanel" )

local Outline = {}

function Outline:Paint()
	local x, y = self:GetPos()
	local r, g, b, a = self.color
	surface.SetDrawColor(r, g, b, a)
	surface.DrawOutlinedRect(0, 0, self:GetWide() - 2, self:GetTall() - 2 )
end

vgui.Register("DOutline", Outline, "DPanel")

local SkillTree = {}

function SkillTree:Init()
	self.TextboxAlpha = 0
	self.Yoffset = 0
	self.Unlocked = false
end

function SkillTree:Paint()
	local x, y = self:GetPos()
	local w = self.W
	local h = self.H
	
	surface.SetDrawColor(self.OutlineColor)
	surface.DrawOutlinedRect(0, 0, w, h)
	
	surface.SetDrawColor(self.InlineColor)
	surface.DrawRect(1, 1, w - 2, h - 2)
	
	if self.DrawLine then
		if self.Unlocked then
			surface.SetDrawColor(30, 200, 30, 255)
		else
			surface.SetDrawColor(255, 0, 0, 255)
		end
		
		surface.DrawLine(32, 16, 64, 16 + self.Yoffset)
	end
	
	local IOC
	
	if self.Unlocked then
		IOC = Color(30, 200, 30, 255)
	else
		IOC = Color(255, 0, 0, 255)
	end
	
	surface.SetDrawColor(IOC)
	surface.DrawOutlinedRect(2, 2, w - 4, h - 4) 
	
	local OC = self.OutlineColorTextbox
	local IC = self.InlineColorTextbox
	
	surface.SetDrawColor(OC.r, OC.g, OC.b, self.TextboxAlpha)
	surface.DrawOutlinedRect(1, 40, 300, 50)
	
	surface.SetDrawColor(IC.r, IC.g, IC.b, self.TextboxAlpha * 0.85)
	surface.DrawRect(2, 41, 298, 48)
	
	draw.SimpleText(self.PerkName or "Perk Name", "Default", 7, 45, Color(255, 255, 255, self.TextboxAlpha))
	draw.SimpleText(self.Availability or "Universal/class-restricted", "Default", 7, 60, Color(255, 185, 0, self.TextboxAlpha))
	draw.SimpleText(self.Effect or "Increases penis size by 40%", "DefaultSmall", 7, 75, Color(0, 150, 250, self.TextboxAlpha))
	 
	local x2, y2 = self:ScreenToLocal()
	
	x2 = gui.MouseX() + x2
	y2 = gui.MouseY() + y2
	 
	if x2 <= self.W and y2 <= self.H and x2 > 0 and y2 > 0 then
		self.TextboxAlpha = Lerp(0.2, self.TextboxAlpha, 255)
		self:SetMouseInputEnabled(true) -- this way there is no way a skill tree icon can block another skill tree icon
	else
		self.TextboxAlpha = Lerp(0.2, self.TextboxAlpha, 0)
		self:SetMouseInputEnabled(false)
	end
end

function SkillTree:OnMousePressed()
	if not self.Unlocked then
		local x2, y2 = self:ScreenToLocal()
		
		x2 = gui.MouseX() + x2
		y2 = gui.MouseY() + y2
		
		if x2 > 0 and x2 <= self.W and y2 > 0 and y2 < self.H and not BlockSkillTreeButton then
			RunConsoleCommand("ta_unlockskill", self.Number)
			LastPressedSkillTree = self
			BlockSkillTreeButton = true
		end
	end
end

vgui.Register("GSSkillTree", SkillTree, "DPanel")

function GM:PostPlayerDraw(ply)
	if ply:GetDTInt(3) != 0 then
		ply:SetColor( Color(255, 255, 255, ply:GetDTInt(3)) )
	else
		ply:SetColor( Color(255, 255, 255, 255) )
	end
end

function GM:PlayerBindPress(ply, bind, pressed)
	if bind == "undo" or bind == "gmod_undo" then
		RunConsoleCommand("detonate_charge")
	end
end

function GM:OnSpawnMenuOpen()
	RunConsoleCommand("ta_use_medkit")
end

function GM:OnContextMenuOpen()
	RunConsoleCommand("ta_do_action")
end

function TA_TeamMenu_Initial()
	local ply = LocalPlayer()

	if ply:Alive() and ply:Team() != TEAM_SPECTATOR then
		GAMEMODE:AddNotify("Cannot switch teams while alive.", NOTIFY_ERROR, 6)
		surface.PlaySound("buttons/button10.wav")
		return
	end

	local MainFrame = vgui.Create( "DFrame" )
	MainFrame:SetPos(ScrW() / 2 - 90, ScrH() / 2)
	MainFrame:SetSize(180, 80)
	MainFrame:SetTitle("Choose your team")
	MainFrame:SetVisible(true)
	MainFrame:SetDraggable(false)
	MainFrame:ShowCloseButton(false)
	
	MainFrame.Paint = function()
		surface.SetDrawColor(0, 150, 250, 255)
		surface.DrawOutlinedRect(0, 0, MainFrame:GetWide(), MainFrame:GetTall())
		
		surface.SetDrawColor(0, 0, 0, 220)
		surface.DrawRect(1, 1, MainFrame:GetWide() - 2, MainFrame:GetTall() - 2)
	end
	
	MainFrame:MakePopup()
	
	local team1 = vgui.Create( "DButton", MainFrame )
	team1:SetPos( 20, 25 )
	team1:SetSize( 140, 20 )
	team1:SetText( "Rebels (" .. #team.GetPlayers(1) .. " player(s))" )
	team1.DoClick = function()
		if #team.GetPlayers(TEAM_REBELS) > #team.GetPlayers(TEAM_COMBINE) then
			GAMEMODE:AddNotify("Team Rebels is full.", NOTIFY_ERROR, 5)
			return
		end
		
		RunConsoleCommand( "ta_gorebel" )
		MainFrame:Close()
	end
	
	local team2 = vgui.Create( "DButton", MainFrame )
	team2:SetPos( 20, 55)
	team2:SetSize( 140, 20 )
	team2:SetText( "Combine (" .. #team.GetPlayers(2) .. " player(s))" )
	team2.DoClick = function()
		if #team.GetPlayers(TEAM_COMBINE) > #team.GetPlayers(TEAM_REBELS) then
			GAMEMODE:AddNotify("Team Combine is full.", NOTIFY_ERROR, 5)
			return
		end
		
		RunConsoleCommand( "ta_gocombine" )
		MainFrame:Close()
	end
end

concommand.Add("ta_teammenu_initial", TA_TeamMenu_Initial)

function TA_TeamMenu()
	local ply = LocalPlayer()

	if ply:Alive() and ply:Team() != TEAM_SPECTATOR then
		GAMEMODE:AddNotify("Cannot switch teams while alive.", NOTIFY_ERROR, 6)
		surface.PlaySound("buttons/button10.wav")
		return
	end

	local MainFrame = vgui.Create( "DFrame" )
	MainFrame:SetPos(ScrW() / 2 - 90, ScrH() / 2)
	MainFrame:SetSize(180, 80)
	MainFrame:SetTitle("Choose your team")
	MainFrame:SetVisible(true)
	MainFrame:SetDraggable(false)
	MainFrame:ShowCloseButton(true)
	
	MainFrame.Paint = function()
		surface.SetDrawColor(0, 150, 250, 255)
		surface.DrawOutlinedRect(0, 0, MainFrame:GetWide(), MainFrame:GetTall())
		
		surface.SetDrawColor(0, 0, 0, 220)
		surface.DrawRect(1, 1, MainFrame:GetWide() - 2, MainFrame:GetTall() - 2)
	end
	
	MainFrame:MakePopup()
	
	local team1 = vgui.Create( "DButton", MainFrame )
	team1:SetPos( 20, 25 )
	team1:SetSize( 140, 20 )
	team1:SetText( "Rebels (" .. #team.GetPlayers(1) .. " player(s))" )
	team1.DoClick = function()
		if #team.GetPlayers(TEAM_REBELS) > #team.GetPlayers(TEAM_COMBINE) then
			GAMEMODE:AddNotify("Team Rebels is full.", NOTIFY_ERROR, 5)
			return
		end
		
		RunConsoleCommand( "ta_gorebel" )
		MainFrame:Close()
	end
	
	local team2 = vgui.Create( "DButton", MainFrame )
	team2:SetPos( 20, 55)
	team2:SetSize( 140, 20 )
	team2:SetText( "Combine (" .. #team.GetPlayers(2) .. " player(s))" )
	team2.DoClick = function()
		if #team.GetPlayers(TEAM_COMBINE) > #team.GetPlayers(TEAM_REBELS) then
			GAMEMODE:AddNotify("Team Combine is full.", NOTIFY_ERROR, 5)
			return
		end
		
		RunConsoleCommand( "ta_gocombine" )
		MainFrame:Close()
	end
end

concommand.Add("ta_teammenu", TA_TeamMenu)

function TA_ClassMenu()
	local MainFrame = vgui.Create( "DFrame" )
	MainFrame:SetPos( ScrW() / 2 - 90, ScrH() / 2 )
	MainFrame:SetSize( 400, 600 )
	MainFrame:SetTitle( "Choose your class" )
	MainFrame:SetVisible( true )
	MainFrame:SetDraggable( false )
	MainFrame:ShowCloseButton( false )
	MainFrame.Paint = function()
		surface.SetDrawColor(0, 150, 250, 255)
		surface.DrawOutlinedRect(0, 0, MainFrame:GetWide(), MainFrame:GetTall())
		
		surface.SetDrawColor(0, 0, 0, 220)
		surface.DrawRect(1, 1, MainFrame:GetWide() - 2, MainFrame:GetTall() - 2)
	end
	
	MainFrame:MakePopup()
	MainFrame:Center()
	
	local class1 = vgui.Create( "DButton", MainFrame )
	class1:SetPos( 20, 25 )
	class1:SetSize( 100, 20 )
	class1:SetText( "Recon" )
	class1.DoClick = function()
		RunConsoleCommand("ta_gorecon")
		MainFrame:Close()
	end
	
	local label = vgui.Create("DLabel", MainFrame)
	label:SetPos(25, 50)
	label:SetText([[Main role: infiltrate/assassinate.
Has access to pistols and light SMGs.
Fastest movement speed.
Has full access to climbing system.
Can become invisible for 20 seconds.
Unique item - knife. Backstab = instant kill.
80 HP
40 AP]])
	label:SizeToContents()
	
	local class2 = vgui.Create( "DButton", MainFrame )
	class2:SetPos( 20, 160)
	class2:SetSize( 100, 20 )
	class2:SetText( "Engineer" )
	class2.DoClick = function()
		RunConsoleCommand( "ta_goengineer" )
		MainFrame:Close()
	end
	
	local label = vgui.Create("DLabel", MainFrame)
	label:SetPos(25, 185)
	label:SetText([[Main role: support/area denial.
Has access to pistols, SMGs and shotguns.
Fast movement speed.
Has near-full access to climbing system.
Can repair teammates' armor.
Unique item - C4 Charge.
85 HP
85 AP]])
	label:SizeToContents()
	
	local class3 = vgui.Create( "DButton", MainFrame )
	class3:SetPos( 20, 300)
	class3:SetSize( 100, 20 )
	class3:SetText( "Assault" )
	class3.DoClick = function()
		RunConsoleCommand( "ta_goassault" )
		MainFrame:Close()
	end
	
	local label = vgui.Create("DLabel", MainFrame)
	label:SetPos(25, 325)
	label:SetText([[Main role - push/support.
Has access to all weapons.
Medium movement speed.
Has limited access to climbing system.
Can resupply teammates' ammo.
Unique item - Incendiary grenade.
100HP.
50AP.]])
	label:SizeToContents()
	
	local class4 = vgui.Create( "DButton", MainFrame )
	class4:SetPos( 20, 435)
	class4:SetSize( 100, 20 )
	class4:SetText( "Medic" )
	class4.DoClick = function()
		RunConsoleCommand( "ta_gomedic" )
		MainFrame:Close()
	end
	
	local label = vgui.Create("DLabel", MainFrame)
	label:SetPos(25, 460)
	label:SetText([[Main role - support (main)/push.
Has access to pistols, SMGs, ARs.
Medium movement speed.
Has limited access to climbing system.
Can give med kits to teammates.
Unique item - Automatic health dispenser.
110HP.
55AP.]])
	label:SizeToContents()
end

concommand.Add("ta_classmenu", TA_ClassMenu)

local HeartBeatTime = 0
local NextNotify = 0
local NextSound = ""
local QMenuKey = ""
local CMenuKey = ""
local YOffset = 0
local Help_WallRunDelay = 0
local Help_PullSelfUpDelay = 0 
local Help_RollDelay = 0
local Help_Health = 0
local Help_Actions = 30
local Help_M203 = 0
ObjectiveText = ""
local RedAlpha = 0

function GM:Think()
	local ply = LocalPlayer()
	if not ply or not ply:IsValid() then return end
	local wep = ply:GetActiveWeapon()
	local vm = ply:GetViewModel()
	
	if GetGlobalInt("n1data") >= 100 and GetGlobalInt("n2data") < 100 and not EndGameClass and not GameEnded then
		RunConsoleCommand("ta_givemeendgameclass")
	end
	
	if ply:Team() == TEAM_SPECTATOR and not TeamMenuOpened then
		RunConsoleCommand("ta_teammenu_initial")
		TeamMenuOpened = true
	end
	
	if ply:Team() != TEAM_SPECTATOR then
		if not ply.Class and not ClassMenuOpened and TeamMenuOpened == true then
			RunConsoleCommand("ta_classmenu")
			
			ClassMenuOpened = true
		end
	end
	
	AmountOfFood = #ents.FindByClass("ta_depot_food")
	AmountOfWeapon = #ents.FindByClass("ta_depot_weapon")
	
	DownloadNode = #ents.FindByClass("ta_node_download")
	UploadNode = #ents.FindByClass("ta_node_upload")
	
	if AmountOfFood > 0 and AmountOfWeapon > 0 and not ply.IsSupplyDepot then
		ply.IsSupplyDepot = true
	end
	
	if ply:Team() == TEAM_REBELS then
	
		if DownloadNode > 0 or UploadNode > 0 then
			if GetGlobalInt("n1data") < 100 then
				ObjectiveText = "Download data."
			elseif GetGlobalInt("n1data") >= 100 and GetGlobalInt("n2data") < 100 then
				if EndGameClass then
					ObjectiveText = "Upload data. (" .. EndGameClass .. " class required)"
				end
			else
				ObjectiveText = ""
			end
		end
		
		if ply.IsSupplyDepot then
			ObjectiveText = "Protect food crates and weapon caches."
		end
		
	elseif ply:Team() == TEAM_COMBINE then
	
		if DownloadNode > 0 or UploadNode > 0 then
			if GetGlobalInt("n1data") < 100 then
				ObjectiveText = "Prevent data download."
			elseif GetGlobalInt("n1data") >= 100 and GetGlobalInt("n2data") < 100 then
				if EndGameClass then
					ObjectiveText = "Prevent data upload."
				end
			else
				ObjectiveText = ""
			end
		end
		
		if ply.IsSupplyDepot then
			ObjectiveText = "Destroy food crates and weapon caches."
		end
		
	end
	
	if ObjectiveText then
		YOffset = 20
	else
		YOffset = 0
	end

	if not input.LookupBinding("+menu") then
		QMenuKey = "NOT BOUND"
	else
		QMenuKey = string.upper(input.LookupBinding("+menu"))
	end
	
	
	if not input.LookupBinding("+menu_context") then
		CMenuKey = "NOT BOUND"
	else
		CMenuKey = string.upper(input.LookupBinding("+menu_context"))
	end
	
	if vm then
		local attachment = vm:GetAttachment("1")
	end
	
	if attachment then
		ply.attachment = attachment -- getting the attachment in a Think hook, because CalcView doesn't seem to like GetAttachment and pretty much breaks
	end
	
	if CurTime() > NextNotify and NextSound then
		surface.PlaySound(NextSound)
		NextSound = nil
	end
	
	if ply:Alive() then
		if ply.MaxHealth then
			if ply:Health() <= ply.MaxHealth * 0.35 then
				if CurTime() > HeartBeatTime then
					ply:EmitSound("ta/hbeat.mp3", 90, 100 + (100 - ply:Health()))
					HeartBeatTime = CurTime() + 0.2 + ply:Health() / 100
					Blur = 0.05
					RedAlpha = 80
				end
			end
		end
	end

	//for k, v in ipairs(player.GetAll()) do
	    local viewmodel = ply:GetViewModel()
		if viewmodel then
			if ply.Class == "Recon" and ply:GetDTInt(3) != 0 then
		
				ply:GetViewModel():SetColor(255, 255, 255, ply:GetDTInt(3))
			
				if ply:GetActiveWeapon().VElements then
					for k, v in pairs(ply:GetActiveWeapon().VElements) do
						if v.color.a != 0 and v != ply:GetActiveWeapon().VElements["aimpointdot"] and v != ply:GetActiveWeapon().VElements["eotechdot"] and v != ply:GetActiveWeapon().VElements["acogdot"] then
							v.color.a = ply:GetDTInt(3)
						
							if ply:GetDTInt(3) <= 20 then
								v.material = "ta/shader3_custom5"
							else
								if v == ply:GetActiveWeapon().VElements["silencer"] then
									v.material = "models/bunneh/silencer"
								else
									v.material = ""
								end
							end
						end
					end
				end
			
				if ply:GetDTInt(3) <= 20 then
					viewmodel:SetMaterial("ta/shader3_custom5")
				else
					viewmodel:SetMaterial("")
				end
			else
				viewmodel:SetColor( Color(255, 255, 255, 255) )
				viewmodel:SetMaterial("")
			end
		end
		
		for k, v in pairs(player.GetAll()) do
			if v:GetDTInt(3) != 0 then
				if v:GetActiveWeapon().WElements then
					for k2, v2 in pairs(v:GetActiveWeapon().WElements) do
						if v2.color.a != 0 then
							v2.color.a = v:GetDTInt(3)
							
							if v:GetDTInt(3) <= 20 then
								v2.material = "ta/shader3_custom5"
							else
								if v2 == v:GetActiveWeapon().WElements["silencer"] then
									v2.material = "models/bunneh/silencer"
								else
									v2.material = ""
								end
							end
						end
					end
				end
			end
		end
	//end
	
	if GetConVarNumber("mat_motion_blur_enabled") < 1 then
		RunConsoleCommand("mat_motion_blur_enabled", "1")
	end
end

// I was going to use realistic color mod and bloom (based on personal experience), but then a guy started bitching on how there's too much bloom and how it doesn't look realistic (even though it was identical to how it was in real life)

local Trees = {}

function TA_HelpMenu()
	local InitialDFrame = vgui.Create("DFrame")
	InitialDFrame:SetSize(800, 500)
	InitialDFrame:SetTitle("Green Shift Player Menu")
	InitialDFrame:SetVisible(true)
	InitialDFrame:SetDraggable(false)
	InitialDFrame:ShowCloseButton(true)
	InitialDFrame:SetBackgroundBlur(true)
	gui.EnableScreenClicker(true)
	InitialDFrame.Paint = function()
		surface.SetDrawColor(0, 150, 250, 255)
		surface.DrawOutlinedRect(0, 0, InitialDFrame:GetWide(), InitialDFrame:GetTall())
		
		surface.SetDrawColor(0, 0, 0, 220)
		surface.DrawRect(1, 1, InitialDFrame:GetWide() - 2, InitialDFrame:GetTall() - 2)
	end
	
	InitialDFrame:Center()
	InitialDFrame:MakePopup()
	InitialDFrame.btnClose.DoClick = function( ) 
		InitialDFrame:Close( ) 
		gui.EnableScreenClicker( false )
		RunConsoleCommand("ta_finishspawn")
	end
	
	local PropertySheet = vgui.Create("DPropertySheet")
	PropertySheet:SetParent(InitialDFrame)
	PropertySheet:SetPos(25, 30)
	PropertySheet:SetSize(InitialDFrame:GetWide() - 50, InitialDFrame:GetTall() - 60)
	
	local PanelList = vgui.Create("DPanelList")
	PanelList:SetParent(PropertySheet)
	PanelList:SetPos(0, 50)
	PanelList:SetAutoSize(true)
	PanelList:SetSpacing(7)
	PanelList:EnableHorizontal( false )
	PanelList:EnableVerticalScrollbar( true )
	
	local ply = LocalPlayer()

	local Option1 = vgui.Create("DCheckBoxLabel")
	Option1:SetText("MISC: Use old ACOG scope behavior?")
	Option1:SetConVar("ta_oldacog")
	Option1:SetValue(GetConVarNumber("ta_oldacog"))
	Option1:SizeToContents()
	PanelList:AddItem(Option1)
		
	local Option2 = vgui.Create("DCheckBoxLabel")
	Option2:SetText("MISC: Use different weapon origins?")
	Option2:SetConVar("ta_different_origins")
	Option2:SetValue(GetConVarNumber("ta_different_origins"))
	Option2:SizeToContents()
	PanelList:AddItem(Option2)
	
	local Option10 = vgui.Create("DCheckBoxLabel")
	Option10:SetText("MISC: Use hold-to-aim?")
	Option10:SetConVar("ta_hold_to_aim")
	Option10:SetValue(GetConVarNumber("ta_hold_to_aim"))
	Option10:SizeToContents()
	PanelList:AddItem(Option10)
		
	local Option3 = vgui.Create("DCheckBoxLabel")
	Option3:SetText("EFFECT: Use gunfire heat effect?")
	Option3:SetConVar("ta_ef_heat")
	Option3:SetValue(GetConVarNumber("ta_ef_heat"))
	Option3:SizeToContents()
	PanelList:AddItem(Option3)
		
	local Option4 = vgui.Create("DCheckBoxLabel")
	Option4:SetText("EFFECT: Use gunfire smoke effect?")
	Option4:SetConVar("ta_ef_smoke")
	Option4:SetValue(GetConVarNumber("ta_ef_smoke"))
	Option4:SizeToContents()
	PanelList:AddItem(Option4)
	
	local Option5 = vgui.Create("DCheckBoxLabel")
	Option5:SetText("EFFECT: Use additional muzzleflash effects?")
	Option5:SetConVar("ta_ef_extramuzzle")
	Option5:SetValue(GetConVarNumber("ta_ef_extramuzzle"))
	Option5:SizeToContents()
	PanelList:AddItem(Option5)
	
	local Option11 = vgui.Create("DCheckBoxLabel")
	Option11:SetText("EFFECT: Use sparks effect?")
	Option11:SetConVar("ta_ef_sparks")
	Option11:SetValue(GetConVarNumber("ta_ef_sparks"))
	Option11:SizeToContents()
	PanelList:AddItem(Option11)
	
	local Option7 = vgui.Create("DCheckBoxLabel")
	Option7:SetText("VIEWBOB: upon reload?")
	Option7:SetConVar("ta_viewbob_reload")
	Option7:SetValue(GetConVarNumber("ta_viewbob_reload"))
	Option7:SizeToContents()
	PanelList:AddItem(Option7)
	
	local Option8 = vgui.Create("DCheckBoxLabel")
	Option8:SetText("VIEWBOB: upon silencer attach/detach?")
	Option8:SetConVar("ta_viewbob_silencer")
	Option8:SetValue(GetConVarNumber("ta_viewbob_silencer"))
	Option8:SizeToContents()
	PanelList:AddItem(Option8)
	
	local Option9 = vgui.Create("DCheckBoxLabel")
	Option9:SetText("VIEWBOB: upon draw?")
	Option9:SetConVar("ta_viewbob_draw")
	Option9:SetValue(GetConVarNumber("ta_viewbob_draw"))
	Option9:SizeToContents()
	PanelList:AddItem(Option9)
	
	local Option6 = vgui.Create("DNumSlider")
	Option6:SetWide(250)
	Option6:SetMinMax(0.005, 0.02)
	Option6:SetDecimals(3)
	Option6:SetText("Mouse aim sensitivity")
	Option6:SetConVar("ta_aim_sensitivity")
	Option6:SetValue(GetConVarNumber("ta_aim_sensitivity"))
	Option6:SizeToContents()
	PanelList:AddItem(Option6)
	
	local PAList = vgui.Create("DPanelList")
	PAList:SetParent(PropertySheet)
	PAList:SetAutoSize(false)
	PAList:SetSpacing(8)
	PAList:EnableHorizontal(false)
	PAList:EnableVerticalScrollbar(true)
	
	local FakePAList = vgui.Create("Panel", PAList)
	FakePAList:SetSize(500, 700)
	
	local PAButton = vgui.Create("DButton", FakePAList)
	PAButton:SetPos(5, 5)
	PAButton:SetText("Deselect")
	PAButton:SetSize(80, 18)
		
	PAButton.DoClick = function()
		RunConsoleCommand("ta_personalattribute", 0)
		surface.PlaySound("buttons/button14.wav")
		GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
		return true
	end
	
	for k, v in pairs(personalAttributes) do
	
		local POutline = vgui.Create("DOutline", FakePAList)
		POutline:SetMouseInputEnabled(false)
		POutline:SetPos(1, 28 + ((k - 1) * 80))
		POutline:SetSize(310, 80)
		POutline.color = Color(0, 150, 255, 255)
		
		local PAName = vgui.Create("DLabel", FakePAList)
		PAName:SetSize(300, 20)
		PAName:SetPos(5, (80 * (k - 1) + 30))
		PAName:SetText(v.name)
		
		local PATextGood = vgui.Create("DLabel", FakePAList)
		PATextGood:SetSize(300, 20)
		PATextGood:SetPos(5, (80 * (k - 1)) + 50)
		PATextGood:SetText(v.good)
		PATextGood:SetTextColor(Color(0, 150, 250, 255))
		
		local PATextBad = vgui.Create("DLabel", FakePAList)
		PATextBad:SetSize(300, 20)
		PATextBad:SetPos(5, (80 * (k - 1)) + 65)
		PATextBad:SetText(v.bad)
		PATextBad:SetTextColor(Color(255, 0, 0, 255))
		
		local PAButton = vgui.Create("DButton", FakePAList)
		PAButton:SetPos(5, (80 * (k - 1) + 85))
		PAButton:SetText("Select")
		PAButton:SetSize(80, 18)
		
		PAButton.DoClick = function()
			RunConsoleCommand("ta_personalattribute", v.concommandnum)
			surface.PlaySound("buttons/button14.wav")
			GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
			return true
		end
	end
	
	PAList:AddItem(FakePAList)
	
	local UNList = vgui.Create("DPanelList")
	UNList:SetParent(PropertySheet)
	UNList:SetAutoSize(false)
	UNList:SetSpacing(8)
	UNList:EnableHorizontal(false)
	UNList:EnableVerticalScrollbar(true)
	
	local FakeUNList = vgui.Create("Panel", UNList)
	FakeUNList:SetSize(500, 475)
	
	local UNOutline = vgui.Create("DOutline", FakeUNList)
	UNOutline:SetMouseInputEnabled(false)
	UNOutline:SetPos(1, 3)
	UNOutline:SetSize(320, 60)
	UNOutline.color = Color(0, 150, 255, 255)
	
	local ply = LocalPlayer()
	local Level = ply.Level or 0
	local SkillPoints = ply.SkillPoints or 0
	local XP = ply.Exp or 0
	local RequiredExp = ply.RequiredExp or 0
	
	local UNLevel = vgui.Create("DLabel", FakeUNList)
	UNLevel:SetPos(5, 5)
	UNLevel:SetSize(200, 20)
	UNLevel:SetText("Level " .. Level)
	
	local UNSP = vgui.Create("DLabel", FakeUNList)
	UNSP:SetPos(5, 20)
	UNSP:SetSize(200, 20)
	UNSP:SetText("Skill points: " .. SkillPoints)
	UNSP:SetTextColor(Color(255, 185, 0, 255))
	
	SkillPoint = UNSP
	
	local UNExp = vgui.Create("DProgressBar", FakeUNList)
	UNExp:SetPos(3, 40)
	UNExp:SetSize(300, 18)
	UNExp:SetMin(0)
	UNExp:SetMax(RequiredExp)
	UNExp:SetValue(XP)
	
	local UNOutlineWarning = vgui.Create("DOutline", FakeUNList)
	UNOutlineWarning:SetMouseInputEnabled(false)
	UNOutlineWarning:SetPos(1, 70)
	UNOutlineWarning:SetSize(450, 40)
	UNOutlineWarning.color = Color(0, 150, 255, 255)
	
	local UNWarningText = vgui.Create("DLabel", FakeUNList)
	UNWarningText:SetPos(5, 75)
	UNWarningText:SetSize(200, 20)
	UNWarningText:SetText([[Think before you spend your skill points.
The only way to re-align them, is to press the "Reset All" button and re-start from Level 0.]])
	UNWarningText:SetTextColor(Color(255, 0, 0, 255))
	UNWarningText:SizeToContents()
	
	for k, v in pairs(perksText) do
		local UNOutline = vgui.Create("DOutline", FakeUNList)
		UNOutline:SetMouseInputEnabled(false)
		UNOutline:SetPos(1, 120 + (v.textTree - 1) * 80)
		UNOutline:SetSize(350, 70)
		UNOutline.color = Color(0, 150, 255, 255)
		
		local UNText = vgui.Create("DLabel", FakeUNList)
		UNText:SetPos(5, 120 + (v.textTree - 1) * 80)
		UNText:SetSize(200, 20)
		UNText:SetText(v.text)
	end
	
	for k, v in pairs(perks) do
		local UNST = vgui.Create("GSSkillTree", FakeUNList)
		UNST:SetPos(5 + v.row * 64, 140 + (v.tree - 1) * 80 + v.Yoffset)
		UNST:SetSize(400, 100)
		UNST.W = 32
		UNST.H = 32
		UNST.OutlineColor = Color(0, 150, 250, 255)
		UNST.InlineColor = Color(0, 0, 0, 150)
		UNST.OutlineColorTextbox = Color(0, 150, 250, 255)
		UNST.InlineColorTextbox = Color(0, 0, 0, 150)
		UNST.PerkName = v.name
		UNST.Availability = v.availability
		UNST.Effect = v.effect
		UNST.Yoffset = v.Yoffset
		UNST.DrawLine = v.drawLine
		UNST.Unlocked = v.unlocked
		UNST.Number = v.number
		table.insert(Trees, {TreeTable = UNST})
	end
	
	local UNResetAll = vgui.Create("DButton", FakeUNList)
	UNResetAll:SetPos(222, 20)
	UNResetAll:SetSize(80, 18)
	UNResetAll:SetText("Reset All")
	UNResetAll.DoClick = function()
		RunConsoleCommand("ta_resetstats")
		surface.PlaySound("buttons/button14.wav")
		GAMEMODE:AddNotify("Stats are reset. The removal of skill effects should be present upon respawn.", NOTIFY_HINT, 7)		
		chat.AddText(Color(255, 255, 255), "Stats are reset. The removal of skill effects should be present upon respawn.")
		
		UNExp:SetValue(0)
		UNExp:SetMax(1000)
		UNSP:SetText("Skill points: 0")
		UNLevel:SetText("Level 0")
		local ply = LocalPlayer()
		ply.Level = 0
		ply.SkillPoints = 0
		ply.RequiredExp = 1000
		ply.Exp = 0
		
		if Trees then
			print("dick")
			for k, v in pairs(Trees) do
				if IsValid(v.TreeTable) then
					v.TreeTable.Unlocked = false
				end
			end
		end
		
		for k, v in pairs(perks) do
			v.unlocked = false
		end
	end
	
	/*for k, v in pairs(unlockables) do
		local UNOutline = vgui.Create("DOutline", FakeUNList)
		UNOutline:SetMouseInputEnabled(false)
		UNOutline:SetPos(1, 1 + ((k - 1) * 80))
		UNOutline:SetSize(350, 80)
		UNOutline.color = Color(0, 150, 255, 255)
	
		local UNName = vgui.Create("DLabel", FakeUNList)
		UNName:SetSize(200, 20)
		UNName:SetPos(5, 80 * (k - 1) + 5)
		UNName:SetText(v.name)
		
		local UNRequired = vgui.Create("DLabel", FakeUNList)
		UNRequired:SetSize(200, 20)
		UNRequired:SetPos(5, 80 * (k - 1) + 20)
		UNRequired:SetTextColor(Color(255, 185, 0, 255))
		UNRequired:SetText(v.required)
		
		local UNEffect = vgui.Create("DLabel", FakeUNList)
		UNEffect:SetSize(350, 20)
		UNEffect:SetPos(5, 80 * (k - 1) + 35)
		UNEffect:SetTextColor(Color(0, 150, 250, 255))
		UNEffect:SetText(v.effect)
		
		local UNProgressBar = vgui.Create("DProgressBar", FakeUNList)
		UNProgressBar:SetSize(300, 15)
		UNProgressBar:SetPos(3, 80 * (k - 1) + 55)
		UNProgressBar:SetMin(0)
		UNProgressBar:SetMax(v.max)
		UNProgressBar:SetValue(v.progress)
	end*/
	
	UNList:AddItem(FakeUNList)
		
		local PropertySheet2 = vgui.Create("DPropertySheet")
		PropertySheet2:SetParent(InitialDFrame)
		PropertySheet2:SetSize(InitialDFrame:GetWide() - 50, InitialDFrame:GetTall() - 60)
		
		local PropertySheet3 = vgui.Create("DPropertySheet")
		PropertySheet3:SetParent(InitialDFrame)
		PropertySheet3:SetSize(InitialDFrame:GetWide() - 70, InitialDFrame:GetTall() - 80)
		
		local PropertySheet3B = vgui.Create("DPropertySheet")
		PropertySheet3B:SetParent(InitialDFrame)
		PropertySheet3B:SetSize(InitialDFrame:GetWide() - 70, InitialDFrame:GetTall() - 80)
		
		local WeaponList = vgui.Create("DPanelList")
		WeaponList:SetParent(PropertySheet3)
		WeaponList:SetAutoSize(false)
		WeaponList:SetSpacing(8)
		WeaponList:EnableHorizontal(false)
		WeaponList:EnableVerticalScrollbar(true)
		
		local FakeWeaponList = vgui.Create("Panel", WeaponList)
		FakeWeaponList:SetSize(500, 300)
		
		for k, v in ipairs(lsmgs) do
			local weaponmodel = vgui.Create("DModelPanel", FakeWeaponList)
			weaponmodel:SetModel(v.model)
			weaponmodel:SetPos(5, v.ypos + 5)
			weaponmodel:SetSize(128, 64)
			weaponmodel.PaintOver = function()
				surface.SetDrawColor(0, 150, 250, 255)
				surface.DrawOutlinedRect(0, 0, 128, 64)
			end
				
			function weaponmodel:CenterView()
				local PrevMins, PrevMaxs = self.Entity:GetRenderBounds()
				self:SetCamPos(PrevMins:Distance(PrevMaxs)*Vector(0.75, 0.75, 0.5))
				self:SetLookAt((PrevMaxs + PrevMins) / 2)
			end
			
			weaponmodel:CenterView()
			
			weaponmodel.LayoutEntity = function()
			end
				
			local weapontext = vgui.Create("DLabel", FakeWeaponList)
			weapontext:SetSize(200, 70)
			weapontext:SetPos(144, v.ypos + 5)
			weapontext:SetText(v.weaponname .. [[
				
			Damage:
			Accuracy:
			ROF:
			]])
			weapontext.Paint = function()
				
				surface.SetDrawColor(50, 100, 50, 255)
				surface.DrawRect(60, 17, 100, 10)
				surface.DrawRect(60, 30, 100, 10)
				surface.DrawRect(60, 43, 100, 10)
				
				local Red = (100 - v.damage) * 2.55
				local Green = v.damage * 2.55
					
				surface.SetDrawColor(Red, Green, 0, 255)
				surface.DrawRect(61, 18, v.damage, 8)
					
				local Red = (100 - v.accuracy) * 2.55
				local Green = v.accuracy * 2.55
					
				surface.SetDrawColor(Red, Green, 0, 255)
				surface.DrawRect(61, 31, v.accuracy, 8)
					
				local Red = (100 - v.rof) * 2.55
				local Green = v.rof * 2.55
					
				surface.SetDrawColor(Red, Green, 0, 255)
				surface.DrawRect(61, 44, v.rof, 8)
			end
				
			local weapontext2 = vgui.Create("DLabel", FakeWeaponList)
			weapontext2:SetSize(200, 70)
			weapontext2:SetPos(10, v.ypos + 45)
			weapontext2:SetText(v.mags .. "x" .. v.clipsize .. " mags in reserve")
				
			local weapontext3 = vgui.Create("DLabel", FakeWeaponList)
			weapontext3:SetSize(200, 70)
			weapontext3:SetPos(319, v.ypos + 5)
			weapontext3:SetText([[
			
			Stability:
			Mobility:
			]])
			weapontext3.Paint = function()
				surface.SetDrawColor(50, 100, 50, 255)
				surface.DrawRect(60, 24, 100, 10)
				surface.DrawRect(60, 38, 100, 10)
				
				local Red = (100 - v.stability) * 2.55
				local Green = v.stability * 2.55
					
				surface.SetDrawColor(Red, Green, 0, 255)
				surface.DrawRect(61, 25, v.stability, 8)
					
				local Red = (100 - v.mobility) * 2.55
				local Green = v.mobility * 2.55
					
				surface.SetDrawColor(Red, Green, 0, 255)
				surface.DrawRect(61, 39, v.mobility, 8)
			end
				
			local weaponbutton = vgui.Create("DButton", FakeWeaponList)
			weaponbutton:SetPos(514, v.ypos + 33)
			weaponbutton:SetSize(60, 16)
			weaponbutton:SetText("Equip")
			weaponbutton.DoClick = function()
				RunConsoleCommand("ta_weapon_primary", v.concommandnum)
				surface.PlaySound("buttons/button14.wav")
				GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
				return true
			end
		end
		
		WeaponList:AddItem(FakeWeaponList)
		
		if ply.Class == "Engineer" or ply.Class == "Assault" then
			local WeaponListShot = vgui.Create("DPanelList")
			WeaponListShot:SetParent(PropertySheet3)
			WeaponListShot:SetAutoSize(false)
			WeaponListShot:SetSpacing(8)
			WeaponListShot:EnableHorizontal(false)
			WeaponListShot:EnableVerticalScrollbar(true)
			
			local FakeWeaponList = vgui.Create("Panel", WeaponListShot)
			FakeWeaponList:SetSize(500, 300)
			
			for k, v in ipairs(shotguns) do
				local weaponmodel = vgui.Create("DModelPanel", FakeWeaponList)
				weaponmodel:SetModel(v.model)
				weaponmodel:SetPos(5, v.ypos + 5)
				weaponmodel:SetSize(128, 64)
				weaponmodel.PaintOver = function()
					surface.SetDrawColor(0, 150, 250, 255)
					surface.DrawOutlinedRect(0, 0, 128, 64)
				end
					
				function weaponmodel:CenterView()
					local PrevMins, PrevMaxs = self.Entity:GetRenderBounds()
					self:SetCamPos(PrevMins:Distance(PrevMaxs)*Vector(0.75, 0.75, 0.5))
					self:SetLookAt((PrevMaxs + PrevMins) / 2)
				end
				
				weaponmodel:CenterView()
				
				weaponmodel.LayoutEntity = function()
				end
					
				local weapontext = vgui.Create("DLabel", FakeWeaponList)
				weapontext:SetSize(200, 70)
				weapontext:SetPos(144, v.ypos + 5)
				weapontext:SetText(v.weaponname .. [[
					
				Damage:
				Accuracy:
				ROF:
				]])
				weapontext.Paint = function()
					
					surface.SetDrawColor(50, 100, 50, 255)
					surface.DrawRect(60, 17, 100, 10)
					surface.DrawRect(60, 30, 100, 10)
					surface.DrawRect(60, 43, 100, 10)
					
					local Red = (100 - v.damage) * 2.55
					local Green = v.damage * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 18, v.damage, 8)
						
					local Red = (100 - v.accuracy) * 2.55
					local Green = v.accuracy * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 31, v.accuracy, 8)
						
					local Red = (100 - v.rof) * 2.55
					local Green = v.rof * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 44, v.rof, 8)
				end
					
				local weapontext2 = vgui.Create("DLabel", FakeWeaponList)
				weapontext2:SetSize(250, 70)
				weapontext2:SetPos(10, v.ypos + 45)
				weapontext2:SetText(v.mags .. " shells in reserve. Loading tube size: " .. v.clipsize .. " shells.")
					
				local weapontext3 = vgui.Create("DLabel", FakeWeaponList)
				weapontext3:SetSize(200, 70)
				weapontext3:SetPos(319, v.ypos + 5)
				weapontext3:SetText([[
				
				Stability:
				Mobility:
				]])
				weapontext3.Paint = function()
					surface.SetDrawColor(50, 100, 50, 255)
					surface.DrawRect(60, 24, 100, 10)
					surface.DrawRect(60, 38, 100, 10)
					
					local Red = (100 - v.stability) * 2.55
					local Green = v.stability * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 25, v.stability, 8)
						
					local Red = (100 - v.mobility) * 2.55
					local Green = v.mobility * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 39, v.mobility, 8)
				end
					
				local weaponbutton = vgui.Create("DButton", FakeWeaponList)
				weaponbutton:SetPos(514, v.ypos + 33)
				weaponbutton:SetSize(60, 16)
				weaponbutton:SetText("Equip")
				weaponbutton.DoClick = function()
					RunConsoleCommand("ta_weapon_primary", v.concommandnum)
					surface.PlaySound("buttons/button14.wav")
					GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
					return true
				end
				
			end
			
			WeaponListShot:AddItem(FakeWeaponList)
			PropertySheet3:AddSheet("Shotguns", WeaponListShot, "ta/weapon_shotgun", false, false, "Highest damage, low accuracy, varying firerate." )
		end
		
		local WeaponListSMG = vgui.Create("DPanelList")
		WeaponListSMG:SetParent(PropertySheet3)
		WeaponListSMG:SetAutoSize(false)
		WeaponListSMG:SetSpacing(8)
		WeaponListSMG:EnableHorizontal(false)
		WeaponListSMG:EnableVerticalScrollbar(true)
			
		local FakeWeaponList = vgui.Create("Panel", WeaponListSMG)
		FakeWeaponList:SetSize(500, 300)
			
		for k, v in ipairs(smgs) do
			local weaponmodel = vgui.Create("DModelPanel", FakeWeaponList)
			weaponmodel:SetModel(v.model)
			weaponmodel:SetPos(5, v.ypos + 5)
			weaponmodel:SetSize(128, 64)
			weaponmodel.PaintOver = function()
				surface.SetDrawColor(0, 150, 250, 255)
				surface.DrawOutlinedRect(0, 0, 128, 64)
			end
					
			function weaponmodel:CenterView()
				local PrevMins, PrevMaxs = self.Entity:GetRenderBounds()
				self:SetCamPos(PrevMins:Distance(PrevMaxs)*Vector(0.75, 0.75, 0.5))
				self:SetLookAt((PrevMaxs + PrevMins) / 2)
			end
				
			weaponmodel:CenterView()
			
			weaponmodel.LayoutEntity = function()
			end
					
			local weapontext = vgui.Create("DLabel", FakeWeaponList)
			weapontext:SetSize(200, 70)
			weapontext:SetPos(144, v.ypos + 5)
			weapontext:SetText(v.weaponname .. [[
					
			Damage:
			Accuracy:
			ROF:
			]])
			weapontext.Paint = function()
				
				surface.SetDrawColor(50, 100, 50, 255)
				surface.DrawRect(60, 17, 100, 10)
				surface.DrawRect(60, 30, 100, 10)
				surface.DrawRect(60, 43, 100, 10)
					
				local Red = (100 - v.damage) * 2.55
				local Green = v.damage * 2.55
						
				surface.SetDrawColor(Red, Green, 0, 255)
				surface.DrawRect(61, 18, v.damage, 8)
						
				local Red = (100 - v.accuracy) * 2.55
				local Green = v.accuracy * 2.55
						
				surface.SetDrawColor(Red, Green, 0, 255)
				surface.DrawRect(61, 31, v.accuracy, 8)
						
				local Red = (100 - v.rof) * 2.55
				local Green = v.rof * 2.55
						
				surface.SetDrawColor(Red, Green, 0, 255)
				surface.DrawRect(61, 44, v.rof, 8)
			end
					
			local weapontext2 = vgui.Create("DLabel", FakeWeaponList)
			weapontext2:SetSize(200, 70)
			weapontext2:SetPos(10, v.ypos + 45)
			weapontext2:SetText(v.mags .. "x" .. v.clipsize .. " mags in reserve")
					
			local weapontext3 = vgui.Create("DLabel", FakeWeaponList)
			weapontext3:SetSize(200, 70)
			weapontext3:SetPos(319, v.ypos + 5)
			weapontext3:SetText([[
				
			Stability:
			Mobility:
			]])
			weapontext3.Paint = function()
				surface.SetDrawColor(50, 100, 50, 255)
				surface.DrawRect(60, 24, 100, 10)
				surface.DrawRect(60, 38, 100, 10)
					
				local Red = (100 - v.stability) * 2.55
				local Green = v.stability * 2.55
						
				surface.SetDrawColor(Red, Green, 0, 255)
				surface.DrawRect(61, 25, v.stability, 8)
						
				local Red = (100 - v.mobility) * 2.55
				local Green = v.mobility * 2.55
						
				surface.SetDrawColor(Red, Green, 0, 255)
				surface.DrawRect(61, 39, v.mobility, 8)
			end
					
			local weaponbutton = vgui.Create("DButton", FakeWeaponList)
			weaponbutton:SetPos(514, v.ypos + 33)
			weaponbutton:SetSize(60, 16)
			weaponbutton:SetText("Equip")
			weaponbutton.DoClick = function()
				RunConsoleCommand("ta_weapon_primary", v.concommandnum)
				surface.PlaySound("buttons/button14.wav")
				GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
				return true
			end
				
		end
			
		WeaponListSMG:AddItem(FakeWeaponList)
		PropertySheet3:AddSheet("SMGs", WeaponListSMG, "ta/weapon_smg", false, false, "Medium damage, varying firerate, medium accuracy." )
						
		local WeaponListPistol = vgui.Create("DPanelList")
		WeaponListPistol:SetParent(PropertySheet3B)
		WeaponListPistol:SetAutoSize(false)
		WeaponListPistol:SetSpacing(8)
		WeaponListPistol:EnableHorizontal(false)
		WeaponListPistol:EnableVerticalScrollbar(true)
		
		local FakeWeaponList = vgui.Create("Panel", WeaponListPistol)
		FakeWeaponList:SetSize(500, 630)
		
		for k, v in ipairs(secweapons) do
				local weaponmodel = vgui.Create("DModelPanel", FakeWeaponList)
				weaponmodel:SetModel(v.model)
				weaponmodel:SetPos(5, v.ypos + 5)
				weaponmodel:SetSize(128, 64)
				weaponmodel.PaintOver = function()
					surface.SetDrawColor(0, 150, 250, 255)
					surface.DrawOutlinedRect(0, 0, 128, 64)
				end
					
				function weaponmodel:CenterView()
					local PrevMins, PrevMaxs = self.Entity:GetRenderBounds()
					self:SetCamPos(PrevMins:Distance(PrevMaxs)*Vector(0.75, 0.75, 0.5))
					self:SetLookAt((PrevMaxs + PrevMins) / 2)
				end
				
				weaponmodel:CenterView()
				
				weaponmodel.LayoutEntity = function()
				end
					
				local weapontext = vgui.Create("DLabel", FakeWeaponList)
				weapontext:SetSize(200, 70)
				weapontext:SetPos(144, v.ypos + 5)
				weapontext:SetText(v.weaponname .. [[
					
				Damage:
				Accuracy:
				ROF:
				]])
				weapontext.Paint = function()
					
					surface.SetDrawColor(50, 100, 50, 255)
					surface.DrawRect(60, 17, 100, 10)
					surface.DrawRect(60, 30, 100, 10)
					surface.DrawRect(60, 43, 100, 10)
					
					local Red = (100 - v.damage) * 2.55
					local Green = v.damage * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 18, v.damage, 8)
						
					local Red = (100 - v.accuracy) * 2.55
					local Green = v.accuracy * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 31, v.accuracy, 8)
						
					local Red = (100 - v.rof) * 2.55
					local Green = v.rof * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 44, v.rof, 8)
				end
					
				local weapontext2 = vgui.Create("DLabel", FakeWeaponList)
				weapontext2:SetSize(200, 70)
				weapontext2:SetPos(10, v.ypos + 45)
				weapontext2:SetText(v.mags .. "x" .. v.clipsize .. " mags in reserve")
					
				local weapontext3 = vgui.Create("DLabel", FakeWeaponList)
				weapontext3:SetSize(200, 70)
				weapontext3:SetPos(319, v.ypos + 5)
				weapontext3:SetText([[
				
				Stability:
				Mobility:
				]])
				weapontext3.Paint = function()
					surface.SetDrawColor(50, 100, 50, 255)
					surface.DrawRect(60, 24, 100, 10)
					surface.DrawRect(60, 38, 100, 10)
					
					local Red = (100 - v.stability) * 2.55
					local Green = v.stability * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 25, v.stability, 8)
						
					local Red = (100 - v.mobility) * 2.55
					local Green = v.mobility * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 39, v.mobility, 8)
				end
					
				local weaponbutton = vgui.Create("DButton", FakeWeaponList)
				weaponbutton:SetPos(514, v.ypos + 33)
				weaponbutton:SetSize(60, 16)
				weaponbutton:SetText("Equip")
				weaponbutton.DoClick = function()
					RunConsoleCommand("ta_weapon_secondary", v.concommandnum)
					surface.PlaySound("buttons/button14.wav")
					GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
					return true
				end

		end
		
		WeaponListPistol:AddItem(FakeWeaponList)
		PropertySheet3B:AddSheet("Pistols", WeaponListPistol, "ta/weapon_pistol", false, false, "Various equipment." )
		
		local AttachmentList = vgui.Create("DPanelList")
		AttachmentList:SetParent(PropertySheet3B)
		AttachmentList:SetAutoSize(false)
		AttachmentList:SetSpacing(8)
		AttachmentList:EnableHorizontal(false)
		AttachmentList:EnableVerticalScrollbar(true)
		
		local FakeAttachmentList = vgui.Create("Panel", AttachmentList)
		FakeAttachmentList:SetSize(600, 300)
		
		local atttext
		
		if GetConVarNumber("ta_weapon_secondary_attachment") == 2 then
			atttext = "Attachment (Trijicon ACOG Scope)"
		elseif GetConVarNumber("ta_weapon_secondary_attachment") == 9 then
			atttext = "Attachment (Doctor red-dot sight)"
		else
			atttext = "Attachment"
		end
		
		local attone = vgui.Create("DLabel", FakeAttachmentList)
		attone:SetSize(405, 18)
		attone:SetPos(5, 3)
		attone:SetText(atttext)
		attone.Paint = function()
			surface.SetDrawColor(255, 255, 0, 255)
			surface.DrawRect(0, 16, 400, 2)
		end
		
		local noattachment = vgui.Create("DButton", FakeAttachmentList)
		noattachment:SetSize(100, 20)
		noattachment:SetPos(5, 40)
		noattachment:SetText("No attachments")
		noattachment.DoClick = function()
			attone:SetText("Attachment")
			RunConsoleCommand("ta_weapon_secondary_attachment", 0)
			surface.PlaySound("buttons/button14.wav")
			GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
		end
		
		for k, v in ipairs(secattachments) do
			local Allowed = false
		
			local attachmenticon = vgui.Create("DModelPanel", FakeAttachmentList)
			attachmenticon:SetModel(v.model)
			attachmenticon:SetPos(5, v.ypos + 70)
			attachmenticon:SetSize(128, 64)
			attachmenticon.PaintOver = function()
				surface.SetDrawColor(0, 150, 250, 255)
				surface.DrawOutlinedRect(0, 0, 128, 64)
			end
				
			function attachmenticon:CenterView()
				local PrevMins, PrevMaxs = self.Entity:GetRenderBounds()
				self:SetCamPos(PrevMins:Distance(PrevMaxs)*Vector(0.75, 0.75, 0.5))
				self:SetLookAt((PrevMaxs + PrevMins) / 2)
			end
			
			attachmenticon:CenterView()
			
			attachmenticon.LayoutEntity = function()
			end
			
			local attachmentbutton = vgui.Create("DButton", FakeAttachmentList)
			attachmentbutton:SetPos(7, v.ypos + 139)
			attachmentbutton:SetSize(60, 16)
			attachmentbutton:SetText("Equip")
			attachmentbutton.DoClick = function()
				local wepnum = GetConVarNumber("ta_weapon_secondary")
				
				for k2, v2 in pairs(v.restricted) do
				
					if v2 != wepnum then
						Allowed = true
					else
						Allowed = false
						break
					end
				
				end
				
				if Allowed then
					RunConsoleCommand(v.concom, v.concommandnum)
					surface.PlaySound("buttons/button14.wav")
					attone:SetText("Attachment (" .. v.attachmentname .. ")")
					GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
				else
					surface.PlaySound("buttons/button10.wav")
				end
				
				return true
			end
			
			local attachmentname = vgui.Create("DLabel", FakeAttachmentList)
			attachmentname:SetSize(350, 20)
			attachmentname:SetPos(144, v.ypos + 70)
			attachmentname:SetText(v.attachmentname)
			
			local attachmenttextgood = vgui.Create("DLabel", FakeAttachmentList)
			attachmenttextgood:SetSize(600, 20)
			attachmenttextgood:SetPos(144, v.ypos + 90)
			attachmenttextgood:SetTextColor(Color(0, 150, 250, 255))
			attachmenttextgood:SetText(v.textgood)
			
			local attachmenttextbad = vgui.Create("DLabel", FakeAttachmentList)
			attachmenttextbad:SetSize(600, 20)
			attachmenttextbad:SetPos(144, v.ypos + 110)
			attachmenttextbad:SetTextColor(Color(255, 0, 0, 255))
			attachmenttextbad:SetText(v.textbad)
		end
		
		AttachmentList:AddItem(FakeAttachmentList)
		PropertySheet3B:AddSheet("Attachments", AttachmentList, "ta/weapon_attachment", false, false, "Attachments.")
		
		if ply.Class == "Medic" or ply.Class == "Assault" then
			local WeaponListAR = vgui.Create("DPanelList")
			WeaponListAR:SetParent(PropertySheet3)
			WeaponListAR:SetAutoSize(false)
			WeaponListAR:SetSpacing(8)
			WeaponListAR:EnableHorizontal(false)
			WeaponListAR:EnableVerticalScrollbar(true)
			
			local FakeWeaponList = vgui.Create("Panel", WeaponListAR)
			FakeWeaponList:SetSize(500, 990)
			
			for k, v in ipairs(ars) do
				local weaponmodel = vgui.Create("DModelPanel", FakeWeaponList)
				weaponmodel:SetModel(v.model)
				weaponmodel:SetPos(5, v.ypos + 5)
				weaponmodel:SetSize(128, 64)
				weaponmodel.PaintOver = function()
					surface.SetDrawColor(0, 150, 250, 255)
					surface.DrawOutlinedRect(0, 0, 128, 64)
				end
					
				function weaponmodel:CenterView()
					local PrevMins, PrevMaxs = self.Entity:GetRenderBounds()
					self:SetCamPos(PrevMins:Distance(PrevMaxs)*Vector(0.75, 0.75, 0.5))
					self:SetLookAt((PrevMaxs + PrevMins) / 2)
				end
				
				weaponmodel:CenterView()
				
				weaponmodel.LayoutEntity = function()
				end
					
				local weapontext = vgui.Create("DLabel", FakeWeaponList)
				weapontext:SetSize(200, 70)
				weapontext:SetPos(144, v.ypos + 5)
				weapontext:SetText(v.weaponname .. [[
					
				Damage:
				Accuracy:
				ROF:
				]])
				weapontext.Paint = function()
					
					surface.SetDrawColor(50, 100, 50, 255)
					surface.DrawRect(60, 17, 100, 10)
					surface.DrawRect(60, 30, 100, 10)
					surface.DrawRect(60, 43, 100, 10)
					
					local Red = (100 - v.damage) * 2.55
					local Green = v.damage * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 18, v.damage, 8)
						
					local Red = (100 - v.accuracy) * 2.55
					local Green = v.accuracy * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 31, v.accuracy, 8)
						
					local Red = (100 - v.rof) * 2.55
					local Green = v.rof * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 44, v.rof, 8)
				end
					
				local weapontext2 = vgui.Create("DLabel", FakeWeaponList)
				weapontext2:SetSize(200, 70)
				weapontext2:SetPos(10, v.ypos + 45)
				weapontext2:SetText(v.mags .. "x" .. v.clipsize .. " mags in reserve")
					
				local weapontext3 = vgui.Create("DLabel", FakeWeaponList)
				weapontext3:SetSize(200, 70)
				weapontext3:SetPos(319, v.ypos + 5)
				weapontext3:SetText([[
				
				Stability:
				Mobility:
				]])
				weapontext3.Paint = function()
					surface.SetDrawColor(50, 100, 50, 255)
					surface.DrawRect(60, 24, 100, 10)
					surface.DrawRect(60, 38, 100, 10)
					
					local Red = (100 - v.stability) * 2.55
					local Green = v.stability * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 25, v.stability, 8)
						
					local Red = (100 - v.mobility) * 2.55
					local Green = v.mobility * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 39, v.mobility, 8)
				end
					
				local weaponbutton = vgui.Create("DButton", FakeWeaponList)
				weaponbutton:SetPos(514, v.ypos + 33)
				weaponbutton:SetSize(60, 16)
				weaponbutton:SetText("Equip")
				weaponbutton.DoClick = function()
					RunConsoleCommand("ta_weapon_primary", v.concommandnum)
					surface.PlaySound("buttons/button14.wav")
					GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
					return true
				end

			end
			
			WeaponListAR:AddItem(FakeWeaponList)
			PropertySheet3:AddSheet("Assault Rifles", WeaponListAR, "ta/weapon_assaultrifle", false, false, "High damage, high accuracy, varying firerate." )
			
			local WeaponListLMG = vgui.Create("DPanelList")
			WeaponListLMG:SetParent(PropertySheet3)
			WeaponListLMG:SetAutoSize(false)
			WeaponListLMG:SetSpacing(8)
			WeaponListLMG:EnableHorizontal(false)
			WeaponListLMG:EnableVerticalScrollbar(true)
			
			local FakeWeaponList = vgui.Create("Panel", WeaponListLMG)
			FakeWeaponList:SetSize(500, 200)
			
			for k, v in ipairs(lmgs) do
				local weaponmodel = vgui.Create("DModelPanel", FakeWeaponList)
				weaponmodel:SetModel(v.model)
				weaponmodel:SetPos(5, v.ypos + 5)
				weaponmodel:SetSize(128, 64)
				weaponmodel.PaintOver = function()
					surface.SetDrawColor(0, 150, 250, 255)
					surface.DrawOutlinedRect(0, 0, 128, 64)
				end
					
				function weaponmodel:CenterView()
					local PrevMins, PrevMaxs = self.Entity:GetRenderBounds()
					self:SetCamPos(PrevMins:Distance(PrevMaxs)*Vector(0.75, 0.75, 0.5))
					self:SetLookAt((PrevMaxs + PrevMins) / 2)
				end
				
				weaponmodel:CenterView()
				
				weaponmodel.LayoutEntity = function()
				end
					
				local weapontext = vgui.Create("DLabel", FakeWeaponList)
				weapontext:SetSize(200, 70)
				weapontext:SetPos(144, v.ypos + 5)
				weapontext:SetText(v.weaponname .. [[
					
				Damage:
				Accuracy:
				ROF:
				]])
				weapontext.Paint = function()
					
					surface.SetDrawColor(50, 100, 50, 255)
					surface.DrawRect(60, 17, 100, 10)
					surface.DrawRect(60, 30, 100, 10)
					surface.DrawRect(60, 43, 100, 10)
					
					local Red = (100 - v.damage) * 2.55
					local Green = v.damage * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 18, v.damage, 8)
						
					local Red = (100 - v.accuracy) * 2.55
					local Green = v.accuracy * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 31, v.accuracy, 8)
						
					local Red = (100 - v.rof) * 2.55
					local Green = v.rof * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 44, v.rof, 8)
				end
					
				local weapontext2 = vgui.Create("DLabel", FakeWeaponList)
				weapontext2:SetSize(200, 70)
				weapontext2:SetPos(10, v.ypos + 45)
				weapontext2:SetText(v.mags .. "x" .. v.clipsize .. " mags in reserve")
					
				local weapontext3 = vgui.Create("DLabel", FakeWeaponList)
				weapontext3:SetSize(200, 70)
				weapontext3:SetPos(319, v.ypos + 5)
				weapontext3:SetText([[
				
				Stability:
				Mobility:
				]])
				weapontext3.Paint = function()
					surface.SetDrawColor(50, 100, 50, 255)
					surface.DrawRect(60, 24, 100, 10)
					surface.DrawRect(60, 38, 100, 10)
					
					local Red = (100 - v.stability) * 2.55
					local Green = v.stability * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 25, v.stability, 8)
						
					local Red = (100 - v.mobility) * 2.55
					local Green = v.mobility * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 39, v.mobility, 8)
				end
					
				local weaponbutton = vgui.Create("DButton", FakeWeaponList)
				weaponbutton:SetPos(514, v.ypos + 33)
				weaponbutton:SetSize(60, 16)
				weaponbutton:SetText("Equip")
				weaponbutton.DoClick = function()
					RunConsoleCommand("ta_weapon_primary", v.concommandnum)
					surface.PlaySound("buttons/button14.wav")
					GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
					return true
				end

			end
			
			WeaponListLMG:AddItem(FakeWeaponList)
			PropertySheet3:AddSheet("LMGs", WeaponListLMG, "ta/weapon_lmg", false, false, "Moderate-high damage, varying recoil, moderate accuracy." )
		end
		
		if ply.Class == "Assault" then
			local WeaponListBR = vgui.Create("DPanelList")
			WeaponListBR:SetParent(PropertySheet3)
			WeaponListBR:SetAutoSize(false)
			WeaponListBR:SetSpacing(8)
			WeaponListBR:EnableHorizontal(false)
			WeaponListBR:EnableVerticalScrollbar(true)
			
			local FakeWeaponList = vgui.Create("Panel", WeaponListBR)
			FakeWeaponList:SetSize(500, 300)
			
			for k, v in ipairs(brs) do
				local weaponmodel = vgui.Create("DModelPanel", FakeWeaponList)
				weaponmodel:SetModel(v.model)
				weaponmodel:SetPos(5, v.ypos + 5)
				weaponmodel:SetSize(128, 64)
				weaponmodel.PaintOver = function()
					surface.SetDrawColor(0, 150, 250, 255)
					surface.DrawOutlinedRect(0, 0, 128, 64)
				end
					
				function weaponmodel:CenterView()
					local PrevMins, PrevMaxs = self.Entity:GetRenderBounds()
					self:SetCamPos(PrevMins:Distance(PrevMaxs)*Vector(0.75, 0.75, 0.5))
					self:SetLookAt((PrevMaxs + PrevMins) / 2)
				end
				
				weaponmodel:CenterView()
				
				weaponmodel.LayoutEntity = function()
				end
					
				local weapontext = vgui.Create("DLabel", FakeWeaponList)
				weapontext:SetSize(200, 70)
				weapontext:SetPos(144, v.ypos + 5)
				weapontext:SetText(v.weaponname .. [[
					
				Damage:
				Accuracy:
				ROF:
				]])
				weapontext.Paint = function()
					
					surface.SetDrawColor(50, 100, 50, 255)
					surface.DrawRect(60, 17, 100, 10)
					surface.DrawRect(60, 30, 100, 10)
					surface.DrawRect(60, 43, 100, 10)
					
					local Red = (100 - v.damage) * 2.55
					local Green = v.damage * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 18, v.damage, 8)
						
					local Red = (100 - v.accuracy) * 2.55
					local Green = v.accuracy * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 31, v.accuracy, 8)
						
					local Red = (100 - v.rof) * 2.55
					local Green = v.rof * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 44, v.rof, 8)
				end
					
				local weapontext2 = vgui.Create("DLabel", FakeWeaponList)
				weapontext2:SetSize(200, 70)
				weapontext2:SetPos(10, v.ypos + 45)
				weapontext2:SetText(v.mags .. "x" .. v.clipsize .. " mags in reserve")
					
				local weapontext3 = vgui.Create("DLabel", FakeWeaponList)
				weapontext3:SetSize(200, 70)
				weapontext3:SetPos(319, v.ypos + 5)
				weapontext3:SetText([[
				
				Stability:
				Mobility:
				]])
				weapontext3.Paint = function()
					surface.SetDrawColor(50, 100, 50, 255)
					surface.DrawRect(60, 24, 100, 10)
					surface.DrawRect(60, 38, 100, 10)
					
					local Red = (100 - v.stability) * 2.55
					local Green = v.stability * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 25, v.stability, 8)
						
					local Red = (100 - v.mobility) * 2.55
					local Green = v.mobility * 2.55
						
					surface.SetDrawColor(Red, Green, 0, 255)
					surface.DrawRect(61, 39, v.mobility, 8)
				end
					
				local weaponbutton = vgui.Create("DButton", FakeWeaponList)
				weaponbutton:SetPos(514, v.ypos + 33)
				weaponbutton:SetSize(60, 16)
				weaponbutton:SetText("Equip")
				weaponbutton.DoClick = function()
					RunConsoleCommand("ta_weapon_primary", v.concommandnum)
					surface.PlaySound("buttons/button14.wav")
					GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
					return true
				end

			end
			
			WeaponListBR:AddItem(FakeWeaponList)
			PropertySheet3:AddSheet("Battle Rifles", WeaponListBR, "ta/weapon_battlerifle", false, false, "Highest damage, recoil and accuracy." )
		end
		
		local AmmoList = vgui.Create("DPanelList")
		AmmoList:SetParent(PropertySheet3)
		AmmoList:SetAutoSize(false)
		AmmoList:SetSpacing(8)
		AmmoList:EnableHorizontal(false)
		AmmoList:EnableVerticalScrollbar(true)
		
		local FakeAmmoList = vgui.Create("Panel", AmmoList)
		FakeAmmoList:SetSize(500, 460)
		
		for k, v in ipairs(ammotypes) do
			local AllowedAmmo = false
			
			local ammomodel = vgui.Create("DModelPanel", FakeAmmoList)
			ammomodel:SetModel("models/Items/BoxMRounds.mdl")
			ammomodel:SetPos(5, v.ypos + 5)
			ammomodel:SetSize(64, 64)
			ammomodel.PaintOver = function()
				surface.SetDrawColor(0, 150, 250, 255)
				surface.DrawOutlinedRect(0, 0, 64, 64)
			end
				
			function ammomodel:CenterView()
				local PrevMins, PrevMaxs = self.Entity:GetRenderBounds()
				self:SetCamPos(PrevMins:Distance(PrevMaxs)*Vector(0.75, 0.75, 0.5))
				self:SetLookAt((PrevMaxs + PrevMins) / 2)
			end
			
			ammomodel:CenterView()
			
			ammomodel.LayoutEntity = function()
			end
			
			local ammotexttype = vgui.Create("DLabel", FakeAmmoList)
			ammotexttype:SetSize(210, 20)
			ammotexttype:SetPos(10, v.ypos + 70)
			ammotexttype:SetText(v.ammotexttype)
			
			local ammobutton = vgui.Create("DButton", FakeAmmoList)
			ammobutton:SetPos(90, v.ypos + 72)
			ammobutton:SetSize(60, 16)
			ammobutton:SetText("Equip")
			ammobutton.DoClick = function()
				local wepnum = GetConVarNumber("ta_weapon_primary")
				
				for k2, v2 in pairs(v.restriction) do
				
					if v2 != wepnum or v2 == nil then
						AllowedAmmo = true
					else
						AllowedAmmo = false
						break
					end
				
				end
				
				if AllowedAmmo then
					RunConsoleCommand("ta_weapon_primary_ammo", v.concommandnum)
					surface.PlaySound("buttons/button14.wav")
					GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
				else
					surface.PlaySound("buttons/button10.wav")
				end
				
				return true
			end
			
			local ammotextgood = vgui.Create("DLabel", FakeAmmoList)
			ammotextgood:SetSize(400, 20)
			ammotextgood:SetPos(80, v.ypos + 20)
			ammotextgood:SetTextColor(Color(0, 150, 250, 255))
			ammotextgood:SetText(v.ammotextgood)
			
			local ammotextbad = vgui.Create("DLabel", FakeAmmoList)
			ammotextbad:SetSize(400, 20)
			ammotextbad:SetPos(80, v.ypos + 40)
			ammotextbad:SetTextColor(Color(255, 0, 0, 255))
			ammotextbad:SetText(v.ammotextbad)
		end
		
		AmmoList:AddItem(FakeAmmoList)
		
		local AttachmentList = vgui.Create("DPanelList")
		AttachmentList:SetParent(PropertySheet3)
		AttachmentList:SetAutoSize(false)
		AttachmentList:SetSpacing(8)
		AttachmentList:EnableHorizontal(false)
		AttachmentList:EnableVerticalScrollbar(true)
		
		local FakeAttachmentList = vgui.Create("Panel", AttachmentList)
		FakeAttachmentList:SetSize(500, 700)
		
		local atttext
		
		if GetConVarNumber("ta_weapon_primary_attachment") == 2 then
			atttext = "Attachment 1 (Trijicon ACOG Scope (ARs/BRs))"
		elseif GetConVarNumber("ta_weapon_primary_attachment") == 3 then
			atttext = "Attachment 1 (Aimpoint red-dot scope (ARs/BRs/LMGs))"
		elseif GetConVarNumber("ta_weapon_primary_attachment") == 4 then
			atttext = "Attachment 1 (EoTech 557 red-dot sight (SMGs/LSMGs/LMGs/Shotguns))"
		else
			atttext = "Attachment 1"
		end
		
		local attone = vgui.Create("DLabel", FakeAttachmentList)
		attone:SetSize(405, 18)
		attone:SetPos(5, 3)
		attone:SetText(atttext)
		attone.Paint = function()
			surface.SetDrawColor(255, 255, 0, 255)
			surface.DrawRect(0, 16, 400, 2)
		end
		
		local noattachment = vgui.Create("DButton", FakeAttachmentList)
		noattachment:SetSize(100, 20)
		noattachment:SetPos(5, 40)
		noattachment:SetText("No attachments")
		noattachment.DoClick = function()
			attone:SetText("Attachment 1")
			RunConsoleCommand("ta_weapon_primary_attachment", 0)
			surface.PlaySound("buttons/button14.wav")
			GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
		end
		
		local atttext2
		
		if GetConVarNumber("ta_weapon_primary_attachment2") == 6 then
			atttext2 = "Attachment 2 (M203 Underslung grenade launcher (ARs))"
		elseif GetConVarNumber("ta_weapon_primary_attachment2") == 7 then
			atttext2 = "Attachment 2 (Vert grip)"
		elseif GetConVarNumber("ta_weapon_primary_attachment2") == 8 then
			atttext2 = "Attachment 2 (Beta C-magazine)"
		else
			atttext2 = "Attachment 2"
		end
				
		local atttwo = vgui.Create("DLabel", FakeAttachmentList)
		atttwo:SetSize(405, 16)
		atttwo:SetPos(5, 350)
		atttwo:SetText(atttext2)
		atttwo.Paint = function()
			surface.SetDrawColor(255, 255, 0, 255)
			surface.DrawRect(0, 14, 400, 2)
		end
		
		local noattachment2 = vgui.Create("DButton", FakeAttachmentList)
		noattachment2:SetSize(100, 20)
		noattachment2:SetPos(5, 390)
		noattachment2:SetText("No attachments")
		noattachment2.DoClick = function()
			atttwo:SetText("Attachment 2")
			RunConsoleCommand("ta_weapon_primary_attachment2", 0)
			surface.PlaySound("buttons/button14.wav")
			GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
		end
		
		for k, v in ipairs(attachments) do
			local Allowed = false
		
			local attachmenticon = vgui.Create("DModelPanel", FakeAttachmentList)
			attachmenticon:SetModel(v.model)
			attachmenticon:SetPos(5, v.ypos + 70)
			attachmenticon:SetSize(128, 64)
			attachmenticon.PaintOver = function()
				surface.SetDrawColor(0, 150, 250, 255)
				surface.DrawOutlinedRect(0, 0, 128, 64)
			end
				
			function attachmenticon:CenterView()
				local PrevMins, PrevMaxs = self.Entity:GetRenderBounds()
				self:SetCamPos(PrevMins:Distance(PrevMaxs)*Vector(0.75, 0.75, 0.5))
				self:SetLookAt((PrevMaxs + PrevMins) / 2)
			end
			
			attachmenticon:CenterView()
			
			attachmenticon.LayoutEntity = function()
			end
			
			local attachmentbutton = vgui.Create("DButton", FakeAttachmentList)
			attachmentbutton:SetPos(7, v.ypos + 139)
			attachmentbutton:SetSize(60, 16)
			attachmentbutton:SetText("Equip")
			attachmentbutton.DoClick = function()
				local wepnum = GetConVarNumber("ta_weapon_primary")
				
				for k2, v2 in pairs(v.restricted) do
				
					if v2 != wepnum then
						Allowed = true
					else
						Allowed = false
						break
					end
				
				end
				
				if Allowed then
					RunConsoleCommand(v.concom, v.concommandnum)
					surface.PlaySound("buttons/button14.wav")
					GAMEMODE:AddNotify("Changes will be applied upon respawn", NOTIFY_HINT, 5)
					
					if v.concommandnum <= 4 then
						attone:SetText("Attachment 1 (" .. v.attachmentname .. ")")
					else
						atttwo:SetText("Attachment 2 (" .. v.attachmentname .. ")")
					end
				else
					surface.PlaySound("buttons/button10.wav")
				end
				
				return true
			end
			
			local attachmentname = vgui.Create("DLabel", FakeAttachmentList)
			attachmentname:SetSize(350, 20)
			attachmentname:SetPos(144, v.ypos + 70)
			attachmentname:SetText(v.attachmentname)
			
			local attachmenttextgood = vgui.Create("DLabel", FakeAttachmentList)
			attachmenttextgood:SetSize(500, 20)
			attachmenttextgood:SetPos(144, v.ypos + 90)
			attachmenttextgood:SetTextColor(Color(0, 150, 250, 255))
			attachmenttextgood:SetText(v.textgood)
			
			local attachmenttextbad = vgui.Create("DLabel", FakeAttachmentList)
			attachmenttextbad:SetSize(500, 20)
			attachmenttextbad:SetPos(144, v.ypos + 110)
			attachmenttextbad:SetTextColor(Color(255, 0, 0, 255))
			attachmenttextbad:SetText(v.textbad)
		end
		
		AttachmentList:AddItem(FakeAttachmentList)
		
		PropertySheet:AddSheet("Loadout", PropertySheet2, "ta/weapon_pistol", false, false, "Pick the weapons you want.")
		PropertySheet2:AddSheet( "PRIMARY", PropertySheet3, "ta/weapon_assaultrifle", false, false, "PRIMARY." )
		PropertySheet2:AddSheet( "SECONDARY", PropertySheet3B, "ta/weapon_pistol", false, false, "SECONDARY." )
		PropertySheet3:AddSheet("Light SMGs", WeaponList, "ta/weapon_lightsmg", false, false, "SECONDARY." )
		PropertySheet3:AddSheet("Ammo types", AmmoList, "ta/weapon_ammo", false, false, "Ammo types")
		PropertySheet3:AddSheet("Attachments", AttachmentList, "ta/weapon_attachment", false, false, "Attachments")
		
	Text = vgui.Create("HTML", InitialDFrame)
	//Text:SetPos(25, 50)
		Text:SetHTML([[<br>
		<center>Hey there!</center>
		<br>
		As this is probably your first time on the server, please read this.
		The gamemode is called 'Green Shift' which is based on Battlefield: Bad Company, Brink and a few ideas of my own.
		There are 2 teams:
		<br>
		Rebels
		<br>
		Combine
		<br>
		<br>
		<center>Basics.</center>
		<br>
		Every class has 3 weapons: primary, secondary and an unique weapon.
		<br>
		Every firearm is affected by several factors:
		<br>
		1. Current attachment that is installed on your weapon
		<br>
		2. Whether you are aiming down or firing from the hip
		<br>
		3. Your movement speed. The faster you go, the lower your accuracy is.
		<br>
		<br>
		<center>Climbing.</center>
		<br>
		Every class can climb. However, only the Recon class has full access to the climbing system. Engineer has near-full access and Assault and Medic have a limited access to it.
		<br>
		<br>
		To climb, come up to a wall, and hold down your JUMP KEY and your FORWARD KEY. You will start wall-running. 
		<br>
		To wall-run while sprinting forwards, you'll need to JUMP, hold down your JUMP KEY and hold down the key, which is appropriate to the side of a wall.
		<br> 
		For example, if you're sprinting forwards, and the wall is to the left, you'll need to JUMP, hold down your JUMP and your LEFT key.
		<br>
		if you're sprinting forwards, and the wall is to the right, you'll need to JUMP, hold down your JUMP and your RIGHT key.
		<br>
		You can wall-run only several times, before you land on the ground. After landing, you'll be able to wall-run again.
		<br>
		<br>
		When able, you will grab on to various ledges. To grab on to something, you'll need to hold down your JUMP KEY. When you're grabbed on to a ledge, press your JUMP KEY to pull yourself up.
		<br>
		<br>
		The Recon class is able to perform a wall-jump backwards. To do so, you need to wall-run at least 2 times. After that, you'll need to release your JUMP KEY and press it again.
		<br>
		You can also shimmy around while grabbed onto a ledge. By holding down a directional key (A/D) you will shimmy to the appropriate side.
		<br>
		<br>
		The climbing might be hard at first, but, trust me, once you get the hang of it, it'll become incredibly useful.
		<br>
		<br>
		I hope this manual was of use to you, have a nice game!]])
	
	PropertySheet:AddSheet( "Help", Text, "icon16/page.png", false, false, "Don't know how to play? Click here!" )
	PropertySheet:AddSheet( "Personal Attributes", PAList, "icon16/user.png", false, false, "Pick one personal attribute here." )
	PropertySheet:AddSheet( "Levels and Unlockables", UNList, "icon16/plugin.png", false, false, "Check your progress on unlockables here." )
	PropertySheet:AddSheet( "Options", PanelList, "icon16/wrench.png", false, false, "Tune everything to your own liking here." )
end

concommand.Add("ta_helpmenu", TA_HelpMenu)

local CloakBarAlpha = 0
local CurAlpha = 0
local CurWarnAlpha = 0
local CurModeAlpha = 255
local Smooth_healthdisplay = 0
local Smooth_energydisplay = 0
local Smooth_chargedisplay = 0
local CanDraw = false
local HUD_MainFrame = surface.GetTextureID("ta/hud_main")
local HUD_Bar = surface.GetTextureID("ta/hud_bar")
local HUD_Medkit = surface.GetTextureID("ta/hud_medkit")
local HUD_NoMedkit = surface.GetTextureID("ta/hud_nomedkit")
local HUD_Armor = surface.GetTextureID("ta/hud_armor")
local HUD_Ammo = surface.GetTextureID("ta/hud_ammo")
local HUD_Teammate = surface.GetTextureID("ta/hud_teammate2")
local HUD_Teammate_Filling = surface.GetTextureID("ta/hud_teammate_filling")
local Node_Download = surface.GetTextureID("ta/node_download")
local Node_Upload = surface.GetTextureID("ta/node_upload")
local Icon_Recon = surface.GetTextureID("ta/icon_recon")
local Icon_Engineer = surface.GetTextureID("ta/icon_engineer")
local Icon_Assault = surface.GetTextureID("ta/icon_assault")
local Icon_Medic = surface.GetTextureID("ta/icon_medic")
local CurNameAlpha = 0
local red = 0
local TextAlpha = 0
local TextAlpha2 = 0
local UpdateAlpha = 0
local DownloadExists = false
local UploadExists = false
local GamestateUpdateTime = 0
local Exp = 0
local ExpFadeTime = 0
local ExpAlpha = 0
TotalTime = nil

local KillText = ""
local KillAlpha = 0
local KillAlphaTime = 0

local function HideHUDStuff(name)
	if name == "CHudHealth" or name == "CHudCrosshair" or name == "CHudAmmo" or name == "CHudBattery" then 
		return false
	end
end

hook.Add("HUDShouldDraw", "HideHUDStuff", HideHUDStuff)

local CurAmmoKitAlpha = 0
local ClassText = nil
local ActionText = ""
local ActionTextAlpha = 0
local ActionTextDelay = 0
local ActionPointNotify = false

function GM:HUDPaint()

	local ply = LocalPlayer()
	local wep = ply:GetActiveWeapon()
	local Width = ScrW()
	local Height = ScrH() 
	local CurrentTime = CurTime()

	if ply:Alive() and ply:Team() != TEAM_SPECTATOR then
	
		if ply.Class then
			if EndGameClass == ply.Class and ply:Team() == TEAM_REBELS then
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetTexture(Node_Upload)
				surface.DrawTexturedRect(83, Height * 0.8 - 40 - YOffset, 32, 32)
			end
		end
		
		if ObjectiveText then
			local struc = {}
			struc["pos"] = {70, Height * 0.8 - 20}
			struc["color"] = Color(255, 255, 255, 150)
			struc["text"] = ObjectiveText
			struc["font"] = "ScoreboardText"
			struc["xalign"] = TEXT_ALIGN_LEFT
			struc["yalign"] = TEXT_ALIGN_TOP
			draw.TextShadow(struc, 1, 200)
		end
		
		if TotalTime then
			surface.SetDrawColor(0, 150, 250, 220)
			surface.DrawOutlinedRect(Width * 0.5 - 50, 0, 100, 30)
				
			surface.SetDrawColor(0, 0, 0, 150)
			surface.DrawRect(Width * 0.5 - 49, 1, 98, 28)
		
			local minutes = math.floor((TotalTime - CurrentTime) / 60)
			local seconds = math.ceil((TotalTime - CurrentTime - 1) - minutes * 60) -- thanks to Wintows for second calculation
			
			if CurrentTime > TotalTime then
				draw.SimpleText("0:00", "Trebuchet24Outlined", Width * 0.5, 15, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				if seconds < 10 then
					if seconds < 1 then
						draw.SimpleText(minutes .. ":00", "Trebuchet24Outlined", Width * 0.5, 15, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					else
						draw.SimpleText(minutes .. ":0" .. math.ceil(seconds), "Trebuchet24Outlined", Width * 0.5, 15, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
					end
				else
					draw.SimpleText(minutes .. ":" .. math.ceil(seconds), "Trebuchet24Outlined", Width * 0.5, 15, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
				end
			end
		end
		
		if GetGlobalInt("n1data") < 100 then
			for k, v in pairs(ents.FindByClass("ta_node_download")) do
				local pos = (v:GetPos() + Vector(0, 0, 30)):ToScreen()
				
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetTexture(Node_Download)
				surface.DrawTexturedRect(pos.x, pos.y, 32, 32)
				DownloadExists = true
			end
		end
		
		if GetGlobalInt("n1data") == 100 then
			for k, v in pairs(ents.FindByClass("ta_node_upload")) do
				local pos = (v:GetPos() + Vector(0, 0, 30)):ToScreen()
				
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetTexture(Node_Upload)
				surface.DrawTexturedRect(pos.x, pos.y, 32, 32)
				UploadExists = true
			end
		end
		
		if DownloadExists or UploadExists then
			draw.RoundedBoxEx(4, 20, 20, 200, 30, Color(0, 0, 0, 255), false, true, false, true)
			draw.RoundedBoxEx(4, 21, 21, 198, 11, Color(80, 80, 80, 255), false, true, false, false)
			draw.RoundedBoxEx(4, 21, 38, 198, 11, Color(80, 80, 80, 255), false, false, false, true)
			if GetGlobalInt("n1data") > 1 then
				draw.RoundedBoxEx(4, 22, 22, GetGlobalInt("n1data") * 1.94, 10, Color(0, 200, 100, 255), false, true, false, false)
			end
			
			if GetGlobalInt("n2data") > 1 then
				draw.RoundedBoxEx(4, 22, 38, GetGlobalInt("n2data") * 1.94, 10, Color(0, 150, 200, 255), false, false, false, true)
			end
			
			draw.SimpleText("Download: " .. GetGlobalInt("n1data") .. "%", "DefaultFixedOutline", 30, 22, Color(255, 255, 255, 255))
			draw.SimpleText("Upload:   " .. GetGlobalInt("n2data") .. "%", "DefaultFixedOutline", 30, 38, Color(255, 255, 255, 255))
		end
	
		Smooth_healthdisplay = math.Clamp(math.Approach(Smooth_healthdisplay, ply:Health() / ply:GetMaxHealth() * 176, 2), 0, 176)
		Smooth_energydisplay = math.Clamp(math.Approach(Smooth_energydisplay, ply:Armor() / ply:GetMaxArmor() * 176, 2), 0, 176)

		surface.SetDrawColor(255, 255, 255, 255)
		surface.SetTexture(HUD_MainFrame)
		surface.DrawTexturedRect(60, Height * 0.8 - 25, 256, 128)
		
		if ply.Class then
			if ply.Class == "Recon" then
				surface.SetTexture(Icon_Recon)
			elseif ply.Class == "Engineer" then
				surface.SetTexture(Icon_Engineer)
			elseif ply.Class == "Assault" then
				surface.SetTexture(Icon_Assault)
			elseif ply.Class == "Medic" then
				surface.SetTexture(Icon_Medic)
			end
		end
		
		surface.DrawTexturedRect(67, Height * 0.8 + 7, 64, 64)
		if Smooth_healthdisplay then
			surface.SetDrawColor(115, 219, 81, 255)
			surface.SetTexture(HUD_Bar)
			surface.DrawTexturedRect(138, Height * 0.8 + 16, Smooth_healthdisplay, 9)
        end
		if Smooth_energydisplay then
			surface.SetDrawColor(12, 198, 255, 255)
			surface.SetTexture(HUD_Bar)
			surface.DrawTexturedRect(138, Height * 0.8 + 53, Smooth_energydisplay, 9)
		end
				
		local struc = {}
		struc["pos"] = {145, Height * 0.8}
		struc["color"] = Color(255, 255, 255, 150)
		struc["text"] = "Health: " .. ply:Health() .. "%"
		struc["font"] = "ScoreboardText"
		struc["xalign"] = TEXT_ALIGN_LEFT
		struc["yalign"] = TEXT_ALIGN_TOP
			
		draw.TextShadow(struc, 1, 200)
		
		local struc = {}
		struc["pos"] = {144, Height * 0.8 + 61}
		struc["color"] = Color(255, 255, 255, 150)
		struc["text"] = "Armor: " .. ply:Armor() .. "%"
		struc["font"] = "ScoreboardText"
		struc["xalign"] = TEXT_ALIGN_LEFT
		struc["yalign"] = TEXT_ALIGN_TOP
			
		draw.TextShadow(struc, 1, 200)
				
		//draw.SimpleText("Health: " .. ply:Health() .. "%", "DefaultSmall", 124, Height * 0.8 + 15, Color(255, 255, 255, 255))
		//draw.SimpleText("Armor: " .. ply:Armor() .. "%", "DefaultSmall", 124, Height * 0.8 + 52, Color(255, 255, 255, 255))
		
		if IsValid(wep) and wep:GetClass():find("^ta_") and wep.Primary.ClipSize then
			//draw.SimpleText(ply:GetAmmoCount(wep.Primary.ClipSize), "HudHintTextLarge", 150, Height * 0.8 + 37, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			local struc = {}
			struc["pos"] = {180, Height * 0.8 + 31}
			struc["color"] = Color(255, 255, 255, 150)
			struc["text"] = ply:GetAmmoCount(wep.Primary.Ammo)
			struc["font"] = "ScoreboardText"
			struc["xalign"] = TEXT_ALIGN_LEFT
			struc["yalign"] = TEXT_ALIGN_TOP
			
			draw.TextShadow(struc, 1, 200)
			
			local struc = {}
			struc["pos"] = {255, Height * 0.8 + 31}
			struc["color"] = Color(255, 255, 255, 150)
			struc["text"] = wep:Clip1()
			struc["font"] = "ScoreboardText"
			struc["xalign"] = TEXT_ALIGN_LEFT
			struc["yalign"] = TEXT_ALIGN_TOP
			
			draw.TextShadow(struc, 1, 200)
		end
		
		for k, v in pairs(ents.FindByClass("ta_escort_node")) do
			local pos = v:GetPos():ToScreen()
			
			surface.SetDrawColor(255, 255, 255, 255)
			surface.SetTexture(HUD_Teammate)
			surface.DrawTexturedRect(pos.x, pos.y - 50, 34, 34)
			
			surface.SetDrawColor(0, 150, 250, 255)
			surface.SetTexture(HUD_Teammate_Filling)
			surface.DrawTexturedRect(pos.x, pos.y - 50, 34, 34)
			
			local struc = {}
			struc["pos"] = {pos.x - 20, pos.y - 25}
			struc["color"] = Color(255, 255, 255, 150)
			struc["text"] = "Escort node"
			struc["font"] = "ScoreboardText"
			struc["xalign"] = TEXT_ALIGN_LEFT
			struc["yalign"] = TEXT_ALIGN_TOP
				
			draw.TextShadow(struc, 1, 200)
			
		end

		if RedAlpha > 0 then
		
			if ply:Health() <= ply.MaxHealth * 0.35 then
				RedAlpha = Lerp(0.2, RedAlpha, 40)
			else
				RedAlpha = Lerp(0.15, RedAlpha, 0)
			end
			
			surface.SetDrawColor(255, 0, 0, RedAlpha)
			surface.DrawRect(0, 0, Width, Height) -- making the red overlay this way, because if there is a second render target, it gets all messed up and shit
		end
		
		if ply.IsSupplyDepot then
			draw.RoundedBoxEx(6, 15, 15, 150, 40, Color(0, 0, 0, 150), false, true, false, true)
			draw.SimpleText(AmountOfFood .. " food crate(s) remain.", "DefaultSmallDropShadow", 20, 20, Color(255, 255, 255, 255))
			draw.SimpleText(AmountOfWeapon .. " weapon cache(s) remain.", "DefaultSmallDropShadow", 20, 40, Color(255, 255, 255, 255))
		end
		
		if ply:Team() == TEAM_REBELS then
			for k, v in pairs(ents.FindByClass("ta_depot_food")) do
				local pos = (v:GetPos() + Vector(0, 0, 30)):ToScreen()
				
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetTexture(HUD_Teammate)
				surface.DrawTexturedRect(pos.x, pos.y - 50, 34, 34)
				
				surface.SetDrawColor(0, 150, 250, 255)
				surface.SetTexture(HUD_Teammate_Filling)
				surface.DrawTexturedRect(pos.x, pos.y - 50, 34, 34)
				
				local struc = {}
				struc["pos"] = {pos.x + 15, pos.y - 25}
				struc["color"] = Color(255, 255, 255, 150)
				struc["text"] = "Food crate"
				struc["font"] = "ScoreboardText"
				struc["xalign"] = TEXT_ALIGN_CENTER
				struc["yalign"] = TEXT_ALIGN_TOP
					
				draw.TextShadow(struc, 1, 200)
				
			end
			
			for k, v in pairs(ents.FindByClass("ta_depot_weapon")) do
				local pos = (v:GetPos() + Vector(0, 0, 30)):ToScreen()
				
				surface.SetDrawColor(255, 255, 255, 255)
				surface.SetTexture(HUD_Teammate)
				surface.DrawTexturedRect(pos.x, pos.y - 50, 34, 34)
				
				surface.SetDrawColor(0, 150, 250, 255)
				surface.SetTexture(HUD_Teammate_Filling)
				surface.DrawTexturedRect(pos.x, pos.y - 50, 34, 34)
				
				local struc = {}
				struc["pos"] = {pos.x + 15, pos.y - 25}
				struc["color"] = Color(255, 255, 255, 150)
				struc["text"] = "Weapon cache"
				struc["font"] = "ScoreboardText"
				struc["xalign"] = TEXT_ALIGN_CENTER
				struc["yalign"] = TEXT_ALIGN_TOP
					
				draw.TextShadow(struc, 1, 200)
				
			end
		end
		
		local times = math.ceil(ply:GetDTFloat(1) / 20) 
		
		for k, v in ipairs(player.GetAll()) do
			if not v.MaxHealth or not v.MaxArmor or not v.Class and v:Team() != TEAM_SPECTATOR then
				RunConsoleCommand("ta_givemeinfo")
			end
		
			if v:Team() == ply:Team() and v.MaxHealth and v.MaxArmor and v.Class and v != ply and v:Alive() and ply:Alive() then
				//local distance = v:GetPos():Distance(EyePos())
				local headpos, headang = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Head1"))
				
				//if distance <= 256 then
					local alpha = math.Clamp((255) * 2, 0, 255)
					local pos = (headpos + Vector(0, 0, 15)):ToScreen()
					surface.SetDrawColor(255, 255, 255, alpha)
					surface.SetTexture(HUD_Teammate)
					surface.DrawTexturedRect(pos.x - 15, pos.y - 25, 34, 34)
					
					local color = v:Health() / (v.MaxHealth / 100)
					
					surface.SetDrawColor(math.Clamp((255 - color * 2.55) * 2, 0, 255), color * 2.55, 0, alpha)
					surface.SetTexture(HUD_Teammate_Filling)
					surface.DrawTexturedRect(pos.x - 14, pos.y - 24, 32, 32)
					
					if v.IsVIP then
						VIPText = "(VIP) "
					else
						VIPText = ""
					end
					
					local text = VIPText .. v:Nick() .. " (" .. v.Class .. ")"
					
					local struc = {}
					struc["pos"] = {pos.x - #text * 3, pos.y + 10}
					struc["color"] = Color(255, 255, 255, 150)
					struc["text"] = text
					struc["font"] = "ScoreboardText"
					struc["xalign"] = TEXT_ALIGN_LEFT
					struc["yalign"] = TEXT_ALIGN_TOP
					
					draw.TextShadow(struc, 1, 200)
					
					if ply.Class == "Medic" then

						if v:GetDTFloat(1) < 20 then
							local alpha2 = math.Clamp(alpha - v:GetDTFloat(1) * 12.75, 0, 255)
						
							surface.SetDrawColor(255, 255, 255, alpha2)
							surface.SetTexture(HUD_NoMedkit)
							surface.DrawTexturedRect(pos.x - 15, pos.y - 50, 32, 32)
						end
						
						//surface.SetDrawColor(255 - color * 2.55, color * 2.55, 0, alpha)
						//surface.SetTexture(HUD_Cross_Filling)
						//surface.DrawTexturedRect(pos.x, pos.y - 25, 32, 32)
					end
					
					if ply.Class == "Engineer" then
						//if v:Armor() < v.MaxArmor * 0.7 then
							local armor = v:Armor() / (v.MaxArmor / 100)
							
							surface.SetDrawColor(255, 255, 255, alpha - 150)
							surface.SetTexture(HUD_Armor)
							surface.DrawTexturedRect(pos.x - 14, pos.y - 50, 32, 32)
							
							surface.SetDrawColor(255, 255, 255, alpha)
							surface.SetTexture(HUD_Armor)
							surface.DrawTexturedRectUV(pos.x - 14, pos.y - 50, 32, armor * 0.32, 32, 32)
						//end
					end
					
					if ply.Class == "Assault" then
						if IsValid(v:GetActiveWeapon()) then
							if v:GetActiveWeapon().MaxAmmo then
								local alpha = v:GetAmmoCount(v:GetActiveWeapon():GetPrimaryAmmoType()) / (v:GetActiveWeapon().MaxAmmo / 100)
								surface.SetDrawColor(255, 255, 255, 255 - alpha * 2.55)
								surface.SetTexture(HUD_Ammo)
								surface.DrawTexturedRect(pos.x - 15, pos.y - 50, 32, 32)
							end
						end
					end
				//end
			end
		end
		
		for i = 1, times do
			local alpha = (20 - (i * 20 - ply:GetDTFloat(1))) * 12.75
			
			surface.SetDrawColor(255, 255, 255, alpha)
			surface.SetTexture(HUD_Medkit)
			surface.DrawTexturedRect(150 + i * 40 - 40, Height * 0.8 + 85, 32, 32)
		end
		
		if ply.Class == "Recon" then
			
			if ply:GetDTInt(2) < 20 then
				red = math.Approach(red, 100, 5)
			else
				red = math.Approach(red, 0, 5)
			end
			
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawOutlinedRect(195, Height * 0.8 + 94, 110, 14)
			
			surface.SetDrawColor(100, 100, 100, 255)
			surface.DrawRect(196, Height * 0.8 + 95, 108, 12)
			
			surface.SetDrawColor(red * 2, 150 - red * 1.5, 200 - red * 2, 255)
			surface.DrawRect(196, Height * 0.8 + 95, ply:GetDTInt(2) * 1.08, 12)
			
			draw.SimpleText("Cloak: " .. ply:GetDTInt(2) .. "%", "DefaultSmallDropShadow", 230, Height * 0.8 + 101, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			
		end
		
		if ply.Class == "Engineer" then
			local times = math.ceil(ply:GetDTFloat(2) / 20) 
			
			for i = 1, times do
				local alpha = (20 - (i * 20 - ply:GetDTFloat(2))) * 12.75
				
				surface.SetDrawColor(255, 255, 255, alpha)
				surface.SetTexture(HUD_Armor)
				surface.DrawTexturedRect(190 + i * 40 - 40, Height * 0.8 + 85, 32, 32)
			end
		end
		
		if ply.Class == "Assault" then
			local times = math.ceil(ply:GetDTFloat(2) / 20) 
			
			for i = 1, times do
				local alpha = (20 - (i * 20 - ply:GetDTFloat(2))) * 12.75
				
				surface.SetDrawColor(255, 255, 255, alpha)
				surface.SetTexture(HUD_Ammo)
				surface.DrawTexturedRect(190 + i * 40 - 40, Height * 0.8 + 85, 32, 32)
			end
		end
	else
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(0, 0, Width, 50)
		
		surface.DrawRect(0, Height - 50, Width, 50)
		
		if HardCoreMode >= 1 then
			draw.SimpleText("Cannot respawn in hardcore mode", "TargetID", Width * 0.5, 15, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			if CurrentTime < TimeToRespawn then
				draw.SimpleText("Respawning in: " .. math.ceil(TimeToRespawn - CurrentTime) .. " second(s)", "TargetID", Width * 0.5, 15, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText("Press your PRIMARY ATTACK KEY to respawn!", "TargetID", Width * 0.5, 15, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
		
		if ply.IsVIP and ply.Lives then
			if ply.Lives == 1 then
				draw.SimpleText("Last life!", "TargetID", 10, 5, Color(255, 255, 255, 255)) 
			else
				draw.SimpleText(ply.Lives .. " lives remaining!", "TargetID", 10, 5, Color(255, 255, 255, 255)) 
			end
		end
		
		draw.SimpleText("Use your STRAFE LEFT and STRAFE RIGHT arrow keys to spectate people", "TargetID", Width * 0.5, 35, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		
		draw.SimpleText("F1 opens the loadout menu; F2 opens the team menu; F3 opens the class menu", "MenuItem", Width * 0.5, Height - 40, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText("Spawnmenu key (Yours: " .. QMenuKey .. ") - heal self; Context menu key (Yours: " .. CMenuKey .. ") - perform class-based action (give medkit/repair armor, etc.)", "MenuItem", Width * 0.5, Height - 26, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	if KillAlpha > 0 then -- kill notifier
		draw.SimpleText(KillText, "Trebuchet24Outlined", Width * 0.5, Height * 0.7, Color(255, 255, 255, KillAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		
		if CurrentTime > KillAlphaTime then
			KillAlpha = math.Approach(KillAlpha, 0, 5)
		end
	end
	
	if ActionTextAlpha > 0 then -- notifier when you repair someone's armor/give him a medkit, etc.
		draw.SimpleText(ActionText, "Trebuchet24Outlined", Width * 0.5, Height * 0.7 + 30, Color(255, 255, 255, ActionTextAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		
		if ActionPointNotify then
			draw.SimpleText("+1 Score;", "Trebuchet24Outlined", Width * 0.5, Height * 0.7 + 56, Color(255, 255, 255, ActionTextAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		
		if CurrentTime > ActionTextDelay then
			ActionTextAlpha = math.Approach(ActionTextAlpha, 0, 5)
		end
	end
	
	if ExpAlpha > 0 then
		draw.SimpleText("+" .. Exp .. " EXP", "Trebuchet24Outlined", Width * 0.5 + 100, Height * 0.7 + 56, Color(255, 255, 255, ExpAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		
		if CurrentTime > ExpFadeTime then
			ExpAlpha = math.Approach(ExpAlpha, 0, 5)
		end
	else
		Exp = 0
	end
	
	if GamestateUpdateTime > CurrentTime then
		UpdateAlpha = math.Approach(UpdateAlpha, 255, 7)
	else
		UpdateAlpha = math.Approach(UpdateAlpha, 0, 7)
	end
	
	if UpdateAlpha > 0 then
		if ply:Team() == TEAM_REBELS then
			draw.SimpleText("Data downloaded! " .. EndGameClass .. " class is to upload the data!", "Trebuchet24Outlined", Width * 0.5, Height * 0.3, Color(255, 255, 255, UpdateAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			draw.SimpleText("The Rebels have downloaded the data! Stop them!", "Trebuchet24Outlined", Width * 0.5, Height * 0.3, Color(255, 255, 255, UpdateAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end
	
	if EndGameStatus == true then
	
		if CurrentTime < MapChangeTime then
			TextAlpha = math.Approach(TextAlpha, 255, 2)
		else
			TextAlpha = math.Approach(TextAlpha, 0, 5)
		end
		
		draw.SimpleText(TextRebelsWin, "Trebuchet24Outlined", Width * 0.5, Height * 0.3, Color(255, 255, 255, TextAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	elseif EndGameStatus == false then
	
		if CurrentTime < MapChangeTime then
			TextAlpha = math.Approach(TextAlpha, 255, 2)
		else
			TextAlpha = math.Approach(TextAlpha, 0, 5)
		end
		
		draw.SimpleText(TextCombineWin, "Trebuchet24Outlined", Width * 0.5, Height * 0.3, Color(255, 255, 255, TextAlpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	
	if TextAlpha == 255 then
		TextAlpha2 = math.Approach(TextAlpha2, 255, 2)
		
		if CurrentTime < MapChangeTime then
			if NextMap == "none" then
				draw.SimpleText("Starting a new round in " .. math.ceil(MapChangeTime - CurrentTime) .. " seconds. (Round " .. CurRound .. " of " .. TotalRounds .. ")", "Trebuchet24Outlined", Width * 0.5, Height * 0.3 + 30, Color(255, 255, 255, TextAlpha2), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText("Next map is " .. NextMap .. " in " .. math.ceil(MapChangeTime - CurrentTime) .. " seconds.", "Trebuchet24Outlined", Width * 0.5, Height * 0.3 + 30, Color(255, 255, 255, TextAlpha2), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		else
			if NextMap == "none" then
				draw.SimpleText("Starting a new round.", "Trebuchet24Outlined", Width * 0.5, Height * 0.3 + 30, Color(255, 255, 255, TextAlpha2), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			else
				draw.SimpleText("Switching map to " .. NextMap .. ".", "Trebuchet24Outlined", Width * 0.5, Height * 0.3 + 30, Color(255, 255, 255, TextAlpha2), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			end
		end
	else
		TextAlpha2 = math.Approach(TextAlpha2, 0, 5)
	end
end

local PitchMod = 0
local YawMod = 0
local RollMod = 0
local PAPR = 0 -- pitch approach rate
local YAPR = 0 -- yaw approach rate
local RAPR = 0 -- roll approach rate
local PT = 0 -- pitch target
local YT = 0 -- yaw target
local RT = 0 -- roll target
local PT2 = 0
local RT2 = 0
_R = {}
_R.Player = {}
-- Thanks to Kogitsune for this!
function _R.Player:SpinTo( deg, time )
	self.__spin_deg = deg
	self.__spin_time = time
	self.__spin = true
	self.__pitch = self:GetAngles( ).p
	self.CLHasDoneARoll = true
	timer.Simple(0.5, function()
		self.CLHasDoneARoll = false
	end)
end

local function umSpinTo( um )
	local a, b

	a = um:ReadFloat( )
	b = um:ReadFloat( )

	LocalPlayer():SpinTo( a, b )
end

usermessage.Hook( "Spin To", umSpinTo )

function CSWEP_ResetView(UCMD)
	if LocalPlayer().CLHasDoneARoll == true then
		local ang = UCMD:GetViewAngles()
		ang.p = 0
		UCMD:SetViewAngles(ang)
	end
end

hook.Add("CreateMove", "CSWEP_ResetView", CSWEP_ResetView)

local function CalcView( pl, pos, ang, fov )
	local view
	
	if not pl.__spin then
		return
	end
	
	view = GAMEMODE:CalcView( pl, pos, ang, fov )
	
	pl.__pitch = math.Approach( pl.__pitch, pl.__spin_deg, FrameTime( ) * pl.__spin_time * pl.__spin_deg )
	
	if pl.__pitch == pl.__spin_deg then
		pl.__spin = false
	end
	
	view.angles.p = pl.__pitch
	
	return view
end

hook.Add( "CalcView", "Spin View.CalcView", CalcView )

local time = 0
local WeaponAngle = 0
local animplayed = true

local CurWeaponAngleMod = 1

local function TA_ViewShake(ply, pos, angles, fov)
	local view = {}
	
	local FT = FrameTime()
	local CurrentTime = CurTime()
	local wep = ply:GetActiveWeapon()
	
	if ply:OnGround() and IsValid(wep) and wep:GetClass():find("^ta_") then
		if ply:KeyDown(IN_SPEED) and ply:GetVelocity():Length() > ply:GetWalkSpeed() then
			PAPR = 0.5
			YAPR = 0.5
			RAPR = 0.5
			PT = 1.5 * math.cos(CurrentTime * 10)
			YT = 1.5 * math.sin(CurrentTime * 10)
			RT = 1.5 * math.cos(CurrentTime * 10)
			
		elseif ply:GetVelocity():Length() < ply:GetRunSpeed() and ply:GetVelocity():Length() > 50 and not ply:KeyDown(IN_SPEED) then
			PAPR = 0.25
			YAPR = 0.25
			RAPR = 0.05
			PT = 0.15 * math.cos(CurrentTime * 10)
			YT = 0.15 * math.sin(CurrentTime * 10)
			RT = 0
		elseif wep:GetDTInt(3) == 1 and ply:GetVelocity():Length() < ply:GetRunSpeed() and ply:GetVelocity():Length() > 50 and not ply:KeyDown(IN_SPEED) then
			PAPR = 0.25
			YAPR = 0.25
			RAPR = 0.05
			PT = 0.1 * math.cos(CurrentTime * 10)
			YT = 0.1 * math.sin(CurrentTime * 10)
			RT = 0
		else
			PAPR = 0.05
			YAPR = 0.05
			PAPR = 0.05
			PT = 0
			YT = 0
			RT = 0
		end
				
		if ply:KeyDown(IN_SPEED) and ply:GetVelocity():Length() > ply:GetWalkSpeed() then
			if ply:KeyDown(IN_FORWARD) then
				PT2 = math.Approach(PT2, 3.5, 0.5)
			elseif ply:KeyDown(IN_BACK) then
				PT2 = math.Approach(PT2, -3.5, 0.5)
			else
				PT2 = math.Approach(PT2, 0, 0.5)
			end
			
			if ply:KeyDown(IN_MOVELEFT) then
				RT2 = math.Approach(RT2, -3.5, 0.5)
			elseif ply:KeyDown(IN_MOVERIGHT) then
				RT2 = math.Approach(RT2, 3.5, 0.5)
			else
				RT2 = math.Approach(RT2, 0, 0.5)
			end
		else
			PT2 = math.Approach(PT2, 0, 0.7)
			RT2 = math.Approach(RT2, 0, 0.7)
		end
				
	else
		PAPR = 0.05
		YAPR = 0.05
		PAPR = 0.05
		PT = 0
		YT = 0
		RT = 0
		PT2 = math.Approach(PT2, 0, 0.7)
		RT2 = math.Approach(RT2, 0, 0.7)
	end
	
	local wep = wep
	
	if IsValid(wep) then
		if wep:GetClass():find("^ta_") then
			local vm = ply:GetViewModel()
			local eyeang = ply:EyeAngles()
			local activity = wep:GetSequenceActivityName(wep:GetSequence())
				
			if ply.attachment then
				if GetConVarNumber("ta_viewbob_reload") > 0 and (activity == "ACT_VM_RELOAD" or activity == "ACT_VM_RELOAD_SILENCED") or GetConVarNumber("ta_viewbob_silencer") > 0 and (activity == "ACT_VM_ATTACH_SILENCER" or activity == "ACT_VM_DETACH_SILENCER") or GetConVarNumber("ta_viewbob_draw") > 0 and (activity == "ACT_VM_DRAW" or activity == "ACT_VM_DRAW_SILENCED") then
					if lastanim != activity or lastwep != wep then
						animplayed = false
					end
					
					lastanim = activity
					lastwep = wep
					
					if CurrentTime > time and animplayed == false then
						time = CurrentTime + vm:SequenceDuration() - 0.3
						animplayed = true
					end
					
					if activity == "ACT_VM_RELOAD" or activity == "ACT_VM_RELOAD_SILENCED" then
						CurWeaponAngleMod = wep.ReloadAngleMod or 1
					elseif activity == "ACT_VM_DRAW" or activity == "ACT_VM_DRAW_SILENCED" then
						CurWeaponAngleMod = wep.DrawAngleMod or 1
					elseif activity == "ACT_VM_ATTACH_SILENCER" or activity == "ACT_VM_DETACH_SILENCER" then
						CurWeaponAngleMod = wep.SilencerAngleMod or 1
					end
				else
					animplayed = false
					time = 0
				end
			end
				
			if CurrentTime < time then
				WeaponAngle = math.Approach(WeaponAngle, ply.attachment.Ang.p * 0.15, FT * 70)
			else
				WeaponAngle = Lerp(FT * 10, WeaponAngle, 0)
					//WeaponAngle = math.Approach(WeaponAngle, 0, FT * 50)
			end
		else
			WeaponAngle = Lerp(FT * 10, WeaponAngle, 0)
			time = 0
			animplayed = true
			lastwep = ""
		end
	else
		WeaponAngle = Lerp(FT * 10, WeaponAngle, 0)
		time = 0
		animplayed = true
		lastwep = ""
	end
	
	PitchMod = math.Approach(PitchMod, PT, PAPR)
	YawMod = math.Approach(YawMod, YT, YAPR)
	RollMod = math.Approach(RollMod, RT, RAPR)
	
	view.angles = angles + Angle(PitchMod + PT2 + (WeaponAngle * ((wep.PitchMod or 1) * CurWeaponAngleMod)), YawMod, RollMod + RT2 + (WeaponAngle * ((wep.RollMod or 1) * CurWeaponAngleMod)))
	
	view.origin = pos
	view.fov = fov
	
	if ( IsValid( wep ) ) then
	
		local func = wep.GetViewModelPosition
		if ( func ) then
			view.vm_origin,  view.vm_angles = func( wep, pos * 1, angles * 1 ) // Note: *1 to copy the object so the child function can't edit it.
		end
		
		local func = wep.CalcView
		if ( func ) then
			view.origin, view.angles, view.fov = func( wep, ply, pos * 1, angles * 1, fov ) // Note: *1 to copy the object so the child function can't edit it.
		end
	
	end
	
	return GAMEMODE:CalcView( ply, view.origin, view.angles, view.fov )
end

hook.Add("CalcView", "TA_ViewShake", TA_ViewShake)


function TA_HurtBlur(x, y, fwd, spin)
	Blur = Lerp(0.15, Blur, 0)
	
	return x, y, Blur, spin
end

hook.Add( "GetMotionBlurValues", "TA_HurtBlur", TA_HurtBlur )

local function TA_ReceiveInfo(um)
	local ply = um:ReadEntity()

	ply.MaxHealth = um:ReadShort()
	ply.MaxArmor = um:ReadShort()
	ply.Class = um:ReadString()
end

usermessage.Hook("RPTINFO", TA_ReceiveInfo)

local UpMod = 15
local ForwardMod = 0
local SideMod = 15
local RollMod = 0

local function TA_ReceiveRespawnTime(um)
	TimeToRespawn = um:ReadShort()
	HardCoreMode = um:ReadShort()
end

usermessage.Hook("RSP", TA_ReceiveRespawnTime)

local function TA_ReceiveEndGameStatus(um)
	EndGameStatus = um:ReadBool()
	NextMap = um:ReadString()
	CurRound = um:ReadShort()
	TotalRounds = um:ReadShort()
	EndGameClass = nil
	TotalTime = nil
	local ply = LocalPlayer()
	
	for k, v in pairs(player.GetAll()) do
		v.IsVIP = false
	end
	
	if NextMap == "none" then
		MapChangeTime = CurTime() + 25
	else
		MapChangeTime = CurTime() + 30
	end
	
	if EndGameStatus == false then
		if ply:Team() == TEAM_REBELS then
			surface.PlaySound("ta/obj_failed.mp3")
		else
			surface.PlaySound("ta/obj_completed.mp3")
		end
	elseif EndGameStatus == true then
		if ply:Team() == TEAM_COMBINE then
			surface.PlaySound("ta/obj_failed.mp3")
		else
			surface.PlaySound("ta/obj_completed.mp3")
		end
	end
end

usermessage.Hook("EndGame", TA_ReceiveEndGameStatus)


local function TA_ReceiveDataStatus(um)
	//local string1 = um:ReadString()
	
	//if string1 != "none" then
	EndGameClass = um:ReadString()
	//end
	
	GamestateUpdateTime = CurTime() + 7
	
	if LocalPlayer():Team() == TEAM_REBELS then
		timer.Simple(5, function()
			surface.PlaySound("ta/rebels/upl_" .. EndGameClass .. ".mp3")
		end)
	end
end

usermessage.Hook("EGSTAT", TA_ReceiveDataStatus)

local function TA_DataStatus(um)
	local num = um:ReadShort()
	local hacker = um:ReadEntity()
	local ply = LocalPlayer()
	
	if num == 1 then
	
		if ply:Team() == TEAM_COMBINE then
			NextSound = "ta/combine/data_dl_warning" .. math.random(1, 3) .. ".mp3"
			GAMEMODE:AddNotify("The Rebels are stealing our data!", NOTIFY_HINT, 5)
		elseif ply:Team() == TEAM_REBELS then
			NextSound = "ta/rebels/data_dl_warning" .. math.random(1, 3) .. ".mp3"
			//surface.PlaySound("ta/event.mp3")
			GAMEMODE:AddNotify(hacker:Nick() .. " is downloading the data!", NOTIFY_HINT, 5)
		end
		
	elseif num == 2 then
	
		if ply:Team() == TEAM_COMBINE then
			NextSound = "ta/combine/data_dl_interrupted" .. math.random(1, 3) .. ".mp3"
		elseif ply:Team() == TEAM_REBELS then
			NextSound = "ta/rebels/data_dl_interrupted" .. math.random(1, 3) .. ".mp3"
			//surface.PlaySound("ta/event.mp3")
		end
		
		GAMEMODE:AddNotify("The download was interrupted!", NOTIFY_ERROR, 5)
		
	elseif num == 3 then
	
		if ply:Team() == TEAM_COMBINE then
			NextSound = "ta/combine/data_dl_finished" .. math.random(1, 3) .. ".mp3"
		elseif ply:Team() == TEAM_REBELS then
			NextSound = "ta/rebels/data_dl_done" .. math.random(1, 4) .. ".mp3"
			//surface.PlaySound("ta/event.mp3")
		end
		
		GAMEMODE:AddNotify(hacker:Nick() .. " has finished downloading the data!", NOTIFY_HINT, 5) -- reveal who has downloaded it since it doesn't matter anyway
		
	elseif num == 4 then
	
		if ply:Team() == TEAM_COMBINE then
			NextSound = "ta/combine/data_upl_warning" .. math.random(1, 3) .. ".mp3"
			GAMEMODE:AddNotify("The Rebels are uploading our data!", NOTIFY_HINT, 5)
		elseif ply:Team() == TEAM_REBELS then
			surface.PlaySound("ta/event.mp3")
			GAMEMODE:AddNotify(hacker:Nick() .. " is uploading the data!", NOTIFY_HINT, 5)
		end
		
	elseif num == 5 then
	
		if ply:Team() == TEAM_COMBINE then
			NextSound = "ta/combine/data_upl_interrupted" .. math.random(1, 3) .. ".mp3"
		elseif ply:Team() == TEAM_REBELS then
			surface.PlaySound("ta/event.mp3")
		end
		
		GAMEMODE:AddNotify("The upload was interrupted!", NOTIFY_ERROR, 5)
	
	elseif num == 6 then
	
		if ply:Team() == TEAM_COMBINE then
			NextSound = "ta/combine/data_upl_finished" .. math.random(1, 3) .. ".mp3"
		elseif ply:Team() == TEAM_REBELS then
			surface.PlaySound("ta/event.mp3")
		end
		
		GAMEMODE:AddNotify(hacker:Nick() .. " has finished uploading the data!", NOTIFY_HINT, 5) -- reveal who has uploaded it since it doesn't matter anyway
	end
	
	timer.Simple(0.1, function()
		if CurTime() > NextNotify then
			NextNotify = CurTime() + 3
		end
	end)
end

usermessage.Hook("UPDDT", TA_DataStatus)

local function TA_ReceiveVIP(um)
	local vip = um:ReadEntity()
	
	for k, v in pairs(player.GetAll()) do
		v.IsVIP = false
	end
	
	vip.IsVIP = true
	
	GAMEMODE:AddNotify(vip:Nick() .. " is the VIP! Protect him at any cost!", NOTIFY_HINT, 10)
	chat.AddText(Color(75, 175, 255), vip:Nick() .. " is the VIP!", Color(255, 255, 255), " Protect him at any cost!")
end

usermessage.Hook("ReportVIP", TA_ReceiveVIP)

local function TA_NoSuicide()
	GAMEMODE:AddNotify("No suicide for you, sorry.", NOTIFY_ERROR, 4)
	surface.PlaySound("buttons/button10.wav")
end

usermessage.Hook("NoSCD", TA_NoSuicide)

local function TA_TimeLeft(um)
	TotalTime = um:ReadShort()
end

usermessage.Hook("TimeLeft", TA_TimeLeft)

local function TA_PlayerKill(um)
	local victim = um:ReadEntity()
	local killer = um:ReadEntity()
	local self = LocalPlayer()
	
	if victim == self then
		if killer:IsPlayer() then
		
			if killer == self then
				KillText = "You have suicided."
			else
				KillText = "You were killed by " .. killer:Nick()
			end
			
		else
			KillText = "You have suicided."
		end
	else
		KillText = "You have killed " .. victim:Nick()
	end
	
	KillAlpha = 255
	KillAlphaTime = CurTime() + 3
end

usermessage.Hook("PKill", TA_PlayerKill)

local function TA_DoAction(um)
	local entity = um:ReadEntity()
	local entity2 = um:ReadEntity()
	local number = um:ReadShort()
	local ply = LocalPlayer()
	
	ActionPointNotify = false
	
	if number == 1 then
	
		ActionText = "You have repaired your own armor"
		
	elseif number == 2 then
	
		if entity != ply then
			ActionText = "You have repaired " .. entity:Nick() .. "'s armor."
			ActionPointNotify = true
		else
			ActionText = entity2:Nick() .. " has repaired your armor."
		end
		
	elseif number == 3 then
	
		ActionText = "You have resupplied your own ammo"
		
	elseif number == 4 then
	
		if entity != ply then
			ActionText = "You have resupplied " .. entity:Nick() .. "'s ammo."
			ActionPointNotify = true
		else
			ActionText = entity2:Nick() .. " gave you some ammo."
		end
		
	elseif number == 5 then
	
		if entity != ply then
			ActionText = "You gave " .. entity:Nick() .. " a medkit."
			ActionPointNotify = true
		else
			ActionText = entity2:Nick() .. " gave you a medkit."
		end
		
	end
	
	ActionTextDelay = CurTime() + 2.5
	ActionTextAlpha = 255
end

usermessage.Hook("ACT", TA_DoAction)

local function TA_GAYROLL(um)
	local ply = um:ReadEntity()
	LocalPlayer():EmitSound("ta/gracefulroll.mp3", 100, 100) -- because surface.PlaySound is too quiet
	chat.AddText(Color(0, 240, 255), ply:Nick(), Color(255, 255, 255), " just did a ", Color(255, 0, 229), "**GRACEFUL ROLL**")
end

usermessage.Hook("GAY", TA_GAYROLL)

local function TA_WhoIs(um) -- I added this in so that some faget wouldn't go around claiming that he's the creator of the gamemode, as if that matters, lol
	local ply = um:ReadEntity()
	chat.AddText(Color(0, 240, 255), ply:Nick(), Color(255, 255, 255), " is the creator of this gamemode!")
	chat.AddText(Color(0, 200, 70), "And he is on the server!")
end

usermessage.Hook("WHOIS", TA_WhoIs)

local function TA_HelpMeWithCharge(um)
	timer.Simple(1, function()
		chat.AddText(Color(255, 255, 255), "Press your ", Color(74, 175, 255), "UNDO KEY ", Color(255, 255, 255), "to detonate your charge.")
		GAMEMODE:AddNotify("Press your UNDO KEY to detonate your charge.", NOTIFY_HINT, 6)
		surface.PlaySound("buttons/button9.wav")
	end)
end

usermessage.Hook("C4HELP", TA_HelpMeWithCharge)

function TA_HelpMeWithWallRun()
    if Help_WallRunDelay > CurTime() then return end
	GAMEMODE:AddNotify("Walk up to a wall and hold down your JUMP KEY to wall-run.", NOTIFY_HINT, 6)
	chat.AddText(Color(255, 255, 255), "Walk up to a wall and hold down your ", Color(74, 175, 255), "JUMP KEY ", Color(255, 255, 255), "to wall-run.")
	surface.PlaySound("buttons/button9.wav")
	
	timer.Simple(5, function()
		GAMEMODE:AddNotify("Holding down your JUMP KEY will let you grab onto ledges.", NOTIFY_HINT, 6)
		chat.AddText(Color(255, 255, 255), "Holding down your ", Color(74, 175, 255), "JUMP KEY ", Color(255, 255, 255), "will let you grab onto ledges.")
		surface.PlaySound("buttons/button9.wav")
	end)
	
	Help_WallRunDelay = CurTime() + 360
end

function TA_HelpMeWithPullSelfUp()
    if Help_PullSelfUpDelay > CurTime() then return end
	timer.Simple(0.5, function()
		GAMEMODE:AddNotify("While grabbed on to a ledge, press your JUMP KEY to pull yourself up.", NOTIFY_HINT, 6)
		chat.AddText(Color(255, 255, 255), "While grabbed on to a ledge, press your ", Color(74, 175, 255), "JUMP KEY ", Color(255, 255, 255), "to pull yourself up.")
		surface.PlaySound("buttons/button9.wav")
	end)
	
	timer.Simple(6, function()
		GAMEMODE:AddNotify("Holding down DIRECTIONAL KEYS (strafe left/strafe right) will make you shimmy along the ledge.", NOTIFY_HINT, 6)
		chat.AddText(Color(255, 255, 255), "Holding down  ", Color(74, 175, 255), "DIRECTIONAL KEYS (strafe left/strafe right) ", Color(255, 255, 255), "will make you shimmy along the ledge.")
		surface.PlaySound("buttons/button9.wav")
	end)
	
	Help_PullSelfUpDelay = CurTime() + 360
end

function TA_HelpMeWithRolls()
    if Help_RollDelay > CurTime() then return end
	GAMEMODE:AddNotify("While falling down from a lethal height, LOOK DOWN and hold down your CROUCH KEY to do a roll.", NOTIFY_HINT, 6)
	chat.AddText(Color(255, 255, 255), "While falling down from a lethal height, ", Color(74, 175, 255), "LOOK DOWN ", Color(255, 255, 255), "and hold down your ", Color(74, 175, 255), "CROUCH KEY ", Color(255, 255, 255), "to do a roll.")
	surface.PlaySound("buttons/button9.wav")
	
	Help_RollDelay = CurTime() + 360
end

function TA_HelpMeWithHealth()
    if Help_Health > CurTime() then return end
	GAMEMODE:AddNotify("When you're low on health, press your Spawn Menu key (Yours - " .. QMenuKey .. ") to use your medkit.", NOTIFY_HINT, 6)
	chat.AddText(Color(255, 255, 255), "When you're low on health, press your ", Color(74, 175, 255), "Spawn Menu key (Yours - " .. QMenuKey .. ")", Color(255, 255, 255), " to use your medkit")
	surface.PlaySound("buttons/button9.wav")
	
	Help_Health = CurTime() + 360
end

function TA_HelpMeWithActions()
    if Help_Actions < CurTime() then return end
	GAMEMODE:AddNotify("Press your Context Menu key (Yours - " .. CMenuKey .. ") to perform a class-based action.", NOTIFY_HINT, 6)
	chat.AddText(Color(255, 255, 255), "Press your ", Color(74, 175, 255), "Context Menu key (Yours - " .. CMenuKey .. ")", Color(255, 255, 255), " to perform a class-based action.")
	surface.PlaySound("buttons/button9.wav")
	
	Help_Actions = CurTime() + 360
end

function TA_HelpMeWithM203()
    if Help_M203 > CurTime() then return end
	GAMEMODE:AddNotify("To use M203, press your USE KEY and your PRIMARY ATTACK KEY at the same time. After that, aim down the sights and fire.", NOTIFY_HINT, 7)
	chat.AddText(Color(255, 255, 255), "To use M203, press your ", Color(75, 175, 255), "USE KEY", Color(255, 255, 255), " and your ", Color(75, 175, 255), "PRIMARY ATTACK KEY", Color(255, 255, 255), "at the same time. After that, ", Color(75, 175, 255), "aim down the sights and fire.")
	surface.PlaySound("buttons/button9.wav")
	
	Help_M203 = CurTime() + 360
end

local function TA_ReceiveUnlockable(um)
	local UN = um:ReadShort() -- UN stands for UnlockableNumber
	local SkillPoints = um:ReadShort()
	local ply = LocalPlayer()
	
	ply.SkillPoints = SkillPoints
	
	if IsValid(SkillPoint) then
		SkillPoint:SetText("Skill points: " .. ply.SkillPoints)
	end
	
	for k, v in pairs(perks) do
		if UN == v.number then
			v.unlocked = true
			
			if IsValid(LastPressedSkillTree) then
				LastPressedSkillTree.Unlocked = true
			end
			
			BlockSkillTreeButton = false
			surface.PlaySound("buttons/button9.wav")
			
			break
		end
	end
end

usermessage.Hook("UNLCK", TA_ReceiveUnlockable)

local function TA_ReceiveUnlockableFail()
	BlockSkillTreeButton = false
	surface.PlaySound("buttons/button10.wav")
end

usermessage.Hook("UNLCKFAIL", TA_ReceiveUnlockableFail)

local function TA_LevelUp(um)
	local ExpToLevel = um:ReadShort()
	local Level = um:ReadShort()
	local SkillPoints = um:ReadShort()
	local ply = LocalPlayer()

	chat.AddText(Color(255, 255, 255), "Level ", Color(74, 175, 255), Level .. " reached", Color(255, 255, 255), "! You have ", Color(74, 175, 255), SkillPoints .. " skill point(s)", Color(255, 255, 255), "!")
	GAMEMODE:AddNotify("Level " .. Level .. " reached! You have " .. SkillPoints .. " skill point(s)!", NOTIFY_HINT, 6)
	ply:EmitSound("ta/level_up.mp3", 80, 100)
	ply.Exp = 0
	ply.RequiredExp = ExpToLevel
	ply.Level = Level
	ply.SkillPoints = SkillPoints
end

usermessage.Hook("LVLUP", TA_LevelUp)

local function TA_ReceiveLevelInfo(um)
	local Exp = um:ReadShort()
	local ExpToLevel = um:ReadShort()
	local Level = um:ReadShort()
	local SkillPoints = um:ReadShort()
	local ply = LocalPlayer()
	
	ply.Exp = Exp
	ply.RequiredExp = ExpToLevel
	ply.Level = Level
	ply.SkillPoints = SkillPoints
end

usermessage.Hook("LVLINFO", TA_ReceiveLevelInfo)

local function TA_ReceiveEXP(um)
	local XP = um:ReadShort()
	local XPFor = um:ReadShort()
	local ply = LocalPlayer()
	
	ply.Exp = ply.Exp + XP
	
	if Exp then
		Exp = Exp + XP
		ExpFadeTime = CurTime() + 2.5
		ExpAlpha = 255
	end
	
	if XPFor > 0 then
		ActionTextAlpha = 255
		ActionTextDelay = CurTime() + 2.5
	end
	
	if XPFor == 1 then -- this is horrible, but I was too lazy to add a function that would do it for me
		ActionText = "Eliminating the VIP"
	elseif XPFor == 2 then
		ActionText = "Escorting the VIP"
	elseif XPFor == 3 then
		ActionText = "Protecting the Escort Node"
	elseif XPFor == 4 then
		ActionText = "Protecting the Terminals"
	elseif XPFor == 5 then
		ActionText = "Downloading the Data"
	elseif XPFor == 6 then
		ActionText = "Helping the Downloader"
	elseif XPFor == 7 then
		ActionText = "Uploading the Data"
	elseif XPFor == 8 then
		ActionText = "Helping the Uploader"
	elseif XPFor == 9 then
		ActionText = "Protecting the Supply Depot"
	elseif XPFor == 10 then
		ActionText = "Destroying a Food Crate"
	elseif XPFor == 11 then
		ActionText = "Destroying a Weapon Cache"
	elseif XPFor == 12 then
		ActionText = "Winning a Team Deathmatch round"
	elseif XPFor == 13 then
		ActionText = "Kill assist"
	elseif XPFor == 14 then
		ActionText = "Destroying the Rebel Supply Depot"
	end
end

usermessage.Hook("XP", TA_ReceiveEXP)

local function TA_ReceiveLives(um)
	LocalPlayer().Lives = um:ReadShort()
end

usermessage.Hook("LVS", TA_ReceiveLives)
