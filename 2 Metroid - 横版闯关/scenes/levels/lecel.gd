extends Node2D

var bullet_scene = preload("res://scenes/bullets/bullet.tscn")

func _ready() -> void:
	var light_tween = create_tween()
	light_tween.set_loops()
	light_tween.tween_property($PointLight2D,'energy',1.5,2)
	light_tween.tween_property($PointLight2D,'energy',0.5,2)

func _on_player_shoot(pos: Vector2, dir: Vector2) -> void:   # 调用新建信号需要鼠标选定创建新信号的元素
	var bullet = bullet_scene.instantiate() as Area2D        # 实例化子弹	
	$bullets.add_child(bullet)                               # 挂载子弹
	bullet.setup(pos, dir)                                   # 调用子弹轨迹
