ModUtil.RegisterMod("HadesRandomizer")
SaveIgnores["HadesRandomizer"] = true

local config = {
	ModName = "Hades Randomizer",
	RandomizePrimaryWeapons = true,
	RandomizeSecondaryWeapons = true,
	RandomizeCast = true,
}

if ModConfigMenu then
	ModConfigMenu.Register(config)
end

HadesRandomizer.config = config

local primary, secondary, cast, castRarity, weaponTrait1, weaponTrait2, weaponAspect, health, prevHealth

OnAnyLoad{function ()
	DebugPrint({Text = "HEALTH"..CurrentRun.Hero.Health})
	local currentWeaponInSlot = GetEquippedWeapon()
	
	if (primary ~= nil and secondary ~= nil) then
		RemoveActiveWeapons({primary, secondary})
		--UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = primary})
		--UnequipWeapon({ DestinationId = CurrentRun.Hero.ObjectId, Name = secondary})
	end
	
	--Config options primary weapon
	if config.RandomizePrimaryWeapons then
		primary = GetRandomPrimaryWeapon()
	else
		primary = GetEquippedWeapon()
	end

	--Config options secondary weapon
	if config.RandomizeSecondaryWeapons then
		secondary = GetRandomSecondaryWeapon()
	else
		secondary = ""
	end

	--Config options cast weapon
	if config.RandomizeCast then
		--Permanently remove currently equipped cast, as this should not be reapplied.
		if cast ~= nil then
			RemoveTrait( CurrentRun.Hero, cast )
		end
		cast, castRarity = GetRandomCast()
		DebugPrint({Text = "CAST: "..cast.."RARITY: "..castRarity})
		AddTraitToHero({TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = cast, Rarity = castRarity}) })
	else
		cast = ""
		castRarity = ""
	end
	
	DebugPrint({Text = "WEAPON PRIMARY "..primary})
	DebugPrint({Text = "WEAPON SECONDARY: "..secondary})
	SetEquippedWeapon(primary, secondary)

	--Permanently remove currently equipped weapon upgrade, as this should not be reapplied.
	if weaponAspect ~= nil then
		RemoveTrait(CurrentRun.Hero, weaponAspect)
	end
	weaponAspect = GetRandomweaponAspect( primary, secondary )
	DebugPrint({Text = "WEAPON TRAIT: "..weaponAspect})
	AddTraitToHero({ SkipNewTraitHighlight = skipTraitHighlight, TraitName = weaponAspect, Rarity = GetRarityKey(GetWeaponUpgradeLevel(currentWeaponInSlot, GetEquippedWeaponTraitIndex( currentWeaponInSlot ))) })

	ReloadAllTraits()
	DebugPrint({Text = "WEAPON PRIMARY: "..primary})
	DebugPrint({Text = "WEAPON SECONDARY: "..secondary})
	DebugPrint({Text = "WEAPON ASPECT: "..weaponAspect})
	DebugPrint({Text = "CAST: "..cast.."RARITY: "..castRarity})
	DebugPrint({Text = "WEAPON DATA: "..ModUtil.TableKeysString(CurrentRun.Hero.Weapons)})
end}

ModUtil.WrapBaseFunction("StartNewRun", function(baseFunc, prevRun, args)
	local returnVal = baseFunc(prevRun, args)
	if config.RandomizePrimaryWeapons then
		--DO STUFF
	end
    return returnVal
end,HadesRandomizer)

function SetEquippedWeapon( primary, secondary )
    DebugPrint({ Text = "Equipping = "..primary.." - "..secondary })

	if primary == "SwordWeapon" then
		if secondary == nil then
			secondary = "SwordParry"
		end
		ModUtil.MapSetTable( WeaponData, {
			SwordWeapon = {
				SecondaryWeapon = secondary
			}
		})
	
		ModUtil.MapSetTable( WeaponSets, {
			HeroWeaponSets = {
				SwordWeapon = {
					"SwordWeapon2", "SwordWeapon3", secondary, "SwordWeaponDash", "SwordWeaponWave",
				}
			}
		})
		EquipPlayerWeapon( WeaponData.SwordWeapon )
	elseif primary == "BowWeapon" then
		if secondary == nil then
			secondary = "BowSplitShot"
		end
		ModUtil.MapSetTable( WeaponData, {
			BowWeapon = {
				SecondaryWeapon = secondary
			}
		})
	
		ModUtil.MapSetTable( WeaponSets, {
			HeroWeaponSets = {
				BowWeapon = {
					secondary, "BowWeaponDash", "ChargeBowWeapon1", "MaxChargeBowWeapon", "BowWeapon2",
				}
			}
		})
		EquipPlayerWeapon( WeaponData.BowWeapon )
	elseif primary == "SpearWeapon" then
		if secondary == nil then
			secondary = "SpearWeaponThrow"
		end
		ModUtil.MapSetTable( WeaponData, {
			SpearWeapon = {
				SecondaryWeapon = secondary
			}
		})
	
		ModUtil.MapSetTable( WeaponSets, {
			HeroWeaponSets = {
				SpearWeapon = {
					"SpearWeapon2", "SpearWeapon3", "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3", secondary, "SpearThrowImmolation", "SpearWeaponDash", "SpearWeaponThrowReturn", "SpearWeaponThrowInvisibleReturn",
				}
			}
		})
		EquipPlayerWeapon( WeaponData.SpearWeapon )
	elseif primary == "ShieldWeapon" then
		if secondary == nil then
			secondary = "ShieldThrow"
		end
		ModUtil.MapSetTable( WeaponData, {
			ShieldWeapon = {
				SecondaryWeapon = secondary
			}
		})
	
		ModUtil.MapSetTable( WeaponSets, {
			HeroWeaponSets = {
				ShieldWeapon = {
					"ShieldWeaponRush", secondary, "ShieldWeaponDash", "ChaosShieldThrow", "ShieldThrowDash",
				}
			}
		})
		EquipPlayerWeapon( WeaponData.ShieldWeapon )
	elseif primary == "FistWeapon" then
		if secondary == nil then
			secondary = "FistWeaponSpecial"
		end
		ModUtil.MapSetTable( WeaponData, {
			FistWeapon = {
				SecondaryWeapon = secondary
			}
		})
	
		ModUtil.MapSetTable( WeaponSets, {
			HeroWeaponSets = {
				FistWeapon = {
					"FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5", secondary, "FistWeaponDash", "FistWeaponSpecialDash", "FistWeaponLandAreaAttack"
				}
			}
		})
		EquipPlayerWeapon( WeaponData.FistWeapon )
	elseif primary == "GunWeapon" then
		ModUtil.MapSetTable( WeaponData, {
			GunWeapon = {
				SecondaryWeapon = secondary
			}
		})
	
		ModUtil.MapSetTable( WeaponSets, {
			HeroWeaponSets = {
				GunWeapon = {
					secondary, "GunBombWeapon", "GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash"
				}
			}
		})
		EquipPlayerWeapon( WeaponData.GunWeapon )
	end
end

function GetRandomPrimaryWeapon()
	local weapon = WeaponSets.HeroMeleeWeapons[math.random(#WeaponSets.HeroMeleeWeapons)]
	return weapon
end

function GetRandomSecondaryWeapon()
	local weapon = WeaponSets.HeroSecondaryWeapons[math.random(#WeaponSets.HeroSecondaryWeapons)]
	return weapon
end

function GetRandomCast()
	local cast = HadesRandomizerData.Casts[math.random(#HadesRandomizerData.Casts)]
	local rarity = HadesRandomizerData.CastRarityLevels[math.random(#HadesRandomizerData.CastRarityLevels)]
	return cast, rarity
end

function GetRandomweaponAspect( primary, secondary )
	local upgrade
	if primary == "BowWeapon" then
		upgrade = HDRWeaponAspects.BowWeapon[math.random(#HDRWeaponAspects.BowWeapon)]
	elseif primary == "SwordWeapon" then
		upgrade = HDRWeaponAspects.SwordWeapon[math.random(#HDRWeaponAspects.SwordWeapon)]
	elseif primary == "SpearWeapon" then
		upgrade = HDRWeaponAspects.SpearWeapon[math.random(#HDRWeaponAspects.SpearWeapon)]
	elseif primary == "GunWeapon" then
		upgrade = HDRWeaponAspects.GunWeapon[math.random(#HDRWeaponAspects.GunWeapon)]
	elseif primary == "ShieldWeapon" then
		upgrade = HDRWeaponAspects.ShieldWeapon[math.random(#HDRWeaponAspects.ShieldWeapon)]
	elseif primary == "FistWeapon" then
		upgrade = HDRWeaponAspects.FistWeapon[math.random(#HDRWeaponAspects.FistWeapon)]
	end
	return upgrade
end

function GetRandomWeaponTrait( weapon )
	local traits = {}
	if (weapon == "BowWeapon" or weapon == "BowSplitShot") then
		for key,value in pairs(HRDBowWeaponTraits) do
			DebugPrint({Text = "ELEM: "..ModUtil.TableKeysString(value)})
			table.insert(traits, value)
		end
--[[ 		for _,v in HadesRandomizerData.weaponAspects.HRDBowWeaponTraits do
			table.insert(traits, v)
		end
	elseif weapon == "BowSplitShot" then
		for _,v in HadesRandomizerData.weaponAspects.HRDBowWeaponTraits do
			table.insert(traits, v)
		end ]]
	end
	local trait = traits[math.random(#traits)]
	return trait
end

--Traits are registered for the weapon that was equipped at pickup.
--This function refreshes all traits by removing and readding them for the new weapon
function RefreshTraits()

	local removedTraitData = {}
	for i, traitData in pairs( CurrentRun.Hero.Traits ) do
		table.insert(removedTraitData, { Name = traitData.Name, Rarity = traitData.Rarity })
		DebugPrint({Text = "Reloading trait" .. traitData.Name })
	end

	for i, traitData in pairs(removedTraitData) do
		RemoveTrait( CurrentRun.Hero, traitData.Name )
	end

	for i, traitData in pairs(removedTraitData) do
		if traitData.Name then
			if traitData.Rarity then
				AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name, Rarity = traitData.Rarity}) })
			else
				AddTraitToHero({ TraitData = GetProcessedTraitData({ Unit = CurrentRun.Hero, TraitName = traitData.Name }) })
			end
		end
	end
end

function RemoveActiveWeapons(weapons)
	local toUnequip = {}

	for key,value in pairs(weapons) do
		DebugPrint({Text = "TO REMOVE "..value})
		for k, weaponName in ipairs( WeaponSets.HeroPrimarySecondaryWeapons ) do
			if value == weaponName then
				table.insert( toUnequip, weaponName )
			end
		end
	end

	UnequipWeapon({ DestinationId = heroId, Names = toUnequip, UnloadPackages = false })
end

function RemoveWeaponAspect(weapons)
	RemoveTrait()
end