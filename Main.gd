extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_ColorRect4_mouse_entered():
	print("Hide")
#	$ViewportContainer2/Viewport/Node2D.hide()
	
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	
#	$Node2D/AnimationPlayer.play()
	pass # Replace with function body.
