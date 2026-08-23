extends Node2D

var car_scene: PackedScene = preload('res://scenes/car.tscn') # 封装引用车辆文件
var score:int

func _on_area_2d_body_entered(_body: Node2D) -> void:  # 触发 CollisionPolygon2D 的信号
	call_deferred('change_scene')                      # 延迟指令,用来切换界面时的指令不然会切换界面一直卡在当前的物理流程里
	Global.score = score                               # 从全局变量 Global 提取 score分数
	
func change_scene():
	get_tree().change_scene_to_file('res://scenes/title.tscn') # 切换至得分界面
	
func _on_timer_timeout() -> void:                      # 触发 timer 的信号
	var car = car_scene.instantiate() as Area2D        # 实例化车辆文件,并声明为 Area2D 
	var pos_marker = $CarStartPosition.get_children().pick_random() as Marker2D # gat_children() 返回该节点所有子节点,pick_random() 随机抽取一个节点,并声明为 Marker2D
	car.position = pos_marker.position                 # 读取坐标 
	$Objects.add_child(car)                            # 挂载实例,画面显示车辆 之后生成从 Objects 层级下放置
	car.connect("body_entered",go_to_title)            # 给实例后的车辆绑定碰撞检测信号

func go_to_title(_body):                                # 定义碰撞后的函数,这个参数需要强制填参数
	call_deferred('change_scene')                      # 延迟指令,用来切换界面时的指令不然会切换界面一直卡在当前的物理流程里


func _on_some_timer_timeout() -> void:                 # 计分计数器
	score += 1
	$CanvasLayer/Label.text = 'Time elapsed: ' + str(score)               # 输入内容到文档并强制变整数
