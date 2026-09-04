extends Button

var state                                                                       # 页面参数
var type                                                                        # 功能
signal press(state, type) # 当前页面,当前功能

func setup(menu_state,button_type):                                             # 按钮传入参数
	@warning_ignore('incompatible_ternary')
	var data = Global.monster_data  if menu_state == Global.State.SWAP else Global.item_data
	$HBoxContainer/Label.text = data[button_type]['name']
	$HBoxContainer/TextureRect.texture = load(data[button_type]['icon'])
	state = menu_state
	type  = button_type


func _on_pressed() -> void:
	press.emit(state, type)
