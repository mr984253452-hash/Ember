extends CharacterBody2D


var direction: Vector2
var speed := 100
var player_direction = direction

func _physics_process(delta: float) -> void:
	get_input()
	velocity = direction * speed                # 有碰撞
	animation()
	move_and_slide()                          # 驱动 velocity 移动

func get_input():
	direction = Input.get_vector("left","right","up","down")
	
func animation():
	if direction: 
		$AnimationTree.set('parameters/MoveStateMachine/idle/blend_position',Vector2.DOWN)
		
				  
