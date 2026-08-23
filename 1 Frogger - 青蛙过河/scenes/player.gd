extends CharacterBody2D

var direction: Vector2 = Vector2(1,0)                        # 设置为二维向量 2d游戏
var speed: int = 100                                           # 定义玩家速度量为整数

func _physics_process(_delta: float) -> void:                # 每帧持续速度的函数,可实现碰撞功能
	direction = Input.get_vector("left","right","up","down") # 获得键盘上下左右移动按键方向
	# position += direction * speed                          # 持续获得当前玩家检查器面板坐标,方向乘以速度
	velocity = direction * speed                             # velocity 移动碰撞持续获得当前玩家检查器面板坐标
	animation()                                              # 调用角色移动精灵帧函数
	move_and_slide()                                         # 驱动 velocity 移动

func animation():                                            # 重建角色移动播放精灵帧
	if direction:                                            # 检测是否存在移动方向
#		$AnimatedSprite2D.flip_h = direction.x > 0           # 下方4行判断的简写
		if direction.x > 0:                                  # 判断角色左右行动方向
			$AnimatedSprite2D.flip_h = true                  # 向右走进行镜像翻转
		else:
			$AnimatedSprite2D.flip_h = false                 # 向左走进行正常播放
		if direction. x != 0:                                # 判断左右移动还是上下移动,为了向卸下走 脸是朝向左右
			$AnimatedSprite2D.animation = "left"             # 判断为左右移动
		else:
#			$AnimatedSprite2D.animation = 'up' if direction.y < 0 else 'down' # 下方4行判断的简写
			if direction. y < 0:
				$AnimatedSprite2D.animation = 'up'           # 播放向上动画
			else:
				$AnimatedSprite2D.animation = 'down'         # 播放向下动画
	else:
		$AnimatedSprite2D.frame = 0                          # 设定精灵帧的待机帧
