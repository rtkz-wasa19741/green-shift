

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoAimpoint = true
	SWEP.NoACOG = true
	SWEP.NoEOTech = true
	SWEP.NoDocter = true
	
	SWEP.BulletLength = 9
	SWEP.CaseLength = 19
end

if ( CLIENT ) then

	SWEP.PrintName			= "Beretta 92FS"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 1
	SWEP.SlotPos			= 1
	SWEP.IconLetter			= "c"
	SWEP.DifType = true
	SWEP.Muzzle = "cstm_muzzle_pistol"
	SWEP.SparkEffect = "cstm_child_sparks_small"
	SWEP.SmokeEffect = "cstm_child_smoke_small"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_m92fs")
	
	killicon.Add( "cstm_pistol_m92fs", "VGUI/kills/kill_m92fs", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "Bitch_Controller", rel = "", pos = Vector(0.086, -2.082, 3.706), angle = Angle(0, 0, -90), size = Vector(0.05, 0.05, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "weapon", pos = Vector(10.944, -0.564, 3.842), angle = Angle(-90, 0, 0), size = Vector(0.05, 0.05, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_pist_beretta92.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.519, 1.625, 0.356), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.MeleeOffset = {
		['v_weapon_Right_Arm'] = {vector = Vector(1.4249999523163, 3.7320001125336, -3.6010000705719), angle = Vector(11.538000106812, 19.64999961853, -118.2379989624)},
		['v_weapon_Root25'] = {vector = Vector(0, -0.22499999403954, 0), angle = Vector(0, 0, 0)},
		['v_weapon_Right_Index01'] = {vector = Vector(-0.15000000596046, 0, 0), angle = Vector(0, -30.861999511719, 0)},
		['v_weapon_Right_Index02'] = {vector = Vector(0, 0, 0), angle = Vector(0, -28.64999961853, 0)},
		['v_weapon_Right_Index03'] = {vector = Vector(0, 0, 0), angle = Vector(0, -62.012001037598, 0)},
		['v_weapon_Right_Middle01'] = {vector = Vector(0, 0, 0), angle = Vector(0, -33.168998718262, 0)},
		['v_weapon_Right_Middle02'] = {vector = Vector(0, 0, 0), angle = Vector(0, -30.812999725342, 0)},
		['v_weapon_Right_Middle03'] = {vector = Vector(0, 0, 0), angle = Vector(0, -43.537998199463, 0)},
		['v_weapon_Right_Ring01'] = {vector = Vector(0, 0, 0), angle = Vector(0, -44.5, 0)},
		['v_weapon_Right_Ring02'] = {vector = Vector(0, 0, 0), angle = Vector(0, -17.461999893188, 0)},
		['v_weapon_Right_Ring03'] = {vector = Vector(0, 0, 0), angle = Vector(0, -34.14400100708, 0)},
		['v_weapon_Right_Pinky01'] = {vector = Vector(0, 0, 0), angle = Vector(0, -36.319000244141, 0)},
		['v_weapon_Right_Pinky02'] = {vector = Vector(0, 0, 0), angle = Vector(0, -22.424999237061, 0)},
		['v_weapon_Right_Pinky03'] = {vector = Vector(0, 0, 0), angle = Vector(0, -31.924999237061, 0)},
		['v_weapon_Right_Thumb01'] = {vector = Vector(0, 0, 0), angle = Vector(-4.6810002326965, 18.761999130249, 0)},
		['v_weapon_Right_Thumb02'] = {vector = Vector(0, 0, 0), angle = Vector(0, 18.586999893188, 0)},
		['v_weapon_Right_Thumb03'] = {vector = Vector(0, 0, 0), angle = Vector(0, 33.493999481201, 0)} }
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_pist_beretta92.mdl"
SWEP.WorldModel = "models/weapons/w_pist_fiveseven.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/beretta92fs/fire.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 22
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 15
SWEP.Primary.Delay			= 0.15
SWEP.Primary.DefaultClip	= 15
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "pistol"
SWEP.InitialHoldtype = "pistol"
SWEP.InHoldtype = "pistol"
SWEP.NoAuto = true
SWEP.ACOGStatus = -1
SWEP.NoBoltAnim = true
SWEP.MaxAmmo = 60

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.AnimPrefix = "glock_"
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.25 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 0.5
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
SWEP.VelocitySensivity		= 0.95 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone 		= 0.026
SWEP.HipCone 				= 0.04
SWEP.ConeInaccuracyAff1 = 0.5

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(2.773, -1.157, 1.529)
SWEP.AimAng = Vector(0, 0, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ReflexPos = Vector(4.324, -3.056, 2.563)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.FlipOriginsPos = Vector(1.36, 0, -0.52)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.RunPosPistol = Vector(-1.149, -10.82, -6.722)
SWEP.RunAngPistol = Vector(70, 0, 0)

SWEP.MeleePos = Vector(-2.681, 0, -0.04)
SWEP.MeleeAng = Vector(0, 0, 0)

util.PrecacheSound("weapons/makarov/maginscratch.wav")
util.PrecacheSound("weapons/makarov/magout.wav")
util.PrecacheSound("weapons/makarov/magintap.wav")
util.PrecacheSound("weapons/makarov/makarov-1.wav")
util.PrecacheSound("weapons/makarov/slideback.wav")
util.PrecacheSound("weapons/makarov/slideforward.wav")
util.PrecacheSound("weapons/makarov/sliderelease.wav")