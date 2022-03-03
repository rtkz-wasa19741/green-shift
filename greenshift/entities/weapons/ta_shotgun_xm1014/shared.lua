

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.NoAimpoint = true
	SWEP.NoACOG = true
	SWEP.NoDocter = true
	SWEP.HasRail = true
	SWEP.DoesntDropRail = true
	
	SWEP.BulletLength = 2
	SWEP.CaseLength = 10.5
end

if ( CLIENT ) then

	SWEP.PrintName			= "XM1014"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 0
	SWEP.SlotPos			= 0
	SWEP.IconLetter			= "B"
	SWEP.Muzzle = "cstm_muzzle_br"
	SWEP.SmokeEffect = "cstm_child_smoke_large"
	SWEP.SparkEffect = "cstm_child_sparks_large"
	
	killicon.AddFont( "cstm_shotgun_xm1014", "CSKillIcons", SWEP.IconLetter, Color( 255, 80, 0, 255 ) )
	
	
	SWEP.VElements = {
		["eotechdot"] = { type = "Sprite", sprite = "sprites/eotech_reddot", bone = "v_weapon.xm1014_Parent", pos = Vector(0.05, 5.3, 3.437), size = { x = 0.7, y = 0.7 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", bone = "v_weapon.xm1014_Parent", pos = Vector(-0.207, -7.308, -6.519), angle = Angle(94.319, 90, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["eotech"] = { type = "Model", model = "models/wystan/attachments/eotech557sight.mdl", pos = Vector(21.738, 0, 6.711), angle = Angle(183, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.NoRail = true
	
end

SWEP.HoldType			= "shotgun"
SWEP.Base				= "ta_base_shotgun"
//SWEP.Category			= "Condition SWEPs (TEST)"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.HoldType = "shotgun"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_shot_xm1014.mdl"
SWEP.WorldModel = "models/weapons/w_shot_xm1014.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/xm1014/xm1014-1.wav")
SWEP.Primary.Recoil			= 5
SWEP.Primary.Damage			= 4
SWEP.Primary.NumShots		= 12
SWEP.Primary.Cone			= 0.12
SWEP.Primary.ClipSize		= 7
SWEP.Primary.Delay			= 0.3
SWEP.Primary.DefaultClip	= 7
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "buckshot"
SWEP.InitialHoldtype = "shotgun"
SWEP.InHoldtype = "shotgun"

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.45 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.CantSilence = true
SWEP.MaxAmmo = 21

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 6
SWEP.CurCone				= 0.12
SWEP.DecreaseRecoilTime 	= 0
SWEP.ConeAff1 				= 0 -- Crouching/standing
SWEP.ConeAff2 				= 0 -- Using ironsights
SWEP.ViewPunchCycle 		= 0
SWEP.ViewPunchDelay			= 0
SWEP.WalkPunchCycle			= 0
SWEP.WalkPunchDelay 		= 0
SWEP.UnConeTime				= 0 -- Amount of time after firing the last shot that needs to pass until accuracy increases
SWEP.FinalCone				= 0 -- Self explanatory
SWEP.VelocitySensivity		= 0.2-- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.PumpSound				= true
SWEP.IronsightsCone = 0.07
SWEP.HipCone = 0.075
SWEP.ScopeCone = 0.06

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(5.157, -3.444, 2.151)
SWEP.AimAng = Vector(-0.131, 0.794, 0)

SWEP.ReflexPos = Vector(5.184, -3.438, 1.21)
SWEP.ReflexAng = Vector(0, 0.856, 0)
