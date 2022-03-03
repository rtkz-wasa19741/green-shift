

if ( SERVER ) then
	AddCSLuaFile( "shared.lua" )
	SWEP.HasRail = true
	SWEP.NoAimpoint = true
	SWEP.NoACOG = true
	SWEP.NoEOTech = true
	
	SWEP.BulletLength = 9
	SWEP.CaseLength = 19
end

if ( CLIENT ) then

	SWEP.PrintName			= "Glock-18"			
	SWEP.Author				= "Counter-Strike"
	SWEP.Slot				= 1
	SWEP.SlotPos			= 1
	SWEP.IconLetter			= "c"
	SWEP.DifType = true
	SWEP.RollMod = 0.5
	SWEP.Muzzle = "cstm_muzzle_pistol"
	SWEP.SparkEffect = "cstm_child_sparks_small"
	SWEP.SmokeEffect = "cstm_child_smoke_small"
	
	SWEP.WepSelectIcon = surface.GetTextureID("VGUI/kills/kill_glock18_new")
	
	killicon.Add( "ta_pistol_glock", "VGUI/kills/kill_glock18_new", Color( 255, 80, 0, 255 ) )
	
	SWEP.VElements = {
		["aimpointdot"] = { type = "Sprite", sprite = "effects/redflare", bone = "Glock_Slide", rel = "", pos = Vector(0.016, -0.426, 1.082), size = { x = 0.3, y = 0.3 }, color = Color(255, 255, 255, 0), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/doctorrds.mdl", bone = "Glock_Slide", rel = "", pos = Vector(-0.232, -0.144, 0.524), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "Glock", rel = "", pos = Vector(0.057, -3.889, 1.613), angle = Angle(0, 0, -90), size = Vector(0.05, 0.05, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["aimpoint"] = { type = "Model", model = "models/wystan/attachments/doctorrds.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.362, 1.799, -3.445), angle = Angle(0, 90, 180), size = Vector(1.299, 1.299, 1.299), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["silencer"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.307, 1.45, -2.994), angle = Angle(-90, 0, 0), size = Vector(0.05, 0.05, 0.15), color = Color(255, 255, 255, 0), surpresslightning = false, material = "models/bunneh/silencer", skin = 0, bodygroup = {} },
		["weapon"] = { type = "Model", model = "models/weapons/w_cstm_glock18.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.437, 1.042, 0.513), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.MeleeOffset = {
		['Dummy03'] = {vector = Vector(4.856999874115, 4.7119998931885, 7.8000001907349), angle = Vector(27.788000106812, -42.575000762939, -78.337997436523)},
		['Bone26'] = {vector = Vector(0, 0, 0), angle = Vector(43.474998474121, 0, 0)},
		['Bone31'] = {vector = Vector(0, 0, -0.44999998807907), angle = Vector(-33.450000762939, 0, 0)},
		['Bone32'] = {vector = Vector(0, 0, 0), angle = Vector(-55.305999755859, 0, 0)},
		['Bone33'] = {vector = Vector(0, 0, 0), angle = Vector(-28.305999755859, 0, 0)},
		['Bone35'] = {vector = Vector(0, 0, -0.7940000295639), angle = Vector(-43.549999237061, 0, 0)},
		['Bone36'] = {vector = Vector(0, 0, 0), angle = Vector(-32.793998718262, 0, 0)},
		['Bone37'] = {vector = Vector(0, 0, 0), angle = Vector(-28.437999725342, 0, 0)},
		['Bone39'] = {vector = Vector(0, 0, -0.53100001811981), angle = Vector(-44.174999237061, 0, 0)},
		['Bone40'] = {vector = Vector(0, 0, 0), angle = Vector(-29.305999755859, 0, 0)},
		['Bone41'] = {vector = Vector(0, 0, 0), angle = Vector(-24.738000869751, 0, 0)},
		['Bone43'] = {vector = Vector(0, 0, 0), angle = Vector(-40.825000762939, 0, 0)},
		['Bone44'] = {vector = Vector(0, 0, 0), angle = Vector(-49.381000518799, 0, 0)},
		['Bone44'] = {vector = Vector(0, 0, 0), angle = Vector(-49.381000518799, 0, 0)},
		['Bone27'] = {vector = Vector(0, 0, 0), angle = Vector(-11.875, 24.738000869751, 0)},
		['Bone28'] = {vector = Vector(0, 0, 0), angle = Vector(0, 12.10000038147, 0)},
		['Bone29'] = {vector = Vector(0, 0, 0), angle = Vector(0, 19.64999961853, 0)} }
	
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "ta_base_pistol"
SWEP.Category = "Extra Customizable Weaponry"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ViewModel = "models/weapons/v_cstm_glock18.mdl"
SWEP.WorldModel = "models/weapons/w_pist_glock18.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = false
SWEP.ViewModelBonescales = {}

SWEP.Weight				= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Sound			= Sound("weapons/glock18/glock18-1.wav")
SWEP.Primary.Recoil			= 0.3
SWEP.Primary.Damage			= 13
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 19
SWEP.Primary.Delay			= 0.0545
SWEP.Primary.DefaultClip	= 19
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "pistol"
SWEP.InitialHoldtype = "pistol"
SWEP.InHoldtype = "pistol"
SWEP.ACOGStatus = -1
SWEP.NoBoltAnim = true

-- Animation speed/custom reload function related
SWEP.IsReloading = false
SWEP.AnimPrefix = "glock_"
SWEP.ReloadSpeed = 1
SWEP.ShouldBolt = false
SWEP.ReloadDelay = 0
SWEP.IncAmmoPerc = 0.2 -- Amount of frames required to pass (in percentage) of the reload animation for the weapon to have it's amount of ammo increased
SWEP.MaxAmmo = 57

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
SWEP.VelocitySensivity		= 0.9 -- Percentage of how much the cone increases depending on the player's velocity (moving speed). Rifles - 100%; SMGs - 80%; Pistols - 60%; Shotguns - 20%
SWEP.HeadbobMul 			= 1
SWEP.IsSilenced 			= false
SWEP.IronsightsCone 		= 0.027
SWEP.HipCone 				= 0.04
SWEP.ScopeCone = 0.022
SWEP.ConeInaccuracyAff1 = 0.5

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.IsUsingIronsights 		= false
SWEP.TargetMul = 0
SWEP.SetAndForget			= false

SWEP.IronSightsPos = Vector(6.0749, -5.5216, 2.3984)
SWEP.IronSightsAng = Vector(2.5174, -0.0099, 0)

SWEP.AimPos = Vector(2.806, -0.806, 1.717)
SWEP.AimAng = Vector(0.174, 0, 0)

SWEP.ChargePos = Vector (5.4056, -10.3522, -4.0017)
SWEP.ChargeAng = Vector (-1.7505, -55.5187, 68.8356)

SWEP.ReflexPos = Vector(2.812, -2.632, 1.319)
SWEP.ReflexAng = Vector(0, 0, 0)

SWEP.FlipOriginsPos = Vector(1.36, 0, -0.52)
SWEP.FlipOriginsAng = Vector(0, 0, 0)

SWEP.MeleePos = Vector(-2.721, 0, -0.601)
SWEP.MeleeAng = Vector(0, 0, 0)

SWEP.RunPosPistol = Vector(-2.623, -9.837, -7.049)
SWEP.RunAngPistol = Vector(70, 0, 0)

util.PrecacheSound("weapons/makarov/maginscratch.wav")
util.PrecacheSound("weapons/makarov/magout.wav")
util.PrecacheSound("weapons/makarov/magintap.wav")
util.PrecacheSound("weapons/makarov/makarov-1.wav")
util.PrecacheSound("weapons/makarov/slideback.wav")
util.PrecacheSound("weapons/makarov/slideforward.wav")
util.PrecacheSound("weapons/makarov/sliderelease.wav")