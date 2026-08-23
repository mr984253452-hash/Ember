extends Area2D

var direction = Vector2.LEFT                 # 车辆方向为左侧
var speed = 1                                # 设定车辆速度倍数

func _process(delta: float) -> void:         # 每帧速度
	position += direction * speed            # 持续获得当前坐标


func _on_visible_on_screen_enabler_2d_screen_exited() -> void: # 车辆离开屏幕
	queue_free()                                               # 销毁指令函数
