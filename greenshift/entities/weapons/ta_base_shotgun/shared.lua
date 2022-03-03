
if (SERVER) then

	AddCSLuaFile( "shared.lua" )
	SWEP.Weight				= 5
	SWEP.AutoSwitchTo		= false
	SWEP.AutoSwitchFrom		= false

end

if ( CLIENT ) then

	SWEP.DrawAmmo			= true
	SWEP.DrawCrosshair		= false
	SWEP.ViewModelFOV		= 75
	SWEP.ViewModelFlip		= true
	SWEP.CSMuzzleFlashes	= true
	SWEP.PitchMod = 1
	SWEP.RollMod = 1
end

SWEP.Author			= "LEETNOOB"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= "PRIMARY ATTACK key to fire\nSECONDARY ATTACK key to toggle ironsights\nUSE key + SECONDARY ATTACK key - attach suppressor\nUSE key + RELOAD key - switch between semi-auto/auto firemodes (SMGs/ARs)"

// Note: This is how it should have worked. The base weapon would set the category
// then all of the children would have inherited that.
// But a lot of SWEPS have based themselves on this base (probably not on purpose)
// So the category name is now defined in all of the child SWEPS.
//SWEP.Category			= "Counter-Strike"

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.Primary.Sound			= Sound( "Weapon_AK47.Single" )
SWEP.Primary.Recoil			= 1.5
SWEP.Primary.Damage			= 40
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.02
SWEP.Primary.Delay			= 0.15

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"
SWEP.Base					= "ta_base_pistol"

function SWEP:Deploy()
	local time = CurTime()

	if SERVER then
		self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
		self.Owner:GetViewModel():SetPlaybackRate(self.Weapon.DrawSpeed)
	end
	
	self.Weapon:SetNextPrimaryFire(time + 1)
	self.Weapon:SetNextSecondaryFire(time + 1)
	self.Weapon.ReloadDelay = time + 1
	self.Weapon.MeleeDelay = time + 1
	
	return true
end
	
function SWEP:Reload()
	if self.Weapon.IsReloading == false then
		if self.Owner:GetAmmoCount(self.Primary.Ammo) > 0 then
			if self.Weapon:Clip1() < self.Primary.ClipSize then
				if CurTime() > self.Weapon.ReloadDelay then
					self.Weapon:StartCustomReload("start_reload", self.Weapon.ReloadSpeed)
					self.Weapon:SetDTInt(3, 0)
					if SERVER then
					
						for k, v in pairs(ents.FindInSphere(self.Owner:GetShootPos(), 192)) do
							if v:IsPlayer() and v:Team() == self.Owner:Team() and v != self.Owner then
								if self.Owner:Team() == TEAM_REBELS then
									if CurTime() > self.Owner.ReloadSayDelay then
										self.Owner:EmitSound("vo/npc/male01/coverwhilereload0" .. math.random(1, 2) .. ".wav", 70, math.random(99, 101))
										self.Owner.ReloadSayDelay = CurTime() + 2
									end
								end
								
								break
							end
						end
					
						if self.Owner:GetFOV() != 0 then
							self.Owner:SetFOV(0, 0.3)
						end
					end
				end
			end
		end
	end
end

function SWEP:StartCustomReload(anim, ReloadSpeed)

	local sequence = self.Owner:GetViewModel():LookupSequence(anim)
	self.Owner:GetViewModel():ResetSequence(sequence)
	self.Owner:GetViewModel():SetPlaybackRate(ReloadSpeed)
	if self.Weapon:Clip1() == 0 then
		self.Weapon.ShouldBolt = true
	end
	
	local AvailableReload = math.Clamp(self.Owner:GetAmmoCount(self.Primary.Ammo), 0, 1)
	timer.Simple((self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed) - 0.1, function()
		self.Weapon:InsertAmmo()
	end)
	self.Weapon.IsReloading = true
	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
end

function SWEP:InsertAmmo()
	local nick = self.Owner:Nick()
	
	if self.Owner:GetActiveWeapon():GetClass() != self.Weapon:GetClass() then
		return
	end
		
	local vm = self.Owner:GetViewModel()
	//vm:SetCycle(0)
	self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
	self.Weapon.MeleeDelay = CurTime() + 0.5
	
	if SERVER then
		timer.Create("ReloadTimer" .. nick, 0.02, 1, function()
			if not self.Weapon or not self.Owner or not self.Owner:Alive() or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass() then
				timer.Destroy("ReloadLogic" .. self.Owner:Nick())
			end
			
			//local sequence = vm:LookupSequence("insert")
			//vm:ResetSequence(sequence)
			self.Weapon:SendWeaponAnim(ACT_VM_RELOAD)
			vm:SetPlaybackRate(self.Weapon.ReloadSpeed)
		end)
			
		timer.Create("AmmoInc" .. nick, self.Weapon.IncAmmoPerc / self.Weapon.ReloadSpeed, 1, function()	
			if not self.Weapon or not self.Owner or not self.Owner:Alive() or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass() then
				timer.Destroy("ReloadLogic" .. self.Owner:Nick())
			end
			
			self.Weapon:SetClip1(self.Weapon:Clip1() + 1)
			self.Owner:RemoveAmmo(1, self.Primary.Ammo)
			self.Owner:SetAnimation(PLAYER_RELOAD)
		end)
		
		timer.Create("ReloadLogic" .. nick, (self.Weapon.IncAmmoPerc + 0.2) / self.Weapon.ReloadSpeed, 0, function()
			if not self.Weapon or not self.Owner or not self.Owner:Alive() or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass() then
				timer.Destroy("ReloadLogic" .. self.Owner:Nick())
			end
		
			if self.Weapon:Clip1() < self.Primary.ClipSize and self.Owner:GetAmmoCount(self.Primary.Ammo) - 1 > 0 then
				self.Weapon:InsertAmmo()
			else
				self.Weapon:FinishCustomReload(self.Weapon.ShouldBolt)
				timer.Destroy("AmmoInc" .. nick)
				timer.Destroy("ReloadLogic" .. nick)
				timer.Destroy("ReloadTimer" .. nick)
			end
		end)
	end
end

/*function SWEP:InsertAmmo()
	if self.Owner:GetActiveWeapon():GetClass() != self.Weapon:GetClass() then
		return
	end
		
	self.Weapon:SendWeaponAnim(ACT_VM_IDLE)
	
	timer.Create("ReloadTimer" .. self.Owner:Nick(), 0.02, 1, function()
		if not self.Weapon or not self.Owner or not self.Owner:Alive() or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass() then
			timer.Destroy("ReloadLogic" .. self.Owner:Nick())
		end
	
		local sequence = self.Owner:GetViewModel():LookupSequence("insert")
		self.Owner:GetViewModel():ResetSequence(sequence)
		self.Owner:GetViewModel():SetPlaybackRate(self.Weapon.ReloadSpeed)
	end)
		
	timer.Create("AmmoInc" .. self.Owner:Nick(), (self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed) - ((self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed) * self.Weapon.IncAmmoPerc), 1, function()	
		if not self.Weapon or not self.Owner or not self.Owner:Alive() or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass() then
			timer.Destroy("ReloadLogic" .. self.Owner:Nick())
		end
		
		self.Weapon:SetClip1(self.Weapon:Clip1() + 1)
		self.Owner:RemoveAmmo(1, self.Primary.Ammo)
		self.Owner:SetAnimation(PLAYER_RELOAD)
	end)
	
	timer.Create("ReloadLogic" .. self.Owner:Nick(), ((self.Owner:GetViewModel():SequenceDuration() - 0.2 / self.Weapon.ReloadSpeed) * self.Weapon.ReloadSpeed), 0, function()
		if not self.Weapon or not self.Owner or not self.Owner:Alive() or self.Weapon:GetClass() != self.Owner:GetActiveWeapon():GetClass() then
			timer.Destroy("ReloadLogic" .. self.Owner:Nick())
		end
	
		if self.Weapon:Clip1() < self.Primary.ClipSize and self.Owner:GetAmmoCount(self.Primary.Ammo) - 1 > 0 then
			self.Weapon:InsertAmmo()
		else
			self.Weapon:FinishCustomReload(self.Weapon.ShouldBolt)
			timer.Destroy("AmmoInc" .. self.Owner:Nick())
			timer.Destroy("ReloadLogic" .. self.Owner:Nick())
			timer.Destroy("ReloadTimer" .. self.Owner:Nick())
		end
	end)
end*/

function SWEP:FinishCustomReload(bolt)
	if bolt == false or self.Weapon.NoBoltAnim == true then
		self.Weapon.IsReloading = false
		self.Weapon.ShouldBolt = false
		local sequence = self.Owner:GetViewModel():LookupSequence("idle")
		self.Owner:GetViewModel():ResetSequence(sequence)
		self.Owner:GetViewModel():SetSequence(sequence)
		self.Owner:GetViewModel():SetPlaybackRate(self.Weapon.ReloadSpeed)
		self.Weapon:SetNextPrimaryFire(CurTime() + 0.3)
		self.Weapon:SetNextSecondaryFire(CurTime() + 0.3)
		self.Weapon.MeleeDelay = CurTime() + 0.3
	else
		self.Weapon:BoltWeaponry()
	end
end

function SWEP:BoltWeaponry()
	local sequence = self.Owner:GetViewModel():LookupSequence("after_reload")
	self.Owner:GetViewModel():ResetSequence(sequence)
	self.Owner:GetViewModel():SetSequence(sequence)
	self.Owner:GetViewModel():SetPlaybackRate(self.Weapon.ReloadSpeed)
	timer.Simple((self.Owner:GetViewModel():SequenceDuration() / self.Weapon.ReloadSpeed) - 0.2, function()
		self.Weapon.IsReloading = false
		self.Weapon.ShouldBolt = false
	end)
	self.Weapon:SetNextPrimaryFire(CurTime() + 0.8)
	self.Weapon:SetNextSecondaryFire(CurTime() + 0.8)
	self.Weapon.MeleeDelay = CurTime() + 0.8
end

function SWEP:PrimaryAttack()

	if self.Weapon.ShouldBolt == true or self.Weapon.IsReloading == true then
		self.Weapon:FinishCustomReload(self.Weapon.ShouldBolt)
		timer.Destroy("AmmoInc" .. self.Owner:Nick())
		timer.Destroy("ReloadLogic" .. self.Owner:Nick())
		timer.Destroy("ReloadTimer" .. self.Owner:Nick())
		return
	end
	
	if self.Weapon:Clip1() == 0 or self.Owner:WaterLevel() == 3 then
		self.Weapon:EmitSound("weapons/shotgun/shotgun_empty.wav", 65, math.random(99, 101))
		self.Weapon:SetNextSecondaryFire( CurTime() + 0.05 )
		self.Weapon:SetNextPrimaryFire( CurTime() + 0.25 )
		return
	end
	
	if self.Weapon:GetDTInt(3) == 2 then
		return
	end
	
	self.Weapon:SetNextSecondaryFire( CurTime() + self.Primary.Delay )
	self.Weapon:SetNextPrimaryFire( CurTime() + self.Primary.Delay )
	
	if ( !self:CanPrimaryAttack() ) then return end
	
	if SERVER then
		if self.Weapon.IsSilenced == false then
			self.Owner:EmitSound(self.Primary.Sound, 101, math.random(99, 101))
		else
			if self.Weapon.AltSilencedSound == true then
				self.Owner:EmitSound("weapons/scout/scout_fire-1.wav", 70, math.random(99, 101))
			else
				self.Owner:EmitSound(((self.Weapon:GetClass():find("^cstm_pistol_") or self.Weapon:GetClass():find("^cstm_smg_")) and "weapons/usp/usp1.wav") or "weapons/m4a1/m4a1-1.wav", 70, math.random(99, 101))
			end
		end
		
		if not game.SinglePlayer() then
			local ef = EffectData()
			ef:SetOrigin(self.Owner:GetShootPos())
			ef:SetEntity(self.Weapon)
			ef:SetAngles(self.Owner:GetAngles())
			//ef.Silenced = self.Weapon.IsSilenced
			util.Effect("ta_ef_muzzle", ef)
		end
	end
	
	self.Weapon.ReloadDelay = CurTime() + 0.5
	if self.Weapon:GetDTInt(3) != 1 then
		self:CSShootBullet( self.Primary.Damage, self.Primary.Recoil * 1.2, self.Primary.NumShots, self.Weapon:GetDTFloat(0))
	else
		self:CSShootBullet( self.Primary.Damage, self.Primary.Recoil * 0.75, self.Primary.NumShots, self.Weapon:GetDTFloat(0))
	end
	
	if self.Owner:Crouching() then
		ConeDecAff1 = 0.02
		self.Weapon.RecoilAff2 = 0.3
	else
		ConeDecAff1 = 0
		self.Weapon.RecoilAff2 = 0
	end
	
	if self.Weapon:GetDTInt(3) == 1 then
		ConeDecAff2 = 0.01
		self.Weapon.RecoilAff1 = 0.3
	else
		ConeDecAff2 = 0
		self.Weapon.RecoilAff1 = 0
	end
	
	self:TakePrimaryAmmo( 1 )
	
	if ( self.Owner:IsNPC() ) then return end
	
	self.Owner:ViewPunch( Angle(-1 * (self.Primary.Recoil + self.Weapon.ConeInaccuracy * 4) * (1 - (self.Weapon.RecoilAff1 + self.Weapon.RecoilAff2)), 0, 0 ) )
	
end
