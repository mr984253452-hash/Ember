extends Node2D

@onready var player = $Objects/Player


func _on_player_tool_use(tool: int, pos: Vector2) -> void:
	var grid_pod = Vector2i(int(pos.x/16),int(pos.y/16))
	if tool == player.Tools.HOE:
		var cell = $Layers/GrassLayer.get_cell_tile_data(grid_pod) as TileData  # 读取当前瓦片数据和坐标
		if cell and cell.get_custom_data('usable'):
			$Layers/SoilLayer.set_cells_terrain_connect([grid_pod],0,0)
