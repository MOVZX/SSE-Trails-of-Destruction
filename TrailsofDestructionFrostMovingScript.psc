Scriptname TrailsofDestructionFrostMovingScript extends activemagiceffect

GlobalVariable Property TrailsofDestructionOverride Auto

GlobalVariable Property TrailsofDestructionDamageGlob Auto

Hazard Property HazardLevel1 Auto
Hazard Property HazardLevel2 Auto
Hazard Property HazardLevel3 Auto

Spell Property MagnitudeSpell Auto

Actor Property PlayerRef Auto

ObjectReference HazardScaled

Event OnEffectStart(Actor akTarget, Actor akCaster)
    RegisterForSingleUpdate(0)
EndEvent

Event OnUpdate()
    If TrailsofDestructionOverride.GetValue() == 0.0
        If PlayerRef.GetBaseAV("Destruction") >= 75
            If ((PlayerRef.IsRunning() || PlayerRef.IsSprinting()) && PlayerRef.IsWeaponDrawn() && !PlayerRef.isSneaking())
                HazardScaled = PlayerRef.PlaceAtMe(HazardLevel3)
                HazardScaled.SetScale(3)
            Elseif (PlayerRef.IsWeaponDrawn() && !PlayerRef.isSneaking())
                Utility.Wait(2)
                HazardScaled = PlayerRef.PlaceAtMe(HazardLevel3)
                HazardScaled.SetScale(3)
            Endif
            If TrailsofDestructionDamageGlob.GetValue() > 0.0
                MagnitudeSpell.SetNthEffectMagnitude(0, 6 * (4 * (1 + PlayerRef.GetBaseAV("Destruction"))))
            Else
                MagnitudeSpell.SetNthEffectMagnitude(0, 0.0)
            Endif
        Elseif PlayerRef.GetBaseAV("Destruction") >= 50
            If ((PlayerRef.IsRunning() || PlayerRef.IsSprinting()) && PlayerRef.IsWeaponDrawn() && !PlayerRef.isSneaking())
                HazardScaled = PlayerRef.PlaceAtMe(HazardLevel2)
                HazardScaled.SetScale(2)
            Elseif (PlayerRef.IsWeaponDrawn() && !PlayerRef.isSneaking())
                Utility.Wait(2)
                HazardScaled = PlayerRef.PlaceAtMe(HazardLevel2)
                HazardScaled.SetScale(2)
            Endif
            If TrailsofDestructionDamageGlob.GetValue() > 0.0
                MagnitudeSpell.SetNthEffectMagnitude(0, 6 * (2 * (1 + PlayerRef.GetBaseAV("Destruction"))))
            Else
                MagnitudeSpell.SetNthEffectMagnitude(0, 0.0)
            Endif
        Elseif PlayerRef.GetBaseAV("Destruction") >= 25
            If ((PlayerRef.IsRunning() || PlayerRef.IsSprinting()) && PlayerRef.IsWeaponDrawn() && !PlayerRef.isSneaking())
                HazardScaled = PlayerRef.PlaceAtMe(HazardLevel1)
            Elseif (PlayerRef.IsWeaponDrawn() && !PlayerRef.isSneaking())
                Utility.Wait(2)
                HazardScaled = PlayerRef.PlaceAtMe(HazardLevel1)
            Endif
            If TrailsofDestructionDamageGlob.GetValue() > 0.0
                MagnitudeSpell.SetNthEffectMagnitude(0, 6 * (1 + PlayerRef.GetBaseAV("Destruction")))
            Else
                MagnitudeSpell.SetNthEffectMagnitude(0, 0.0)
            Endif
        Endif
    Else
        If TrailsofDestructionOverride.GetValue() == 1.0
            If ((PlayerRef.IsRunning() || PlayerRef.IsSprinting()) && PlayerRef.IsWeaponDrawn() && !PlayerRef.isSneaking())
                PlayerRef.PlaceAtMe(HazardLevel1)
            Elseif (PlayerRef.IsWeaponDrawn() && !PlayerRef.isSneaking())
                Utility.Wait(2)
                PlayerRef.PlaceAtMe(HazardLevel1)
            Endif
            If TrailsofDestructionDamageGlob.GetValue() > 0.0
                MagnitudeSpell.SetNthEffectMagnitude(0, 6 * (1 + PlayerRef.GetBaseAV("Destruction")))
            Else
                MagnitudeSpell.SetNthEffectMagnitude(0, 0.0)
            Endif
        Elseif TrailsofDestructionOverride.GetValue() == 2.0
            If ((PlayerRef.IsRunning() || PlayerRef.IsSprinting()) && PlayerRef.IsWeaponDrawn() && !PlayerRef.isSneaking())
                HazardScaled = PlayerRef.PlaceAtMe(HazardLevel2)
                HazardScaled.SetScale(2)
            Elseif (PlayerRef.IsWeaponDrawn() && !PlayerRef.isSneaking())
                Utility.Wait(2)
                HazardScaled = PlayerRef.PlaceAtMe(HazardLevel2)
                HazardScaled.SetScale(2)
            Endif
            If TrailsofDestructionDamageGlob.GetValue() > 0.0
                MagnitudeSpell.SetNthEffectMagnitude(0, 6 * (2 * (1 + PlayerRef.GetBaseAV("Destruction"))))
            Else
                MagnitudeSpell.SetNthEffectMagnitude(0, 0.0)
            Endif
        Elseif TrailsofDestructionOverride.GetValue() == 3.0
            If ((PlayerRef.IsRunning() || PlayerRef.IsSprinting()) && PlayerRef.IsWeaponDrawn() && !PlayerRef.isSneaking())
                HazardScaled = PlayerRef.PlaceAtMe(HazardLevel3)
                HazardScaled.SetScale(3)
            Elseif (PlayerRef.IsWeaponDrawn() && !PlayerRef.isSneaking())
                Utility.Wait(2)
                HazardScaled = PlayerRef.PlaceAtMe(HazardLevel3)
                HazardScaled.SetScale(3)
            Endif
            If TrailsofDestructionDamageGlob.GetValue() > 0.0
                MagnitudeSpell.SetNthEffectMagnitude(0, 6 * (4 * (1 + PlayerRef.GetBaseAV("Destruction"))))
            Else
                MagnitudeSpell.SetNthEffectMagnitude(0, 0.0)
            Endif
        Endif
    Endif
    RegisterForSingleUpdate(0.2)
EndEvent