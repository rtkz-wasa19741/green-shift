

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoAimpoint = true
	SWEP.NoACOG = true
	SWEP.NoEOTech = true
	SWEP.NoDocter = true
	
	SWEP.BulletLength = 9
	SWEP.CaseLength = 18
end

if ( CLIENT ) then

	SWEP.PrintName			= "Pistolet Makarova"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 1
	SWEP.SlotPos			= 1
	SWEP.IconLetter			= "c"
	SWEP.DifType = true
	SWEP.Muzzle = "cstm_muzzle_pistol"
	SWEP.SparkEffect = "cstm_child_sparks_small"
	SWEP.SmokeEffect = "cstm_child_smoke_small"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_makarov")
	
	killicon.Add( "cstm_pistol_makarov", "VGUI/kills/kill_makarov", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "frame", pos = Vector(-1.438, 1, 0.112), angle = Angle(90, 0, 0), size = Vector(0.05, 0.05, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", pos = Vector(9.105, 1.644, -3.164), angle = Angle(-90, 0, 0), size = Vector(0.05, 0.05, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_pist_mkrv.mdl", pos = Vector(-1.862, 0.593, 0.194), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.MeleeOffset = {
		['Bone01'] = {vector = Vector(11.156000137329, 5.7309999465942, 0.098999999463558), angle = Vector(0, -37.099998474121, 0)},
		['frame'] = {vector = Vector(-2.4240000247955, 2.944000005722, -1.1310000419617), angle = Vector(0, -37.099998474121, 0)} }
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_pist_mkrv.mdl"
SWEP.WorldModel = "models/weapons/w_pist_p228.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/makarov/makarov-1.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 15
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 8
SWEP.Primary.Delay			= 0.125
SWEP.Primary.DefaultClip	= 8
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "Gravity"
SWEP.InitialHoldtype = "pistol"
SWEP.InHoldtype = "pistol"
SWEP.NoAuto = true
SWEP.ACOGStatus = -1
SWEP.NoBoltAnim = true

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.AnimPrefix = "glock_"
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.4 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.MaxAmmo = 64

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 0.25
SWEP.CurCone				= 0.04
SWEP.DecreaseRecoilTime 	= 0
SWEP.ConeAff1 				= 0 -- Crouching/standing
SWEP.ConeAff2 				= 0 -- Using ironsights
SWEP.ViewPunchCycle 		= 0
SWEP.ViewPunchDelay			= 0
SWEP.WalkPunchCycle			= 0
SWEP.WalkPunchDelay 		= 0
SWEP.UnConeTime				= 0 -- Amount of time after firing the last shot that needs to pass until accuracy increases
SWEP.FinalCone				= 0 -- Self explanatory
SWEP.VelocitySensivity		= 0.6 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone 		= 0.032
SWEP.HipCone 				= 0.043
SWEP.ConeInaccuracyAff1 = 0.5

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(2.595, -1.619, 1.429)
SWEP.AimAng = Vector(0, 0, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ReflexPos = Vector(4.324, -3.056, 2.563)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.FlipOriginsPos = Vector(1.36, 0, -0.52)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.RunPosPistol = Vector(0, 2.295, 4.59)
SWEP.RunAngPistol = Vector(-28.689, 0, 0)

SWEP.MeleePos = Vector(0.36, 0, 0.2)
SWEP.MeleeAng = Vector(0, 0, 0)

util.PrecacheSound("weapons/makarov/maginscratch.wav")
util.PrecacheSound("weapons/makarov/magout.wav")
util.PrecacheSound("weapons/makarov/magintap.wav")
util.PrecacheSound("weapons/makarov/makarov-1.wav")
util.PrecacheSound("weapons/makarov/slideback.wav")
util.PrecacheSound("weapons/makarov/slideforward.wav")
util.PrecacheSound("weapons/makarov/sliderelease.wav")