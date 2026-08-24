extends CharacterBody2D

var direction_x : float                             # 只做左右移动
var speed: int = 100
@export var jump_strength: = 10                    # @export 面板显示跳跃高度
@export var gravity: = 10                           # @export 面板重力数值

func gat_input():                                   # 抓取键盘映射
	direction_x = Input.get_axis("left","right")    # 左右的映射
	if Input.is_action_just_pressed("jump"):        # 检测跳跃
		velocity.y = -jump_strength
	if Input.is_action_just_pressed("shoot") and $ReloadTimer.time_left == 0 : # 读取计时器剩余时间,并在计时器面板启用单词计时 
		print("123")
		$ReloadTimer.start()                        # 启动射击间隔计数器

func apply_gracity(delta):                          # 创建重力新图
	velocity.y += gravity * delta                   # ? delta 用于控制重力倍率

func _physics_process(delta: float) -> void:
	gat_input()
	velocity.x = direction_x * speed                # 只做左右移动时的碰撞移动
	apply_gracity(delta)
	move_and_slide()                                # 驱动velocity.x
