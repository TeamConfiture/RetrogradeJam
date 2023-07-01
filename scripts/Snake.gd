extends Node2D

enum {UP, DOWN, LEFT, RIGHT}
const MOVEMENT_PERIOD = 0.5 # s 
const SPRITE_SIZE_X = 15
const SPRITE_SIZE_Y = 15

@export var direction = UP
var time_since_last_movement = 0
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position.x = screen_size.x/2
	position.y = screen_size.y/2 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("move_up"):
		direction = UP
	if Input.is_action_just_pressed("move_down"):
		direction = DOWN
	if Input.is_action_just_pressed("move_left"):
		direction = LEFT
	if Input.is_action_just_pressed("move_right"):
		direction = RIGHT
		
	time_since_last_movement += delta
	while time_since_last_movement > MOVEMENT_PERIOD:
		time_since_last_movement -= MOVEMENT_PERIOD
		if direction == UP:
			position.y -= SPRITE_SIZE_Y
			$Sprite2D.rotation = 0
		elif direction == DOWN:
			position.y += SPRITE_SIZE_Y
			$Sprite2D.rotation = PI
		elif direction == LEFT:
			position.x -= SPRITE_SIZE_X
			$Sprite2D.rotation = -PI/2
		elif direction == RIGHT:
			position.x += SPRITE_SIZE_X
			$Sprite2D.rotation = PI/2
