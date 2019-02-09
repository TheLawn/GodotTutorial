extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var MaxSpeed=200
var grav=20
var vel=Vector2()
var jump_count=2
var is_falling=false
var hp=3
var Bullet=preload("res://Bullet.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
func shoot():
	var impulse=Vector2(1,0)
	var pose=global_position+Vector2(31.7665/2+40,0)
	var bullet=Bullet.instance()
	bullet.position=pose
	get_node("../").add_child(bullet)
	bullet.apply_impulse(Vector2(),impulse*1000)


func get_damage():
	hp-=1
	if hp<0:
		queue_free()

func _physics_process(delta):
	var temp=vel.y
	if temp==0&&jump_count<2&&is_falling:
 		jump_count=2
	vel.y=0
	if Input.is_action_just_pressed("fire"):
		shoot()
	if Input.is_action_pressed("ui_left"):
		vel.x=-1
	elif Input.is_action_pressed("ui_right"):
		vel.x=1
	else:
		vel.x=0
	vel=vel.normalized()*MaxSpeed
	vel.y=grav+temp
	is_falling=vel.y>0
	if Input.is_action_just_pressed("ui_accept")&&jump_count>0:
		vel.y=-600
		jump_count-=1
		is_falling=false
	vel=move_and_slide(vel)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
