extends Control

func _ready() -> void:
	$Label2.text = 'Time elapsed: ' + str(Global.score)
	
func _physics_process(_delta: float) -> void:                # 每帧持续速度的函数,可实现碰撞功能
	if Input.is_action_just_pressed("confirm"):              # 检查当前按键是否被按下,输出一次
		get_tree().change_scene_to_file('res://scenes/game.tscn')
