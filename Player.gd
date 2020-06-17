extends Sprite
export var velocity = 1.0
export var colorOn = Color(1,1,1)
export var colorOff = Color(0,0,0)

#export var colorOff = color(0,0,0)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var newPos = Vector2(50,50)
var bufPos = Vector2(50,50)
func _input(event):
	if event is InputEventMouseMotion:
		self.bufPos = event.position
	elif event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			bufPos = event.position
			newPos = bufPos
			$"../ColorRect".rect_position = newPos
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
var velocityV = Vector2(0,0)
func _process(delta):
	velocityV = (((newPos - position)*velocity*delta) - velocityV)*delta
#	position += velocityV#(newPos - position)*velocity*delta
	look_at(bufPos)
	position += velocityV*100
	position += position.direction_to(newPos)*delta
	
	pass


func _on_VisibilityNotifier2D_screen_exited():
	pass # Replace with function body.
	$"../ColorRect2/Tween".interpolate_property($"../ColorRect2","color",$"../ColorRect2".color,colorOff,0.5,
				Tween.TRANS_CUBIC,Tween.EASE_IN_OUT)
	$"../ColorRect2/Tween".start()


func _on_VisibilityNotifier2D_screen_entered():
	pass # Replace with function body.
	
	$"../ColorRect2/Tween".interpolate_property($"../ColorRect2","color",$"../ColorRect2".color,colorOn,0.5,
				Tween.TRANS_CUBIC,Tween.EASE_IN_OUT)
	$"../ColorRect2/Tween".start()


func _on_Area2D_area_entered(area):
	_on_VisibilityNotifier2D_screen_exited()


func _on_Area2D_area_exited(area):
	_on_VisibilityNotifier2D_screen_entered()
