Scriptname TrailsOfDestructionQS extends SKI_ConfigBase

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




Event OnInit()


PlayerRef.AddSpell(ShockMoving, False)

PlayerRef.AddSpell(ShockPlayerEffect, False)

RegisterForSingleUpdate(0)

endEvent








