extends Control

signal defeat                                                                   # 怪物死亡信

func setup(monster: Global.Monster,player = true):                              # 怪物血量读取
	var monster_data = Global.monster_data[monster]
	$GridContainer/Label.text = monster_data['name']                           
	$GridContainer/ProgressBar.max_value = monster_data['max health']
	$GridContainer/ProgressBar.value = monster_data['max health']

func update(attack_data):                                                       # 血量加减
	$GridContainer/ProgressBar.value -= attack_data['amount']


func _on_progress_bar_value_changed(value: float) -> void:                       # 怪物死亡信发送
	if value <= 0:
		defeat.emit()
