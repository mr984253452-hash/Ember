extends CharacterBody2D

var direction: Vector2 = Vector2(1,0)                        # 设置为二维向量 2d游戏
var speed: int = 150                                           # 定义玩家速度量为整数

func _physics_process(_delta: float) -> void:                # 每帧持续速度的函数,可实现碰撞功能
	direction = Input.get_vector("left","right","up","down") # 获得键盘上下左右移动按键方向
	# position += direction * speed                          # 持续获得当前玩家检查器面板坐标,方向乘以速度
	velocity = direction * speed                             # velocity 移动碰撞持续获得当前玩家检查器面板坐标
	animation()
	move_and_slide()                                         # 驱动 velocity 移动
	if Input.is_action_just_pressed("confirm"):              # 检查当前按键是否被按下,输出一次
		print('123')

func animation():                                            # 重建角色移动播放精灵帧
	if direction:                                            # 检测是否存在移动方向
		if direction.x > 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.frame = 0                          # 设定精灵帧的待机帧
