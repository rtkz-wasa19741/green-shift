

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoDocter = true
	SWEP.NoACOG = true
	SWEP.NoAimpoint = true
	SWEP.DoesntDropRail = true
	
	SWEP.BulletLength = 6
	SWEP.CaseLength = 35
end

if ( CLIENT ) then

	SWEP.PrintName			= "KAC PDW"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "q"
	SWEP.NoProperIronsights = true
	SWEP.DifType = true
	SWEP.PitchMod = -0.5
	SWEP.Muzzle = "cstm_muzzle_smg"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_kac")
	
	killicon.Add( "cstm_smg_kacpdw", "VGUI/kills/kill_kac", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "Body", pos = Vector(-0.019, -2.257, -15.888), angle = Angle(0, 0, 0), size = Vector(0.059, 0.059, 0.159), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "Body", pos = Vector(-0.004, -4.398, -0.076), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "Body", pos = Vector(-0.257, 8.23, 9.73), angle = Angle(-85.556, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", pos = Vector(17.361, 1.486, -6.613), angle = Angle(-99.488, 0, 0), size = Vector(0.059, 0.059, 0.159), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "ValveBiped.Bip01_R_Hand", pos = Vector(-1.15, 1.7, 6.763), angle = Angle(-13.933, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_rif_perdw.mdl", bone = "ValveBiped.Bip01_R_Hand", pos = Vector(-1.094, 1.156, -0.113), angle = Angle(-9.488, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.NoRail = true
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_rif_perdw.mdl"
SWEP.WorldModel = "models/weapons/w_smg_ump45.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/kac/kac-1.wav")
SWEP.Primary.Recoil			= 0.8
SWEP.Primary.Damage			= 22
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.1
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"
SWEP.InitialHoldtype = "smg"
SWEP.InHoldtype = "smg"
SWEP.SilencedSound = Sound("weapons/g36c/g36c_sil.wav")
SWEP.SilencedVolume = 74

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.NoBoltAnim = true
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.36 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.PlaybackRate = 1.5
SWEP.MaxAmmo = 90

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 0.7
SWEP.CurCone				= 0.028
SWEP.DecreaseRecoilTime 	= 0
SWEP.ConeAff1 				= 0 -- Crouching/standing
SWEP.ConeAff2 				= 0 -- Using ironsights
SWEP.ViewPunchCycle 		= 0
SWEP.ViewPunchDelay			= 0
SWEP.WalkPunchCycle			= 0
SWEP.WalkPunchDelay 		= 0
SWEP.UnConeTime				= 0 -- Amount of time after firing the last shot that needs to pass until accuracy increases
SWEP.FinalCone				= 0 -- Self explanatory
SWEP.VelocitySensivity		= 1.4 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone			= 0.027
SWEP.HipCone 				= 0.04
SWEP.ScopeCone = 0.019
SWEP.InaccAff1				= 0.45
SWEP.ConeInaccuracyAff1 = 0.55

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(2.94, -2.787, 1.491)
SWEP.AimAng = Vector(0.574, 0.006, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ReflexPos = Vector(-2.846, -3.444, 1.065)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.NoFlipOriginsPos = Vector(-2, 0, 0.519)
SWEP.NoFlipOriginsAng = Vector(0, 0, 0)

SWEP.RunPosNoFlip = Vector(4.59, -8.362, -0.493)
SWEP.RunAngNoFlip = Vector(0, 70, 0)

util.PrecacheSound("weapons/mp7/mp7_magin.wav")
util.PrecacheSound("weapons/mp7/mp7_magout.wav")
util.PrecacheSound("weapons/mp7/mp7_charger.wav")
util.PrecacheSound("weapons/mp7/mp7_stockpull.wav")
util.PrecacheSound("weapons/mp7/mp7_switch.wav")
util.PrecacheSound("weapons/mp7/mp7-1.wav")