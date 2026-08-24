extends Node2D




func _on_player_shoot(pos: Vector2, dir: Vector2) -> void:   # 调用新建信号需要鼠标选定创建新信号的元素
	print(pos)
	print(dir)
