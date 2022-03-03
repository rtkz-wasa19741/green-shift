

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoAimpoint = true
	SWEP.NoACOG = true
	SWEP.NoEOTech = true
	SWEP.NoDocter = true
	SWEP.DrawAngleMod = 0.5
	
	SWEP.BulletLength = 7.65
	SWEP.CaseLength = 17
end

if ( CLIENT ) then

	SWEP.PrintName			= "Skorpion vz. 61"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "m"
	SWEP.DifType = true
	SWEP.Muzzle = "cstm_muzzle_smg"
	SWEP.SparkEffect = "cstm_child_sparks_small"
	SWEP.SmokeEffect = "cstm_child_smoke_small"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_skorpion")
	
	killicon.Add( "cstm_smg_skorpion", "VGUI/kills/kill_skorpion", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "Body", pos = Vector(0.013, 2.049, 8.218), angle = Angle(0, 0, 0), size = Vector(0.039, 0.039, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", pos = Vector(12.461, 1.536, -3.893), angle = Angle(-90, 0, 0), size = Vector(0.039, 0.039, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_smg_skorp.mdl", pos = Vector(-0.426, 1.131, 0.119), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end

SWEP.HoldType			= "pistol"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_smg_skorp.mdl"
SWEP.WorldModel = "models/weapons/w_smg_mp5.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/Skorpion/Skr-1.wav")
SWEP.Primary.Recoil			= 0.4
SWEP.Primary.Damage			= 14
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 20
SWEP.Primary.Delay			= 0.07
SWEP.Primary.DefaultClip	= 20
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "pistol"
SWEP.InitialHoldtype = "smg"
SWEP.InHoldtype = "smg"

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.NoBoltAnim = true
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.5 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.PlaybackRate = 1.6
SWEP.MaxAmmo = 120

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 0.5
SWEP.CurCone				= 0.038
SWEP.DecreaseRecoilTime 	= 0
SWEP.ConeAff1 				= 0 -- Crouching/standing
SWEP.ConeAff2 				= 0 -- Using ironsights
SWEP.ViewPunchCycle 		= 0
SWEP.ViewPunchDelay			= 0
SWEP.WalkPunchCycle			= 0
SWEP.WalkPunchDelay 		= 0
SWEP.UnConeTime				= 0 -- Amount of time after firing the last shot that needs to pass until accuracy increases
SWEP.FinalCone				= 0 -- Self explanatory
SWEP.VelocitySensivity		= 0.7 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone			= 0.032
SWEP.HipCone 				= 0.038
SWEP.InaccAff1				= 0.5
SWEP.ConeInaccuracyAff1 = 0.55

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(3.938, -2.182, 1.848)
SWEP.AimAng = Vector(0.319, 0.043, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.RunPos = Vector(0, 3.934, 3.607)
SWEP.RunAng = Vector(-20.657, 0, 0)

SWEP.FlipOriginsPos = Vector(2.599, 0, -0.48)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

util.PrecacheSound("weapons/skorpion/skr_magin.wav")
util.PrecacheSound("weapons/skorpion/skr_magout.wav")
util.PrecacheSound("weapons/skorpion/skr_cock.wav")
util.PrecacheSound("weapons/skorpion/skr-1.wav")
