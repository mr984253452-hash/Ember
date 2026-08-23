extends Node2D


func _on_timer_timeout() -> void:                      # 触发 timer 的信号
	print('123')


func _on_area_2d_body_entered(body: Node2D) -> void:   # 触发 CollisionPolygon2D 的信号
	print('333')
