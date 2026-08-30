extends StaticBody2D

var grid_pos : Vector2        # 作物种植坐标
var max_age: int              # 作物生长阶段
var grow_speed: float         # 生长时间
const plant_data = {          # 建立作物字典
	Global.Seeds.CORN : {'texture':preload('res://graphics/plants/corn.png') , 'max_age' : 3 , 'grow_speed' : 0.6},
	Global.Seeds.TOMATO : {'texture':preload('res://graphics/plants/tomatoes.png') , 'max_age' : 3 , 'grow_speed' : 0.8},
	Global.Seeds.PUMPKIN : {'texture':preload('res://graphics/plants/pumpkin.png') , 'max_age' : 4 , 'grow_speed' : 0.5},
}

func setup(seed_enum:Global.Seeds,grid_position: Vector2i):                     # 作物取值 
	max_age = plant_data[seed_enum]['max_age']
	grow_speed = plant_data[seed_enum]['grow_speed']
	grid_pos = grid_position
	$Sprite2D.texture = plant_data[seed_enum]['texture']

func grow(watered: bool):                                                       # 值为浇没浇水
	print(watered)
