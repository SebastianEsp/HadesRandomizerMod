HadesRandomizerData = {
    Casts = {
        "ZeusRangedTrait",
        "PoseidonRangedTrait",
        "AthenaRangedTrait",
        "AphroditeRangedTrait",
        "ArtemisRangedTrait",
        "AresRangedTrait",
        "DionysusRangedTrait",
        --"HermesRangedTrait",
        "DemeterRangedTrait",
    },
    CastRarityLevels = {
        "Common",
        "Rare",
        "Epic",
        "Heroic",
    },
}

HDRWeaponUpgrades = {
    BowWeapon = {
        "BowLoadAmmoTrait",
        "BowBondTrait",
    },
    BowSplitShot = {
        "BowMarkHomingTrait",
    },
    SwordWeapon = {
        "SwordCriticalParryTrait",
        "DislodgeAmmoTrait",
        "SwordConsecrationTrait",
    },
    SpearWeapon = {
        "SpearSpinTravel"
    },
    SpearWeaponThrow = {
        "SpearTeleportTrait",
        "SpearWeaveTrait",
    },
    GunWeapon = {
        "GunManualReloadTrait",
    },
    GunGrenadeToss = {
        "GunGrenadeSelfEmpowerTrait",
        "GunLoadedGrenadeTrait",
    },
    ShieldWeapon = {
        "ShieldLoadAmmoTrait",
    },
    ShieldThrow = {
        "ShieldRushBonusProjectileTrait",
        "ShieldTwoShieldTrait",
    },
    FistWeapon = {
        "FistVacuumTrait",
        "FistWeaveTrait",
        "FistDetonateTrait",
    },
}

HRDBowWeaponTraits = {
    BowLongRangeDamageTrait = {
        Name = "BowLongRangeDamageTrait",
        RequiredFalseTraits = { "BowDoubleShotTrait", "BowCloseAttackTrait" },
    },
    BowSlowChargeDamageTrait = {
        Name = "BowSlowChargeDamageTrait",
        RequiredFalseTraits = { "BowTapFireTrait", "BowChainShotTrait", "BowBeamTrait", "BowDashFanTrait" },
    },
    BowTapFireTrait = {
        Name = "BowTapFireTrait",
        RequiredFalseTraits = { "BowPowerShotTrait", "BowSlowChargeDamageTrait", "BowBeamTrait", "BowTransitionTapFireTrait", "BowBondTrait" },
    },
    BowPenetrationTrait = {
        Name = "BowPenetrationTrait",
        RequiredFalseTraits = { "BowBondTrait" },
    },
    BowPowerShotTrait = {
        Name = "BowPowerShotTrait",
        RequiredFalseTraits = { "BowTapFireTrait", "BowBeamTrait" },
    },
    BowDoubleShotTrait = {
        Name = "BowDoubleShotTrait",
        RequiredFalseTraits = { "BowTripleShotTrait", "BowLongRangeDamageTrait", "BowDashFanTrait" },
    },
    BowTripleShotTrait = {
        Name = "BowTripleShotTrait",
        RequiredFalseTraits =  { "BowDoubleShotTrait", "BowDashFanTrait" },
    },
    BowRandomExplosionTrait = {
        Name = "BowRandomExplosionTrait",
        RequiredFalseTraits =  { },
    },
    BowSecondaryFocusedFireTrait = {
        Name = "BowSecondaryFocusedFireTrait",
        RequiredFalseTraits = { "BowBondTrait", "BowSecondaryBarrageTrait", "BowBeamTrait", "BowMarkHomingTrait" },
    },
    BowChainShotTrait = {
        Name = "BowChainShotTrait",
        RequiredFalseTraits = { "BowDashFanTrait", "BowSlowChargeDamageTrait" },
    },
    BowDashFanTrait = {
        Name = "BowDashFanTrait",
        RequiredFalseTraits = { "BowSlowChargeDamageTrait", "BowDoubleShotTrait", "BowTripleShotTrait" },
    },
    BowSplitShot = {
        BowSecondaryBarrageTrait = {
            Name = "BowSecondaryBarrageTrait",
            RequiredFalseTraits = { "BowSecondaryFocusedFireTrait" },
        },
    },
}