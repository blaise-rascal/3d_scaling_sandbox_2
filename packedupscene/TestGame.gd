extends Node2D


const MOTION_SPEED = 150 # Pixels/second.

func _ready():
	pass

func _process(delta):
	
	var velocity = Vector2()
	velocity.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	velocity.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	velocity = velocity.normalized() * MOTION_SPEED
	if(velocity.x > 0):
		$Player.flip_h=true
	elif(velocity.x < 0):
		$Player.flip_h=false
	$Player.position += velocity * delta


func _input(event):
	if(event.is_action_pressed("ui_end")):
		OS.window_fullscreen = !OS.window_fullscreen
