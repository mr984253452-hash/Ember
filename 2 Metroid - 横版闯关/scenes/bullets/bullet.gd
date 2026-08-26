extends Area2D

var direction : Vector2                                # 创建向量

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Default,'scale',Vector2(1,1),0.5).from(Vector2(0,0))

func setup(pos: Vector2, dir: Vector2):                # 自动方向
	position = pos + dir * 16                          # 子弹位置+偏移
	direction = dir                                    # 子弹向量

func _physics_process(delta: float) -> void:           # 子弹发射速度
	position += direction * 30 * delta       
