extends Node2D

var car_scene: PackedScene = preload('res://scenes/car.tscn') # 封装引用车辆文件

func _on_area_2d_body_entered(body: Node2D) -> void:   # 触发 CollisionPolygon2D 的信号
	print('333')
	
func _on_timer_timeout() -> void:                      # 触发 timer 的信号
	var car = car_scene.instantiate() as Area2D        # 实例化车辆文件,并声明为 Area2D 
	var pos_marker = $CarStartPosition.get_children().pick_random() as Marker2D # gat_children() 返回该节点所有子节点,pick_random() 随机抽取一个节点,并声明为 Marker2D
	car.position = pos_marker.position                 # 读取坐标 
	$Objects.add_child(car)                            # 挂载实例,画面显示车辆 之后生成从 Objects 层级下放置
	car.connect("body_entered",go_to_title)            # 给实例后的车辆绑定碰撞检测信号

func go_to_title(body):                                  # 定义碰撞后的函数,这个参数需要强制填参数
	print(body)
	print('123323')
