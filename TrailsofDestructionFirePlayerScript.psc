Scriptname TrailsofDestructionFirePlayerScript extends activemagiceffect  

EffectShader Property ShadertoApply  Auto  


Event OnEffectStart(Actor akTarget, Actor akCaster)

ShadertoApply.Play(akTarget)

EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)

ShadertoApply.Stop(akTarget)

EndEvent
