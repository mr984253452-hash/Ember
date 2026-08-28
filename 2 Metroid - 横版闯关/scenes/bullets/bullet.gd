extends Area2D

var direction : Vector2                                # 创建向量
var speed = 200

func _ready() -> void:                                 # 子弹发射贴动画
	var tween = get_tree().create_tween()
	tween.tween_property($Default,'scale',Vector2(1,1),0.5).from(Vector2(0,0))
	$AudioStreamPlayer2D.play()
	
func setup(pos: Vector2, dir: Vector2):                # 自动方向
	position = pos + dir * 16                       # 子弹位置+偏移
	direction = dir                                    # 子弹向量

func _physics_process(delta: float) -> void:           # 子弹发射速度
	position += direction * speed * delta       


func _on_body_entered(body: Node2D) -> void:           # 子弹集中无人机调用,无人机文件的函数
	if 'hit' in body:                                  # 判断是bosy内部知否有hit函数
		body.hit()                                     # 执行hit函数
		queue_free()
