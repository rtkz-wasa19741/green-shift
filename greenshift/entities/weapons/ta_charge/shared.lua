if( SERVER ) then
	AddCSLuaFile( "shared.lua" );
end

if( CLIENT ) then
	SWEP.PrintName = "C4 Charge";
	SWEP.Slot = 2;
	SWEP.SlotPos = 0;
	SWEP.DrawAmmo = false;
	SWEP.DrawCrosshair = false;
	SWEP.BounceWeaponIcon = false
	SWEP.BombType = 0
end

SWEP.Author			= "-[SB]- Spy"
SWEP.Instructions	= "Primary attack to place, draw weapon again to detonate."
SWEP.Contact		= ""
SWEP.Purpose		= ""

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/v_c4.mdl"
SWEP.WorldModel = "models/weapons/w_c4.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

-------------Primary Fire Attributes----------------------------------------
SWEP.Primary.Delay			= 0.9 	--In seconds
SWEP.Primary.Recoil			= 0		--Gun Kick
SWEP.Primary.Damage			= 15	--Damage per Bullet
SWEP.Primary.NumShots		= 1		--Number of shots per one fire
SWEP.Primary.Cone			= 0 	--Bullet Spread
SWEP.Primary.ClipSize		= 0	--Use "-1 if there are no clips"
SWEP.Primary.DefaultClip	= -1	--Number of shots in next clip
SWEP.Primary.Automatic   	= false	--Pistol fire (false) or SMG fire (true)
SWEP.Primary.Ammo         	= "slam"	--Ammo Type
 
-------------Secondary Fire Attributes-------------------------------------
SWEP.Secondary.Delay		= 0.9
SWEP.Secondary.Recoil		= 0
SWEP.Secondary.Damage		= 0
SWEP.Secondary.NumShots		= 1
SWEP.Secondary.Cone			= 0
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic   	= false
SWEP.Secondary.Ammo         = "none"

SWEP.MaxAmmo = 1
SWEP.MotionSensorMode = 0 
SWEP.PlantSpeedMul = 1

function SWEP:Initialize()
	self.Weapon:SetWeaponHoldType("slam")
end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	self.Weapon:SetNextSecondaryFire(CurTime() + 1)
	
	if CLIENT then
		if not self.Weapon.BombModel then
			self.Weapon.BombModel = ClientsideModel("models/weapons/w_c4_planted.mdl", RENDERGROUP_BOTH)
			self.Weapon.BombModel:SetPos(self.Owner:GetPos())
			self.Weapon.BombModel:SetNoDraw(false)
		end
	end
	
	return true
end

function SWEP:Holster()
	
	if CLIENT then
		SafeRemoveEntity(self.Weapon.BombModel)
		self.Weapon.BombModel = nil
	end
	
	return true
end

function SWEP:Precache()
end

function SWEP:OnRemove()
	if CLIENT then
		SafeRemoveEntity(self.Weapon.BombModel)
		self.Weapon.BombModel = nil
	end
end

BombAlpha = 0

function SWEP:Think()
	if CLIENT then
		local Bomb = self.Weapon.BombModel
		
		if Bomb then
			local tracedata = {}
			tracedata.start = self.Owner:GetShootPos()
			tracedata.endpos = tracedata.start + self.Owner:GetAimVector() * 50
			tracedata.filter = self.Owner
			
			local trace = util.TraceLine(tracedata)
			
			Bomb:SetPos(trace.HitPos) -- always keep the position
			Bomb:SetColor(120, 255, 0, BombAlpha) -- green'ish
			
			if trace.Hit and trace.HitNormal.z == 0 then
				Bomb:SetAngless(trace.HitNormal:Angle() + Angle(-90, 90, 90))
				BombAlpha = Lerp(0.1, BombAlpha, 150)
			else
				BombAlpha = Lerp(0.1, BombAlpha, 0)
			end
		end
	end
end

function SWEP:PrimaryAttack()
	if self.Owner:GetAmmoCount("slam") == 0 then
		return
	end
	
	if SERVER then
		if self.Owner.Charge then
			return
		end
	
		local tracedata = {}
		tracedata.start = self.Owner:GetShootPos()
		tracedata.endpos = tracedata.start + self.Owner:GetAimVector() * 50
		tracedata.filter = self.Owner
				
		local trace = util.TraceLine(tracedata)
		
		self.Weapon:SetNextPrimaryFire(CurTime() + 0.25)
		
		if trace.Hit and not trace.Entity:IsPlayer() and not trace.Entity:GetPhysicsObject():IsMoveable() and trace.HitNormal.z == 0 then
		
			self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
			self.Owner:GetViewModel():SetPlaybackRate(self.Weapon.PlantSpeedMul)
			self.Weapon:SetNextPrimaryFire(CurTime() + 4 / self.Weapon.PlantSpeedMul)
		
			timer.Simple(3 / self.Weapon.PlantSpeedMul, function()
				if not self.Owner:Alive() or self.Weapon == nil or self.Owner:GetActiveWeapon():GetClass() != self.Weapon:GetClass() then
					return
				end
			
				local tracedata = {}
				tracedata.start = self.Owner:GetShootPos()
				tracedata.endpos = tracedata.start + self.Owner:GetAimVector() * 50
				tracedata.filter = self.Owner
						
				local trace = util.TraceLine(tracedata) -- run the trace again, to make sure that the player won't end up placing the bomb in the air
				
				if trace.Hit and not trace.Entity:IsPlayer() and not trace.Entity:GetPhysicsObject():IsMoveable() and trace.HitNormal.z == 0 then
				
					local charge = ents.Create("ta_activated_charge")
					charge:SetPos(trace.HitPos)
					charge:SetAngless(trace.HitNormal:Angle() + Angle(-90, 90, 90))
					charge.MotionSensitive = self.Weapon.MotionSensor
					charge:Spawn()
					charge.EntOwner = self.Owner
					charge.MotionSensorMode = self.Weapon.MotionSensorMode
					
					self.Owner.Charge = charge
					self.Owner:EmitSound("weapons/c4/c4_plant.wav", 75, 100)
					SendUserMessage("REMCMDL", self.Owner)
					self:TakePrimaryAmmo(1)
					self.Owner:SetAnimation(PLAYER_ATTACK1)
					
					if tonumber(self.Owner:GetInfo("ta_tips")) > 0 then
						SendUserMessage("C4HELP", self.Owner)
					end
					
					if self.Owner:IsValid() then
						for k, v in pairs(self.Owner:GetWeapons()) do
							if v:GetClass():find("^ta_rif") or v:GetClass():find("^ta_smg") or v:GetClass():find("^ta_shotgun") then
								self.Owner:SelectWeapon(v:GetClass())
								break
							end
						end
					end
				else
					self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
					self.Weapon:SetNextPrimaryFire(CurTime() + 0.8)
					self.Weapon:SetNextSecondaryFire(CurTime() + 0.8)
				end
				
			end)
			
		end
	end
end

function SWEP:SecondaryAttack()
	if SERVER then
		if self.Weapon.MotionSensorMode == 2 then
		
			self.Weapon.MotionSensorMode = 0
			
			umsg.Start("BOTP", self.Owner)
				umsg.Short(0)
			umsg.End()
			
		elseif self.Weapon.MotionSensorMode == 0 then
		
			self.Weapon.MotionSensorMode = 1
			
			umsg.Start("BOTP", self.Owner)
				umsg.Short(1)
			umsg.End()
		else
		
			self.Weapon.MotionSensorMode = 2
			
			umsg.Start("BOTP", self.Owner)
				umsg.Short(2)
			umsg.End()
			
		end
		
		self.Weapon:SetNextSecondaryFire(CurTime() + 0.25)
	end
end

if CLIENT then
	local function TA_RemoveCModels()
		for k, v in pairs(ents.FindByClass("ta_charge")) do
			SafeRemoveEntity(v.BombModel)
			v.BombModel = nil
		end
	end
	
	usermessage.Hook("REMCMDL", TA_RemoveCModels)
	
	local function TA_ReceiveBombType(um)
		local ply = LocalPlayer()
		local wep = ply:GetActiveWeapon()
	
		if IsValid(ply) and IsValid(wep) then
			wep.BombType = um:ReadShort()
		end
	end
	
	usermessage.Hook("BOTP", TA_ReceiveBombType)
	
	local Text = "Remote-detonated"
	local AdditionalX = 0
	
	function SWEP:DrawHUD()
		if self.Weapon.BombType == 0 then
			Text = "Remote-detonated"
			AdditionalX = 0
		elseif self.Weapon.BombType == 1 then
			Text = "Motion-sensitive"
			AdditionalX = -15
		elseif self.Weapon.BombType == 2 then
			Text = "Remote-detonated + motion-sensitive"
			AdditionalX = 80
		end
		
		draw.RoundedBox(6, ScrW() * 0.5 - (60 + AdditionalX * 0.5), ScrH() * 0.9, 120 + AdditionalX, 30, Color(0, 0, 0, 230))
		draw.SimpleText(Text, "DefaultSmallDropShadow", ScrW() * 0.5, ScrH() * 0.9 + 15, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)	
	end
end
