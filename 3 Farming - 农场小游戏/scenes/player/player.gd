extends CharacterBody2D

@onready var move_state_machine:AnimationNodeStateMachinePlayback = $AnimationTree.get('parameters/MoveStateMachine/playback')
@onready var tool_state_machine:AnimationNodeStateMachinePlayback = $AnimationTree.get('parameters/ToolStateMachine/playback')

var direction: Vector2
var speed := 100
var can_move := true                                                           # 设定工具使用时不能移动

signal tool_use(tool : Tools, pos : Vector2)

enum Tools {HOE,AXE,WATER}                                                      # 建立枚举
var current_tool :Tools = Tools.HOE                                             # 设定枚举初始
const tool_connection = {
	Tools.HOE : 'hoe',
	Tools.AXE : 'axe',
	Tools.WATER : 'water',
}

func _physics_process(_delta: float) -> void:
	if can_move:
		get_input()
	animation()
	velocity = direction * speed * int(can_move)                # 有碰撞
	move_and_slide()                          # 驱动 velocity 移动

func get_input():                                                               # 键盘映射
	direction = Input.get_vector("left","right","up","down")                    # 接收wasd
	if Input.is_action_just_pressed("action"):
		tool_state_machine.travel(tool_connection[current_tool])                                        # 判断空格 使用工具
		$AnimationTree.set('parameters/OneShot/request',AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE) # AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE 命令单次动画节点执行一次播放
		can_move = false
		tool_use.emit(current_tool,position)
	
	if Input.is_action_just_pressed("tool_forward") or Input.is_action_just_pressed("tool_backward") :  # 判断q和e输入
		var tool_direction = Input.get_axis("tool_backward","tool_forward") as int                  # 用于相加切换
		current_tool = posmod(current_tool + tool_direction,Tools.size()) as Tools                  # posmod()正向取模函数,内部需要输入最小值和最大值 Tools.size()来计算内部有几个元素,用来取最大值
	
func animation():                                                               # 角色动画
	if direction: 
		move_state_machine.travel('move')
		var target_vector : Vector2 = Vector2(round(direction.x),round(direction.y))               # 移动坐标四舍五入
		$AnimationTree.set('parameters/MoveStateMachine/move/blend_position',target_vector)
		$AnimationTree.set('parameters/MoveStateMachine/idle/blend_position',target_vector)
		for state in tool_connection.values():
			$AnimationTree.set('parameters/ToolStateMachine/' + state + '/blend_position',target_vector)
	else :
		move_state_machine.travel('idle')
				  


func _on_animation_tree_animation_finished(_anim_name: StringName) -> void:
	can_move = true 
