extends CharacterBody2D

var direction : Vector2
var speed := 50
var player : CharacterBody2D                                                    # 建立追随对象指定类型
var health := 3

func _on_detection_area_body_entered(Player_bodt: CharacterBody2D) -> void:    # 传入追随对象坐标
	player = Player_bodt

func _physics_process(_delta: float) -> void:                                    # 建立每帧更新坐标追随
	if player:                                                                  # 判断是否 存在记录坐标
		var dir = (player.position - position).normalized()                     # 两个对象之间坐标相减并归一化 
		velocity = dir * speed
		move_and_slide()


func _on_detection_area_body_exited(_Player_bodt: CharacterBody2D) -> void:      # 出检测范围 
	player = null                                                               # 清除player内数据


func _on_collsion_area_body_entered(body: Node2D) -> void:                          # 爆炸动画
	explode()

func hit():                             # 命中生命计算
	health -= 1
	if health == 0:
		explode()

func explode():                         # 爆炸动画
	speed = 0                                                                       # 碰到玩家停止移动
	$Drone.hide()                                                                   # 隐藏待机动画
	$ExplosionSprite.show()                                                         # 显示爆炸动画
	$AnimationPlayer.current_animation = 'explode'                                  # 切换播放爆炸动画
	await  $AnimationPlayer.animation_finished                                      # 等待爆炸动画播放完

	queue_free()
	
func chain_reaction():                 # 连锁爆炸函数
	for drone in get_tree().get_nodes_in_group('drones'):
		if position.distance_to(drone.position) < 30:                               # 判断 取出的坐标距离小于10像素
			drone.explode()                                                         # 小于调用爆炸函数
