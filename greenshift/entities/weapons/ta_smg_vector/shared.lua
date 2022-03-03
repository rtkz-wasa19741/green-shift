

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoDocter = true
	SWEP.NoACOG = true
	SWEP.NoAimpoint = true
	SWEP.DoesntDropRail = true
	
	SWEP.BulletLength = 11.5
	SWEP.CaseLength = 22.8
end

if ( CLIENT ) then

	SWEP.PrintName			= "TDI Vector"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "q"
	SWEP.DifType = true
	SWEP.RollMod = 0.5
	SWEP.DrawAngleMod = -1
	SWEP.Muzzle = "cstm_muzzle_smg"
	SWEP.SparkEffect = "cstm_child_sparks_small"
	SWEP.SmokeEffect = "cstm_child_smoke_small"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_vector")
	
	killicon.Add( "cstm_smg_vector", "VGUI/kills/kill_vector", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "body", pos = Vector(-0, -5.7, 0.694), angle = Angle(0, 0, -90), size = Vector(0.05, 0.05, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "body", pos = Vector(0.014, 0.813, 3.862), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "body", pos = Vector(-0.25, 10.788, -8.763), angle = Angle(4.443, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", pos = Vector(-1.119, 1.243, 6.912), angle = Angle(-4.444, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", pos = Vector(17.419, 1.187, -2.026), angle = Angle(-90, 0, 0), size = Vector(0.05, 0.05, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_smg_kriss.mdl", pos = Vector(-1.576, 0.768, 0.25), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.NoRail = true
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_smg_kriss.mdl"
SWEP.WorldModel = "models/weapons/w_smg_ump45.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/kriss/kriss-1.wav")
SWEP.Primary.Recoil			= 0.8
SWEP.Primary.Damage			= 16
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 30
SWEP.Primary.Delay			= 0.06
SWEP.Primary.DefaultClip	= 30
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "HelicopterGun"
SWEP.InitialHoldtype = "smg"
SWEP.InHoldtype = "smg"

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.NoBoltAnim = true
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.4 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
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
SWEP.VelocitySensivity		= 1 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone			= 0.032
SWEP.HipCone 				= 0.045
SWEP.ScopeCone = 0.026
SWEP.InaccAff1				= 0.45
SWEP.ConeInaccuracyAff1 = 0.55

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(3.969, -2.623, 1.82)
SWEP.AimAng = Vector(0, 0.959, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ReflexPos = Vector(3.953, -3.899, 1.287)
SWEP.ReflexAng = Vector(0, 0.959, 0)

SWEP.FlipOriginsPos = Vector(2.92, 0, -0.12)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.RunPos = Vector(-5.082, -6.886, -1.311)
SWEP.RunAng = Vector(0, -70, 0)

util.PrecacheSound("weapons/kriss/clipin.wav")
util.PrecacheSound("weapons/kriss/clipout.wav")
util.PrecacheSound("weapons/kriss/boltpull.wav")
util.PrecacheSound("weapons/kriss/dropclip.wav")
util.PrecacheSound("weapons/kriss/kriss-1.wav")
util.PrecacheSound("weapons/kriss/magrel.wav")
util.PrecacheSound("weapons/kriss/unfold.wav")