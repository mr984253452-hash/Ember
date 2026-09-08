extends Node2D

@onready var player = $Objects/Player
var plant_scene:PackedScene = preload("res://scenes/level/plant.tscn")
@export var datyime_gradient: Gradient

func _process(_delta: float) -> void:                                           # 时间表
	var daytime_point: float = 1.0 - $DayTimer.time_left /   $DayTimer.wait_time# 时间计时
	$CanvasModulate.color = datyime_gradient.sample(daytime_point)              # 调色滤镜读取 datyime_gradient
	if Input.is_action_just_pressed('ui_focus_next'):
		day_switch()
		print('123')

func _on_player_tool_use(tool: int, pos: Vector2) -> void:                      # 工具信号逻辑
	var grid_pos = Vector2i(int(pos.x/16),int(pos.y/16))                        # 像素坐标转方格坐标
	if tool == player.Tools.HOE:                                                # 判断是否拿着锄头
		var cell = $Layers/GrassLayer.get_cell_tile_data(grid_pos) as TileData  # 读取当前瓦片数据和坐标
		if cell and cell.get_custom_data('usable'):                             # 判断当前坐标是否有草地和是否可开垦
			$Layers/SoilLayer.set_cells_terrain_connect([grid_pos],0,0)         # 游戏内转换地块
	if tool == player.Tools.WATER:                                              # 浇水逻辑
		if $Layers/SoilLayer.get_cell_tile_data(grid_pos) :                     # 判断是否为以浇水
			$Layers/SoilwaterLayer.set_cell(grid_pos,0,Vector2i(randi_range(0,2),0))  # 网格坐标,图编号,随机取值	
	if tool == player.Tools.AXE:                                                # 斧头逻辑
		for tree in get_tree().get_nodes_in_group('Trees') :                    # 循环树的坐标
			if tree.position.distance_to(pos) < 20:                             # 像素小于10
				tree.hit()                                                      # 调用受击闪烁函数

func _on_player_seed_use(seed_enum: int, pos: Vector2) -> void:                      # 播种信号逻辑
	var grid_pos = Vector2i(int(pos.x/16),int(pos.y/16))                             # 方块坐标转像素坐标,用来判断是否开垦
	if $Layers/SoilLayer.get_cell_tile_data(grid_pos) as TileData:                   # 判断是否可种植
		var plant_pos = Vector2(grid_pos.x * 16 + 8,grid_pos.y * 16 - 4)             # 种植位置
		var plant = plant_scene.instantiate() as StaticBody2D                        # 接收文件
		plant.setup(seed_enum,grid_pos)                                              # 传入作物信息,坐标用来判断浇没浇水
		$Objects.add_child(plant)                                                    # 绑到节点下
		plant.position = plant_pos                                                   # 设定坐标

func day_switch():
	var tween = create_tween()
	tween.tween_property($CanvasLayer/ColorRect,'modulate:a',1.0,1.0)  # modulate:a   a为透明度通道 r为红色通道
	tween.tween_interval(1.0)
	tween.tween_callback(level_reset)
	tween.tween_property($CanvasLayer/ColorRect,'modulate:a',0.0,1.0)

func level_reset():                                                   # 昼夜切换判断浇水生长
	for plant in get_tree().get_nodes_in_group('Plants'):                       # 循环出所有种地地块
		plant.grow(plant.grid_pos in $Layers/SoilwaterLayer.get_used_cells())   # 找出同时种地并浇水地块
	$Layers/SoilwaterLayer.clear()                                              # 切换天后清除水
	$DayTimer.start()
