extends Node2D

var tshapes = []
var mass = 0.0

func _ready():
	for node in get_children():
		# Cast the node variant type to a type of TShape
		var tshape: TShape = node
		# Add up the weights
		mass += tshape.weight
		tshapes.append(tshape)

func generate():
	var pick = randf() * mass
	for t in tshapes:
		var tshape: TShape = t
		pick -= tshape.weight
		if pick <= 0.0:
			return tshape
	assert(false) # Should never reach this point
