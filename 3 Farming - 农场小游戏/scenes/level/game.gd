extends Node2D

@onready var player = $Objects/Player
var plant_scene:PackedScene = preload("res://scenes/level/plant.tscn")

func _process(_delta: float) -> void:                                  # tab切换天数
	if Input.is_action_just_pressed('ui_focus_next'):
		day_switch()

func _on_player_tool_use(tool: int, pos: Vector2) -> void:
	var grid_pos = Vector2i(int(pos.x/16),int(pos.y/16))
	if tool == player.Tools.HOE:                                                # 判断是否拿着锄头
		var cell = $Layers/GrassLayer.get_cell_tile_data(grid_pos) as TileData  # 读取当前瓦片数据和坐标
		if cell and cell.get_custom_data('usable'):                             # 判断当前坐标是否有草地和是否可开垦
			$Layers/SoilLayer.set_cells_terrain_connect([grid_pos],0,0)         # 游戏内转换地块
	if tool == player.Tools.WATER: 
		if $Layers/SoilLayer.get_cell_tile_data(grid_pos) :                     # 判断是否为以开垦
			$Layers/SoilwaterLayer.set_cell(grid_pos,0,Vector2i(randi_range(0,2),0))  # 网格坐标,图编号,随机取值	
	if tool == player.Tools.AXE: 
		for tree in get_tree().get_nodes_in_group('Trees') :
			if tree.position.distance_to(pos) < 10:
				tree.hit()

func _on_player_seed_use(seed_enum: int, pos: Vector2) -> void:                      # 播种逻辑
	var grid_pos = Vector2i(int(pos.x/16),int(pos.y/16))
	if $Layers/SoilLayer.get_cell_tile_data(grid_pos) as TileData:
		var plant_pos = Vector2(grid_pos.x * 16 + 8,grid_pos.y * 16 - 4)
		var plant = plant_scene.instantiate() as StaticBody2D
		plant.setup(seed_enum,grid_pos)
		$Objects.add_child(plant)
		plant.position = plant_pos

func day_switch():
	var tween = create_tween()
	tween.tween_property($CanvasLayer/ColorRect,'modulate:a',1.0,1.0)  # modulate:a   a为透明度通道 r为红色通道
	tween.tween_interval(1.0)
	tween.tween_callback(level_reset)
	tween.tween_property($CanvasLayer/ColorRect,'modulate:a',0.0,1.0)

func level_reset():                                                   # 昼夜切换生长
	for plant in get_tree().get_nodes_in_group('Plants'):
		plant.grow()
