extends CharacterBody2D

var direction_x : float                                                         # 只做左右移动
var speed: int = 100
@export var jump_strength: = 10                                                 # @export 面板显示跳跃高度
@export var gravity: = 10                                                       # @export 面板重力数值
signal shoot(pos: Vector2, dir:Vector2)                                         # 在面板添加信号

const gun_directions = {
	Vector2i(1,1):   0,
	Vector2i(1,0):   1,
	Vector2i(0,1):   2,
	Vector2i(-1,1):  3,
	Vector2i(-1,0):  4,
	Vector2i(-1,-1): 5,
	Vector2i(0,-1):  6,
	Vector2i(1,-1):  7,
}

func gat_input():                                                               # 抓取键盘映射
	direction_x = Input.get_axis("left","right")                                # 左右的映射
	if Input.is_action_just_pressed("jump"):                                    # 检测跳跃
		velocity.y = -jump_strength
	if Input.is_action_just_pressed("shoot") and $ReloadTimer.time_left == 0 :  # 读取计时器剩余时间,并在计时器面板启用单词计时 
		shoot.emit(position,get_local_mouse_position().normalized())            # 给新信号传输坐标和方向, get_local_mouse_position() 用于获得以脚本为中心的相对位置鼠标位置, normalized() 用作归一化来给子弹做指引方向
		$ReloadTimer.start()                                                    # 启动射击间隔计数器

func apply_gracity(delta):                                                      # 创建重力新图
	velocity.y += gravity * delta                   # ? delta 用于控制重力倍率

func _physics_process(delta: float) -> void:                                    # 玩家左右移动
	gat_input()
	velocity.x = direction_x * speed                                            # 只做左右移动时的碰撞移动
	apply_gracity(delta)
	move_and_slide()                                                            # 驱动velocity.x
	ahinmation()

func ahinmation():                                                              # 角色动画
	$legs.flip_h = direction_x < 0                                              # 左右跑翻转
	if is_on_floor():                                                           # 判断玩家是否在地面上
		$AnimationPlayer.current_animation = 'run' if direction_x else 'idle'   # 判断待机和跑步动画
	else :
		$AnimationPlayer.current_animation = 'jump'                             # 玩家跳跃
	var raw_dir = get_local_mouse_position().normalized()
	var adjusted_dir = Vector2i(round(raw_dir.x),round(raw_dir.y))               # 鼠标位置四舍五入
	$Torso.frame = gun_directions[adjusted_dir]
	
