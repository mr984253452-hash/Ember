extends Control

func setup(monster: Global.Monster,player = true):                              # 怪物名字
	var monster_data = Global.monster_data[monster]
	$GridContainer/Label.text = monster_data['name']

func update(attack_data):                                                       # 血量加减
	$GridContainer/ProgressBar.value -= attack_data['amount']          
	
