extends Node2D

var bullet_scene = preload("res://scenes/bullets/bullet.tscn")

func _on_player_shoot(pos: Vector2, dir: Vector2) -> void:   # 调用新建信号需要鼠标选定创建新信号的元素
	var bullet = bullet_scene.instantiate() as Area2D
	$bullets.add_child(bullet)
	bullet.setup(pos, dir)
