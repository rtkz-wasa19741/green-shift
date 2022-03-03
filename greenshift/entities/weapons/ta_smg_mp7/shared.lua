

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoDocter = true
	SWEP.NoACOG = true
	SWEP.NoAimpoint = true
	SWEP.DoesntDropRail = true
	SWEP.CantSilence = true
	
	SWEP.BulletLength = 4.6
	SWEP.CaseLength = 30
end

if ( CLIENT ) then

	SWEP.PrintName			= "Steyr MP7"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "q"
	SWEP.Muzzle = "cstm_muzzle_smg"
	SWEP.SparkEffect = "cstm_child_sparks_small"
	SWEP.SmokeEffect = "cstm_child_smoke_small"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_mp7")
	
	killicon.Add( "cstm_smg_mp7", "VGUI/kills/kill_mp7", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "body", pos = Vector(-0.57, -4.744, -0.01), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "body", pos = Vector(9.605, 7.881, 0.25), angle = Angle(180, -4.444, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", pos = Vector(-6.712, 0.962, 6.394), angle = Angle(-4.444, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_smg_mp7.mdl", pos = Vector(-1.344, 0.375, 1.776), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.NoRail = true
	SWEP.Silenced = 1
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_xtra_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_smg_mp7.mdl"
SWEP.WorldModel = "models/weapons/w_smg_ump45.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/mp7/mp7-1.wav")
SWEP.Primary.Recoil			= 0.8
SWEP.Primary.Damage			= 12
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 40
SWEP.Primary.Delay			= 0.063
SWEP.Primary.DefaultClip	= 40
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "pistol"
SWEP.InitialHoldtype = "smg"
SWEP.InHoldtype = "smg"
SWEP.UnsilencedVolume = 70
SWEP.Volume = 60

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.NoBoltAnim = true
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.4 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.PlaybackRate = 1.5
SWEP.MaxAmmo = 120

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 0.64
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
SWEP.VelocitySensivity		= 1.2 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone			= 0.03
SWEP.HipCone 				= 0.04
SWEP.ScopeCone = 0.024
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

SWEP.ReflexPos = Vector(2.96, -5.41, 0.904)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.FlipOriginsPos = Vector(1.639, 0, -0.08)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.RunPos = Vector(-5.082, -6.886, -1.311)
SWEP.RunAng = Vector(0, -70, 0)

util.PrecacheSound("weapons/mp7/mp7_magin.wav")
util.PrecacheSound("weapons/mp7/mp7_magout.wav")
util.PrecacheSound("weapons/mp7/mp7_charger.wav")
util.PrecacheSound("weapons/mp7/mp7_stockpull.wav")
util.PrecacheSound("weapons/mp7/mp7_switch.wav")
util.PrecacheSound("weapons/mp7/mp7-1.wav")