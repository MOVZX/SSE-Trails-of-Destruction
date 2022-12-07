Scriptname TrailsOfDestructionMCMScript extends SKI_ConfigBase  


String[] TrailEffectOptions
String[] PlayerEffectOptions
String[] TrailLengthOverride


Bool bTrailEffectsToggle = True
Bool bPlayerEffectsToggle = True
Bool bTrailEffectOverride = False
Bool bPlayerEffectOverride = False
Bool bAccept = False
Bool bSound = True
Bool bDamage = True
Bool bKeyToggle = True

Int oTrailEffectsToggle
Int oPlayerEffectsToggle
Int oTrailEffectOverride
Int oPlayerEffectOverride
Int oTypeDropDownTrail
Int oTypeDropDownEffect
Int oTypeDropDownEffectPlayer
Int oSound
Int oDamage
Int oAccept
Int oToggleKey
Int oPlayerEffectLevel


Int iTrailEffect = 0
Int iTrailLength = 0
Int iPlayerEffect = 0


GlobalVariable Property TrailsofDestructionPlayerEffectLevel Auto

Event OnConfigInit()
TrailEffectOptions = New String[3]
TrailEffectOptions[0] = "Fire"
TrailEffectOptions[1] = "Frost"
TrailEffectOptions[2] = "Shock"

PlayerEffectOptions = New String[3]
PlayerEffectOptions[0] = "Fire"
PlayerEffectOptions[1] = "Frost"
PlayerEffectOptions[2] = "Shock"

TrailLengthOverride = New String[3]
TrailLengthOverride[0] = "Small"
TrailLengthOverride[1] = "Medium"
TrailLengthOverride[2] = "Large"

Pages = New String[3]
Pages[0] = "Trailing Effects"
Pages[1] = "Player Effects"
Pages[2] = "Misc and Accept"

UpdateSettings()
RegisterForKey(TrailsofDestructionToggleKey.GetValueInt())

EndEvent

Event OnPageReset(String page)

If (Page == "Trailing Effects")

SetCursorFillMode(Left_To_Right)
oTrailEffectsToggle = AddToggleOption("Trailing Effects Enabled", bTrailEffectsToggle)
AddEmptyOption()
AddEmptyOption()
AddEmptyOption()
oTypeDropDownEffect = AddMenuOption("Trail Effect", TrailEffectOptions[iTrailEffect])
AddEmptyOption()
AddEmptyOption()
AddEmptyOption()
oTrailEffectOverride = AddToggleOption("Trail Length Override", bTrailEffectOverride)
AddEmptyOption()
AddEmptyOption()
AddEmptyOption()
oTypeDropDownTrail = AddMenuOption("Trail Length Override Option", TrailLengthOverride[iTrailLength])

Elseif (Page == "Player Effects")

SetCursorFillMode(Left_To_Right)
oPlayerEffectsToggle = AddToggleOption("Player Effects Enabled", bPlayerEffectsToggle)
AddEmptyOption()
AddEmptyOption()
AddEmptyOption()
oPlayerEffectLevel = AddSliderOption("Player Effect Destruction Level", TrailsofDestructionPlayerEffectLevel.GetValue())
AddEmptyOption()
AddEmptyOption()
AddEmptyOption()
oPlayerEffectOverride = AddToggleOption("Player Effects Override", bPlayerEffectOverride)
AddEmptyOption()
AddEmptyOption()
AddEmptyOption()
oTypeDropDownEffectPlayer = AddMenuOption("Player Effect Override Option", PlayerEffectOptions[iPlayerEffect])


Elseif(Page == "Misc and Accept")

AddEmptyOption()
AddEmptyOption()
oSound = AddToggleOption("Effects Make Sound", bSound)
AddEmptyOption()
AddEmptyOption()
AddEmptyOption()
oDamage = AddToggleOption("Effects Deal Damage", bDamage)
AddEmptyOption()
AddEmptyOption()
AddEmptyOption()
oToggleKey = AddKeyMapOption("Effects Toggle Hotkey", TrailsofDestructionToggleKey.GetValueInt())
AddEmptyOption()
AddEmptyOption()
AddEmptyOption()
oAccept = AddToggleOption("Accept Settings", bAccept)

Endif

EndEvent

Event OnOptionSelect(int Option)

If CurrentPage == "Trailing Effects"

	If Option == oTrailEffectsToggle
	
		bTrailEffectsToggle = !bTrailEffectsToggle
		SetToggleOptionValue(oTrailEffectsToggle, bTrailEffectsToggle)
	
	Endif
	
	If Option == oTrailEffectOverride
	
		bTrailEffectOverride = !bTrailEffectOverride
		SetToggleOptionValue(oTrailEffectOverride, bTrailEffectOverride)
		
	Endif
	
Elseif CurrentPage == "Player Effects"

	If Option == oPlayerEffectsToggle
	
		bPlayerEffectsToggle = !bPlayerEffectsToggle
		SetToggleOptionValue(oPlayerEffectsToggle, bPlayerEffectsToggle)
		
	Endif
	
	If Option == oPlayerEffectOverride
	
		bPlayerEffectOverride = !bPlayerEffectOverride
		SetToggleOptionValue(oPlayerEffectOverride, bPlayerEffectOverride)
	
	Endif
	
Elseif CurrentPage == "Misc and Accept"

	If Option == oSound
	
		bSound = !bSound
		SetToggleOptionValue(oSound, bSound)
		
	Endif
	
	If Option == oDamage
	
		bDamage = !bDamage
		SetToggleOptionValue(oDamage, bDamage)
		
		If bDamage == True
		
			TrailsofDestructionDamageGlob.SetValue(1)
			
		Else
		
			TrailsofDestructionDamageGlob.SetValue(0)
			
		Endif
		
	Endif
	
	If Option == oAccept
	
		bAccept = !bAccept
		SetToggleOptionValue(oAccept, bAccept)	
		Utility.Wait(1)
		UpdateSettings()
		bAccept = !bAccept

	Endif

Endif

EndEvent

Event OnOptionMenuOpen(Int Option)

If CurrentPage == "Trailing Effects"

	If Option == oTypeDropDownEffect
	
		SetMenuDialogOptions(TrailEffectOptions)
		SetMenuDialogStartIndex(iTrailEffect)
		SetMenuDialogDefaultIndex(iTrailEffect)
		
	Endif
	
	If Option == oTypeDropDownTrail
	
		SetMenuDialogOptions(TrailLengthOverride)
		SetMenuDialogStartIndex(iTrailLength)
		SetMenuDialogDefaultIndex(iTrailLength)
	
	Endif
	
Elseif CurrentPage == "Player Effects"

	If Option == oTypeDropDownEffectPlayer
	
		SetMenuDialogOptions(PlayerEffectOptions)
		SetMenuDialogStartIndex(iPlayerEffect)
		SetMenuDialogDefaultIndex(iPlayerEffect)
	
	Endif
	
Endif

EndEvent

Event OnOptionMenuAccept(Int Option, Int Index)

If CurrentPage == "Trailing Effects"

	If Option == oTypeDropDownEffect
	
		iTrailEffect = Index
		SetMenuOptionValue(oTypeDropDownEffect, TrailEffectOptions[iTrailEffect])
		
	Endif
	
	If Option == oTypeDropDownTrail
	
		iTrailLength = Index
		SetMenuOptionValue(oTypeDropDownTrail, TrailLengthOverride[iTrailLength])
		
	Endif
	
Elseif CurrentPage == "Player Effects"

	If Option == oTypeDropDownEffectPlayer
	
		iPlayerEffect = Index
		SetMenuOptionValue(oTypeDropDownEffectPlayer, PlayerEffectOptions[iPlayerEffect])
		
	Endif

Endif

EndEvent

Event OnOptionKeyMapChange(Int option, Int keyCode, String conflictControl, String conflictName)

If CurrentPage == "Misc and Accept"

	If Option == oToggleKey
	
		If conflictControl == ""
	
		UnregisterForKey(TrailsofDestructionToggleKey.GetValueInt())
		TrailsofDestructionToggleKey.SetValueInt(keyCode)
		RegisterForKey(TrailsofDestructionToggleKey.GetValueInt())
		
		Else
		
		String Conflict = conflictName
		
		Debug.MessageBox("Key Already in use")
		
		Endif
		
	Endif
	
Endif

EndEvent

Event OnOptionSliderOpen(Int Option)

If CurrentPage == "Player Effects"

	If Option == oPlayerEffectLevel
	
		SetSliderDialogStartValue(TrailsofDestructionPlayerEffectLevel.GetValue())
		SetSliderDialogDefaultValue(50.0)
		SetSliderDialogRange(1.0, 100.0)
		SetSliderDialogInterval(1.0)
		
	Endif
	
Endif

EndEvent

Event OnOptionSliderAccept(int option, float value)

If CurrentPage == "Player Effects"

	if option == oPlayerEffectLevel
	
		TrailsofDestructionPlayerEffectLevel.SetValue(value) 
		SetSliderOptionValue(oPlayerEffectLevel, TrailsofDestructionPlayerEffectLevel.GetValue())
	
	Endif
	
Endif

EndEvent


Event OnOptionHighlight(Int Option)

If Option == oTrailEffectsToggle

	SetInfoText("This turns on/off the trail effects.")

Elseif Option == oPlayerEffectsToggle

	SetInfoText("This turns on/off the player effects.")

Elseif Option == oTrailEffectOverride

	SetInfoText("Use this to choose the length of trail effect you would like below. Default uses your destruction level.")

Elseif Option == oPlayerEffectOverride

	SetInfoText("Use this if you want to have a different effect on the player.")

Elseif Option == oTypeDropDownTrail

	SetInfoText("Use this to change the length of trail you want. Default uses your destruction level.")

Elseif Option == oTypeDropDownEffect

	SetInfoText("Use this to choose the type of trail you would like.")

Elseif Option == oTypeDropDownEffectPlayer

	SetInfoText("Use this to choose the type of player effect you would like. The toggle above must be enabled for this to work.")

Elseif Option == oSound

	SetInfoText("Turn on/off the sound on the trail effects.")

Elseif Option == oDamage

	SetInfoText("Turn on/off the damage on the trail effects.")

Elseif Option == oAccept

	SetInfoText("When you're ready turn this on and it will save and apply your settings.")

Elseif Option == oToggleKey

	SetInfoText("Pick a hotkey to quickly turn on/off the effects.")
	
Elseif Option == oPlayerEffectLevel

	SetInfoText("Use this to choose the destruction level when the effect on the player will show.")
	
Endif

EndEvent


Spell Property FireMoving Auto
Spell Property FireMovingNS Auto

Spell Property FrostMoving Auto
Spell Property FrostMovingNS Auto

Spell Property ShockMoving Auto
Spell Property ShockMovingNS Auto

Spell Property FirePlayerEffect Auto

Spell Property FrostPlayerEffect Auto

Spell Property ShockPlayerEffect Auto

Actor Property PlayerRef Auto 

GlobalVariable Property TrailsofDestructionOverride Auto

GlobalVariable Property TrailsofDestructionDamageGlob Auto

GlobalVariable Property TrailsofDestructionToggleKey Auto



Function UpdateSettings()

PlayerRef.RemoveSpell(FireMoving)
PlayerRef.RemoveSpell(FireMovingNS)

PlayerRef.RemoveSpell(FrostMoving)
PlayerRef.RemoveSpell(FrostMovingNS)

PlayerRef.RemoveSpell(ShockMoving)
PlayerRef.RemoveSpell(ShockMovingNS)

PlayerRef.RemoveSpell(FirePlayerEffect)
PlayerRef.RemoveSpell(FrostPlayerEffect)
PlayerRef.RemoveSpell(ShockPlayerEffect)

If bTrailEffectsToggle == True

If iTrailEffect == 0

	If bSound == True

		PlayerRef.AddSpell(FireMoving, False)

	Else

		PlayerRef.AddSpell(FireMovingNS, False)

	Endif
	
Elseif iTrailEffect == 1

	If bSound == True

		PlayerRef.AddSpell(FrostMoving, False)

	Else

		PlayerRef.AddSpell(FrostMovingNS, False)

	Endif

Elseif iTrailEffect == 2

	If bSound == True

		PlayerRef.AddSpell(ShockMoving, False)

	Else

		PlayerRef.AddSpell(ShockMovingNS, False)

	Endif

Endif

Endif

If bTrailEffectOverride == True

	If iTrailLength == 0
	
	TrailsofDestructionOverride.SetValue(1)
	
	Elseif iTrailLength == 1
	
	TrailsofDestructionOverride.SetValue(2)
	
	Elseif iTrailLength == 2
	
	TrailsofDestructionOverride.SetValue(3)
	
	Endif
	
Else

TrailsofDestructionOverride.SetValue(0)

Endif

If bPlayerEffectsToggle == True

	If bPlayerEffectOverride == False

		iPlayerEffect = iTrailEffect

	Endif

	If iPlayerEffect == 0

		PlayerRef.AddSpell(FirePlayerEffect, False)
	
	Elseif iPlayerEffect == 1
	
		PlayerRef.AddSpell(FrostPlayerEffect, False)
	
	Elseif iPlayerEffect == 2

		PlayerRef.AddSpell(ShockPlayerEffect, False)

	Endif
	
Endif

EndFunction


Event OnKeyDown(Int KeyCode)
If !UI.IsTextInputEnabled()

If Keycode == TrailsofDestructionToggleKey.GetValueInt()

bKeyToggle = !bKeyToggle

If bKeyToggle == True

UpdateSettings()

Else

PlayerRef.RemoveSpell(FireMoving)
PlayerRef.RemoveSpell(FireMovingNS)

PlayerRef.RemoveSpell(FrostMoving)
PlayerRef.RemoveSpell(FrostMovingNS)

PlayerRef.RemoveSpell(ShockMoving)
PlayerRef.RemoveSpell(ShockMovingNS)

PlayerRef.RemoveSpell(FirePlayerEffect)
PlayerRef.RemoveSpell(FrostPlayerEffect)
PlayerRef.RemoveSpell(ShockPlayerEffect)

Endif

Endif

Endif

EndEvent