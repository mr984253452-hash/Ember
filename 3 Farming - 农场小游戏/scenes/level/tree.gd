extends StaticBody2D


func _ready() -> void:
	$Sprite2D.frame = [0,1].pick_random()                                        # 两帧随机生成

func hit():
	var tween = create_tween()                                                   # 受击补间动画
	tween.tween_property($Sprite2D.material,'shader_parameter/progress',1.0,0.2)
	tween.tween_property($Sprite2D.material,'shader_parameter/progress',0.0,0.4)
