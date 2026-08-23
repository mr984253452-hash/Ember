extends Area2D

var direction = Vector2.LEFT                 # 车辆方向为左侧
var speed = 100                              # 设定车辆速度倍数
var colors = [                               # 调用三种小车的贴图
	preload("res://graphics/cars/green.png"),
	preload("res://graphics/cars/red.png"),
	preload("res://graphics/cars/yellow.png"),
	]


func _ready() -> void:
	if position.x < 0:                       # 判断车辆生成后的方向和贴图反转
		direction.x = 1
		$Sprite2D.flip_h = true
	$Sprite2D.texture = colors.pick_random() # 随机选取函数,随机选三种小车取其中一张图 

func _process(delta: float) -> void:         # 每帧速度
	position += direction * speed * delta    # 持续获得当前坐标, delta 用来取消帧率影响


func _on_visible_on_screen_enabler_2d_screen_exited() -> void: # 车辆离开屏幕
	queue_free()                                               # 销毁指令函数
