extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var tm=0

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _physics_process(delta):
	tm+=delta
	if (tm>2):
		queue_free()


func _on_Bullet_body_entered(body):
	tm=3
	pass # replace with function body
