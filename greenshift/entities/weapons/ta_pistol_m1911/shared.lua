

if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoAimpoint = true
	SWEP.NoACOG = true
	SWEP.NoEOTech = true
	
	SWEP.BulletLength = 11.5
	SWEP.CaseLength = 22.8
end

if ( CLIENT ) then

	SWEP.PrintName			= "M1911 .45"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 1
	SWEP.SlotPos			= 1
	SWEP.IconLetter			= "f"
	SWEP.DifType = true
	SWEP.PitchMod = 1
	SWEP.ReloadAngleMod = -0.7
	SWEP.Muzzle = "cstm_muzzle_pistol"
	SWEP.SparkEffect = "cstm_child_sparks_medium"
	SWEP.SmokeEffect = "cstm_child_smoke_medium"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_m1911")
	
	killicon.Add( "cstm_pistol_m1911", "VGUI/kills/kill_m1911", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "Slide", pos = Vector(0.017, 0.2, 1.199), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "Frame", pos = Vector(0.018, 5.55, 2.22), angle = Angle(0, 0, 90), size = Vector(0.05, 0.05, 0.17), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/doctorrds.mdl", bone = "Slide", pos = Vector(0.273, 0.68, 0.6), angle = Angle(0, 180, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/doctorrds.mdl", bone = "ValveBiped.Bip01_R_Hand", pos = Vector(4.561, 1.843, -4.08), angle = Angle(0, 90, 180), size = Vector(1.299, 1.299, 1.299), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", pos = Vector(10.562, 1.544, -3.412), angle = Angle(-90, 0, 0), size = Vector(0.059, 0.059, 0.18), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_pist_cm1911.mdl", bone = "ValveBiped.Bip01_R_Hand", pos = Vector(-0.976, 0.944, 0.105), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.MeleeOffset = {
		['Dummy17'] = {vector = Vector(5.856999874115, 5.4990000724792, -4.3680000305176), angle = Vector(-86.962997436523, -5.6810002326965, 0)},
		['Bone82'] = {vector = Vector(0, 0, 0), angle = Vector(14.281000137329, 0, 0)},
		['Bone80'] = {vector = Vector(0, 0, 0), angle = Vector(60.09400177002, 0, 0)},
		['Bone79'] = {vector = Vector(0, 0, 0), angle = Vector(67.313003540039, 0, 0)},
		['Bone73'] = {vector = Vector(0, 0, 0), angle = Vector(11.630999565125, 9.9750003814697, -14.418999671936)},
		['Bone84'] = {vector = Vector(0, 0, 0), angle = Vector(37.743000030518, 0, 0)},
		['Bone85'] = {vector = Vector(0, 0, 0), angle = Vector(30.238000869751, 0, 0)},
		['Bone87'] = {vector = Vector(0, 0, 0), angle = Vector(20.25, 0, 0)},
		['Bone88'] = {vector = Vector(0, 0, 0), angle = Vector(20.700000762939, 0, 0)},
		['Bone89'] = {vector = Vector(0, 0, 0), angle = Vector(65.375999450684, 0, 0)},
		['Bone91'] = {vector = Vector(0, 0, 0), angle = Vector(32.14400100708, 0, 0)},
		['Bone92'] = {vector = Vector(0, 0, 0), angle = Vector(43.525001525879, 0, 0)},
		['Bone93'] = {vector = Vector(0, 0, 0), angle = Vector(39.918998718262, 0, 0)},
		['Bone96'] = {vector = Vector(0, 0, 0), angle = Vector(20.77499961853, 11.663000106812, 0)},
		['Bone95'] = {vector = Vector(0, 0, 0), angle = Vector(0, 21.049999237061, 0)} }
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_pist_cm1911.mdl"
SWEP.WorldModel = "models/weapons/w_pist_deagle.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/colt/fire.wav")
SWEP.Primary.Recoil			= 1.65
SWEP.Primary.Damage			= 27
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 7
SWEP.Primary.Delay			= 0.22
SWEP.Primary.DefaultClip	= 7
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "HelicopterGun"
SWEP.InitialHoldtype = "pistol"
SWEP.InHoldtype = "pistol"
SWEP.NoAuto = true
SWEP.NoBoltAnim = true
SWEP.SilencedSound = Sound("weapons/g3/g3-1.wav")
SWEP.SilencedVolume = 75

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.AnimPrefix = ""
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.42 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.PlaybackRate = 2
SWEP.MaxAmmo = 28

-- Dynamic accuracy related
SWEP.ShotsAmount 			= 0
SWEP.ConeDecAff				= 0
SWEP.DefRecoil				= 1.65
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
SWEP.VelocitySensivity		= 1 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone 		= 0.028
SWEP.HipCone 				= 0.042
SWEP.ScopeCone 				= 0.023
SWEP.ConeInaccuracyAff1 = 0.5

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(2.601, -0.165, 1.067)
SWEP.AimAng = Vector(0.131, 0, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ReflexPos = Vector(2.599, -1, 0.693)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.RunPosPistol = Vector(-3.116, -8.69, -9.016)
SWEP.RunAngPistol = Vector(70, 0, 0)

SWEP.FlipOriginsPos = Vector(1.12, 2.786, 0.119)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.ACOGPos = Vector(2.71, -2.132, 0.75)
SWEP.ACOGAng = Vector(0, 0, 0)

SWEP.MeleePos = Vector(-1.8, 0, -0.64)
SWEP.MeleeAng = Vector(0, 0, 0)