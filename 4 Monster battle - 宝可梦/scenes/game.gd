extends Control

@export var animation_index: int = 0  # 建立动画播放帧

func _ready() -> void:                                                                   # 初始化
	# 我方
	Global.current_monster = Global.monsters.pop_at(0)
	$Monsters/Player.texture = load(Global.monster_data[Global.current_monster]['back texture'])
	$Stats/PlayerStats.setup(Global.current_monster )
	# 敌方
	enemy_monster_setup()
	$AttackSprite.hide()

	for stats in $Stats.get_children():                                                  # 怪物死亡信号绑定
		stats.connect('defeat',monster_swap)

func _process(_delta: float) -> void:                                                    # 精灵帧播放函数
	var atlas = $Monsters/Enemy.texture as AtlasTexture                                  # 读取纹理传入位置
	atlas.region = Rect2i(Vector2(96 * animation_index,0),Vector2i(96,96))               # 位置xy,尺寸xy
	$AnimationPlayer.play("idle")

func _on_input_menu_selectad(state: int, type: Variant) -> void:                         # 攻击判断,更换怪物
	$InputMenu.hide()
	$TurnTimer.start()                                                                   # 怪物反击等待时长
	match state:
		Global.State.ATTACK:                                                             # 攻击逻辑
			var target = $Monsters/Enemy if Global.attack_data[type]['target'] else $Monsters/Player  # 判断敌我
			attack(target,type)
		Global.State.SWAP:                                                               # 怪物切换 
			Global.monsters.append(Global.current_monster)                               # 切换时在列表添加被换怪物
			$Monsters/Player.texture = load(Global.monster_data[type]['back texture'])   # 更换怪物
			Global.current_monster = type                                                # 设为当前怪物
			Global.monsters.erase(type)                                                  # 在列表删除当前怪物
			$Stats/PlayerStats.setup(Global.current_monster )

func attack(target: TextureRect,attack_type:Global.Attack):                             # 攻击动画,参数
	$AttackSprite.position = target.get_rect(). position + target.get_rect().size/2      # 给动画定位
	$AttackSprite.show()
	$AttackSprite.frame = 0                                                              # 设定起始帧
	$AttackSprite.texture = load(Global.attack_data[attack_type]['animation'])           # 读取攻击特效图片
	var tween = get_tree().create_tween()
	tween.tween_property($AttackSprite,'frame',3.0,0.6).from(0)                          # 读取帧
	tween.tween_property($AttackSprite,'visible',false,0)                                # 补间隐藏
	
	if target == $Monsters/Player:                                                       # 攻击数据传参
		$Stats/PlayerStats.update(Global.attack_data[attack_type])
	else:
		$Stats/EnemyStats.update(Global.attack_data[attack_type])

func enemy_monster_setup():                                                              # 敌人初始化生成逻辑
	Global.current_enemy = Global.Monster.values().pick_random()                         # 从字典随机抽出一个怪物
	var new_atlas: AtlasTexture = AtlasTexture.new()                                     # 用界面展示图片做初始帧
	new_atlas.atlas = load(Global.monster_data[Global.current_enemy]['front texture'])   # 读取图片
	new_atlas.region = Rect2i(Vector2i.ZERO,Vector2i(96,96))                             # 分割初始帧
	$Monsters/Enemy.texture = new_atlas                                                  # 传入纹理
	$Stats/EnemyStats.setup(Global.current_enemy)                                        # 怪物名字传参

func monster_swap():                                                                     # 怪物死亡替逻辑
	enemy_monster_setup()


func _on_turn_timer_timeout() -> void:                                                   # 敌方攻击逻辑
	var attack_type = 
	var target = 
