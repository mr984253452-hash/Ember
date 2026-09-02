extends Control

var grid_button_scene = preload("res://scenes/grib_button.tscn")                # 按键图标
const main_buttons = {
	Global.State.ATTACK : 'Attack' ,
	Global.State.DEFEND : 'Defend' ,
	Global.State.SWAP   : 'Swap'   ,
	Global.State.ITEM   : 'Item'   ,
}

func _ready() -> void:
	create_grid_buttons(Global.State.MAIN,main_buttons)                         # 运行函数,填入默认参数
	
func create_grid_buttons(stste:Global.State,data:Dictionary):                   # 建立函数存入 
	for i in $GridContainer.get_children():                                     # 删除旧节点
		i.queue_free()                                                          # 释放节点
	for key in data:
		var grid_button = grid_button_scene.instantiate()                       # 接收预加载调用
		grid_button.setup(stste,key,data[key])                                  # 给新节传参数
		$GridContainer.add_child(grid_button)                                   # 传入新节点
		grid_button.connect('press', button_handler)                            # 函数内绑定信号，'press' 信号名 ，button_handler执行函数
		
func button_handler(state,type):                                                # 页数和功能
	print(state)
	print(type)
