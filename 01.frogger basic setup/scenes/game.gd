extends Node2D

var car_scene: PackedScene = preload('res://scenes/car.tscn') # 封装引用车辆文件

func _on_timer_timeout() -> void:                      # 触发 timer 的信号
	var car = car_scene.instantiate()                  # 实例化车辆文件
	$Objects.add_child(car)                            # 挂载实例,画面显示车辆 之后生成从 Objects 层级下放置

func _on_area_2d_body_entered(body: Node2D) -> void:   # 触发 CollisionPolygon2D 的信号
	print('333')
