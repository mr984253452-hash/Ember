extends StaticBody2D

var grid_pos : Vector2i        # 作物种植坐标
var age : float = 2
var max_age: int              # 作物生长阶段
var grow_speed: float         # 生长时间
const plant_data = {          # 建立作物字典
	Global.Seeds.CORN : {'texture':preload('res://graphics/plants/corn.png') , 'max_age' : 3 , 'grow_speed' : 0.6},
	Global.Seeds.TOMATO : {'texture':preload('res://graphics/plants/tomatoes.png') , 'max_age' : 3 , 'grow_speed' : 0.8},
	Global.Seeds.PUMPKIN : {'texture':preload('res://graphics/plants/pumpkin.png') , 'max_age' : 3 , 'grow_speed' : 0.5},
}

func setup(seed_enum:Global.Seeds,grid_position: Vector2i):                     # 作物取值 
	max_age = plant_data[seed_enum]['max_age']
	grow_speed = plant_data[seed_enum]['grow_speed']
	grid_pos = grid_position
	$Sprite2D.texture = plant_data[seed_enum]['texture']

func grow(watered: bool):                                                       # 浇水生长
	if watered:
		age += min(age + grow_speed,max_age)
		$Sprite2D.frame = int(age)


func _on_static_body_2d_mouse_entered() -> void:  # 作物成熟后 碰触采摘
	if age >= max_age:
		queue_free()
