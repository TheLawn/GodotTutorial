extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var Max_Speed = 200
var grav=20
var vel=Vector2()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func _physics_process(delta):
	vel.y+=grav
	vel=move_and_slide(vel)
	var cnt=get_slide_count()-1
	vel.x=-Max_Speed
	if cnt>0:
		var col=get_slide_collision(cnt)
		if col&&col.collider.has_method("get_damage"):
			col.collider.call("get_damage")
			vel.x=Max_Speed*20
	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
