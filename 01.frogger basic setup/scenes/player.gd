extends Node2D

var direction: Vector2 = Vector2(1,0)                        # 设置为二维向量 2d游戏
var speed: int = 2                                          # 定义玩家速度量为整数

func _physics_process(_delta: float) -> void:                # 每帧持续速度的函数,可实现碰撞功能
	direction = Input.get_vector("left","right","up","down") # 获得键盘上下左右移动按键方向
	position += direction * speed                            # 持续获得当前玩家检查器面板坐标,方向乘以速度
	if Input.is_action_just_pressed("confirm"):              # 检查当前按键是否被按下,输出一次
		print('123')
