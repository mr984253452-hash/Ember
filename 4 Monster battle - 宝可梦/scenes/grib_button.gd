extends Button

var state                                                                       # 页面参数
var type                                                                        # 功能
signal press(state, type) # 当前页面,当前功能

func _on_pressed() -> void:                                                     # 点击按钮信号
	press.emit(state, type)

func setup(menu_state:Global.State,button_type,button_text:String):             # ！！！！
	text  = button_text                                                         # 传入按钮 文本
	state = menu_state                                                          # 页面参数
	type  = button_type                                                         # 功能
