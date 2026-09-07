extends Control

var is_player: bool                                                             # 用来传输玩家单位是否生命归零
signal defeat(is_player: bool)                                                  # 怪物死亡信
@onready var label = $PanelContainer/MarginContainer/GridContainer/Label
@onready var progress = $PanelContainer/MarginContainer/GridContainer/ProgressBar

func setup(monster: Global.Monster,player):                              # 怪物血量读取
	var monster_data = Global.monster_data[monster]
	label.text = monster_data['name']                           
	progress.max_value = monster_data['max health']
	progress.value = progress.max_value
	is_player = player

func update(data:Dictionary):                                                       # 血量加减
	progress.value -= data['amount']


func _on_progress_bar_value_changed(value: float) -> void:                       # 怪物死亡信发送
	if value <= 0:
		defeat.emit(is_player)
