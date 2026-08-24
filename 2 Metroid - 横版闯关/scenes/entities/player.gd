extends CharacterBody2D

var direction_x : float                             # 只做左右移动
var speed: int = 100

func gat_input():                                   # 抓取键盘映射
	direction_x = Input.get_axis("left","right")     # 左右的映射
	if Input.is_action_just_pressed("jump"):
		print("123")
		velocity.y = -10

func _physics_process(_delta: float) -> void:
	gat_input()
	velocity.x = direction_x * speed                # 只做左右移动时的碰撞移动
	move_and_slide()                                # 驱动velocity.x
