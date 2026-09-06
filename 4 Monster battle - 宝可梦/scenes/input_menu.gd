extends Control

var grid_button_scene = preload("res://scenes/grib_button.tscn")                # 按键图标
var list_button_scene = preload("res://scenes/list_button.tscn")                # 按键图标

const main_buttons = {
	Global.State.ATTACK : 'Attack' ,
	Global.State.DEFEND : 'Defend' ,
	Global.State.SWAP   : 'Swap'   ,
	Global.State.ITEM   : 'Item'   ,
}
var current_state: Global.State: set = state_handler                            # 配合回调函数
signal selectad(state:Global.State,type)

func _ready() -> void:                                                          # 设定初始界面
	current_state = Global.State.MAIN

func _input(_event: InputEvent) -> void:                                        # 返回主界面
	if Input.is_action_just_pressed('ui_cancel'):                               # esc
		current_state = Global.State.MAIN
		
func create_grid_buttons(stste:Global.State,data:Dictionary):                   # 网格容器
	for i in $GridContainer.get_children():                                     # 删除旧节点
		i.queue_free()                                                          # 释放节点
	for key in data:
		var grid_button = grid_button_scene.instantiate()                       # 接收预加载调用
		grid_button.setup(stste,key,data[key])                                  # 给新节传参数
		$GridContainer.add_child(grid_button)                                   # 传入新节点
		grid_button.connect('press', button_handler)                            # 函数内绑定信号，'press' 信号名 ，button_handler执行函数
	await get_tree().process_frame
	$GridContainer.get_child(0).grab_focus()

func create_list_buttons(stste:Global.State,data:Array):                        # 滚动容器
	for i in $ScrollContainer/VBoxContainer.get_children():
		i.queue_free()
	for i in data:
		var list__button = list_button_scene.instantiate()
		list__button.setup(stste,i)
		$ScrollContainer/VBoxContainer.add_child(list__button) 
		list__button.connect('press', button_handler)
	await get_tree().process_frame
	$ScrollContainer/VBoxContainer.get_child(0).grab_focus()

func button_handler(state,type):                                                # 界面切换记录
	if state == Global.State.MAIN:
		current_state = type
		if type == Global.State.DEFEND :
			selectad.emit(Global.State.DEFEND,type)
	else :
		selectad.emit(state,type)

func state_handler(value):                                                      # 回调函数,在变量数值变动时执行额外逻辑,界面切换逻辑
	current_state = value
	match value:
		Global.State.ATTACK:                                                              # 攻击界面
			for i in $GridContainer.get_children():
				i.queue_free()
			var mosnter_attacks = Global.monster_data[Global.current_monster]['attacks']  # 从全局字典 monster_data,current_monster,'attacks' 取出所有  里所有攻击枚举值
			create_grid_buttons(Global.State.ATTACK,{                                     # 利用 Global.mosnter_attacks 的枚举值 取出 Global.attack_data 里对应的攻击数值
				mosnter_attacks[0] : Global.attack_data[mosnter_attacks[0]]['name'],
				mosnter_attacks[1] : Global.attack_data[mosnter_attacks[1]]['name'],
				mosnter_attacks[2] : Global.attack_data[mosnter_attacks[2]]['name'],
				mosnter_attacks[3] : Global.attack_data[mosnter_attacks[3]]['name'],
				})
			$GridContainer.show()
			$ScrollContainer.hide()
	
		Global.State.MAIN:	                                                          # 主界面
			create_grid_buttons(Global.State.MAIN,main_buttons)
			$GridContainer.show()
			$ScrollContainer.hide()
	
		Global.State.SWAP:
			$ScrollContainer.show()
			$GridContainer.hide()
			create_list_buttons(Global.State.SWAP,Global.monsters)                      # 自身怪物

		Global.State.ITEM:
			$ScrollContainer.show()
			$GridContainer.hide()
			create_list_buttons(Global.State.ITEM,Global.items)                         # 自身道具

	


func _on_visibility_changed() -> void:                                                   # 菜单显示状态发生表更
	current_state = Global.State.MAIN
