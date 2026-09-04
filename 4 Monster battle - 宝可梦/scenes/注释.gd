extends Node2D

# 零
# 游戏每秒至少30帧
# position 坐标 可以直接访问面板的坐标
# 1280x720
# 速度 speed

# Dictionary 字典
# Array 数组


################################################

# 一 俯视角
# 导入
# var {变量名}_scene = preload("{文件路径}.tscn")

# 位置方向
# Vector2i                                                                      # 整数二维向量
# var direction: Vector2 = Vector2                                              # 所有二维向量都要创建
# var direction = Vector2.LEFT                                                  # 指定方向左侧,RIGHT右
#	if position.x < 0:                                                          # 判断在画面左侧还是右侧
#		direction.x = 1                                                         # 和下面的速度配合来取到相反的方向
#       ${贴图节点名}.flip_h = true                                               # 贴图翻转
# var speed： {整数/浮点数} = {数值}                                               # 定义速度变量
# 

# 持续函数
# func _process(delta: float) -> void:                                          # 无碰撞
# func _physics_process(delta: float) -> void:                                  # 有碰撞

# 键盘映射
# direction = Input.get_vector("left","right","up","down")                      # 键盘按键上下左右移动方向
# if Input.is_action_pressed("动作小写"):                                        # 判断键盘按下,每帧输出一次
#	direction = Vector2.{动作大写}                                               # 上一行判断后执行移动
# if Input.is_action_just_pressed("{动作名称}"):                                 # 判断键盘按下,输出一次

# 实现移动
# position += direction * speed    # 无碰撞
# velocity = direction * speed     # 有碰撞
# move_and_slide()                 # 驱动 velocity 移动
  
# 动画
# 精灵帧要开启自动播发和循环播放
# 记得调用函数
# func animation():
#	if direction:                                                               # 检测是否存在移动方向
#		${精灵帧贴图节点名}.flip_h = direction.x > 0                                    # 左右播放动画的翻转
#		if direction. x != 0:                                                   # 判断左右移动还是上下移动,为了向卸下走 脸是朝向左右
#			${精灵帧贴图节点名}.animation = "left"                                      # 判断为左右移动
#		else:
#			${精灵帧贴图节点名}.animation = 'up' if direction.y < 0 else 'down'         # 播放向上下动画
#	else:                                                                       # 设定精灵帧的待机帧
#		${精灵帧贴图节点名}.frame = 0 

# 调用 预加载 实例化 生成显示图片  
# var {变量名}_scene : PackedScene = preload("{文件位置}")                         # 置顶调用打包，PackedScene 设为打包格式
# var {变量名} = {变量名}_scene.instantiate()                                     # 实例化
# ${生成的节点}.add_child(变量名)                                                  # 实例挂载

# 从多个坐标点随机抽取一个坐标生成物体
# var {变量名}_marker = ${生成的节点}.get_children().pick_random()                 # gat_children() 返回该节点所有子节点,pick_random() 随机抽取一个节点
# car.position = {变量名}_marker.position                                        # 读取坐标 

# 用户界面
# 锚点                                                                          # Control,Layout,Layout Mode,Anchors,Anchor Points 修改为相对坐标/Anchor Offsets 锚点绝对值偏移
# 文字                                                                          # Control,Theme Overrides,Fonts 字体/Font Sizes 尺寸/Layout,Anchors Preset,Custom,Anchor Offsets 位置偏移
# 函数控制文本                                                                    # ${文本节点名}.text = str({修改内容}) 
# 文本水平居中                                                                    # Label,Horizontal Align,Center

# 场景切换                                                                       
# call_deferred('{函数名}')                                                      # 需用创建两个函数,函数名为下一条代码的函数名,以延迟运算
# get_tree().change_scene_to_file('{文件路径}')

# 信号 函数 功能代码 实用功能
# 计时器                                                                         # 开启一次 开启自动触发
# 进入当前区域信号                                                                 # Area2D 的 bodt_entered(body:Node2D)
# 进入屏幕信号                                                                    # screen_entered()
# 离开屏幕信号                                                                    # screen_exited()
# 销毁指令函数                                                                    # queue_free() 
# 帧率抵消                                                                       # *delta
# 函数内绑定信号                                                                  # {变量名}.connect("{信号名}",{触发后需要执行的函数名}) ,有的信号调用需要在函数内填入作为容器的参数名
# y轴排序                                                                        # CanvasItem,Ordering,Y Sotr Enab 用于调节前后贴图
# 创建全局数据                                                                    # 建立场景挂载脚本 脚本内创建函数自定内容,项目设置 全局,添加场景tscn,在另外脚本内 Global.{全局函数变量名} = {变量名}

# 音乐
# 自动播放AndioStreamPlayer,Autoplay
# 循环播放AndioStreamPlayer.Parameters

################################################

# 二 横版跳跃
# 方向
# var direction_x : float          # 只有左右
# velocity.y = -10                 # 跳跃10
# velocity.y += 10                 # 重力
 
# 移动 跳跃
# direction_x = Input.get_axis("left","right")    # 只有左右的移动
# if is_on_floor():                               # 判断玩家是否在地面上

# 导出至面板
# @export   # 关键字,运行也可修改
# signal    # 信号,导出信号的参数

# 计时冷却
# ${计时器节点名}.time_left == 0    # 作为判断
# ${计时器节点名}.start()           # 作为开启
# ${计时器节点名}.stop()            # 作为停止

# 创建动画
# 行走动画1.4秒
# 跳跃动画不自动
# 创建静态贴图放入精灵帧，添加节点AnimationPlayer，动画新建输入动画名，左上加号属性轨道，选择精灵帧frame，右键插入关键帧,自动循环播放
# ${动画节点名}.current_animation = '{播放动作}' if direction_x else '{动作名2}'    # 播放动画判断切换

# 关键帧动画
# 在需执行函数的动漫面板下添加调用方法轨道,在指定针下右键添加函数(需保存)

# 缩放动画
# 创建静态贴图放入精灵帧，添加节点AnimationPlayer，动画新建输入动画名，左上加号属性轨道，选择精灵帧scale，右键插入关键帧
# ${动画名}.play("{动作名}")        # 调用

# 明暗动画
# 使用灯泡后 添加 属性轨道 energy 动画

# 着色器
# 2d  选择贴图节点后,CanvasItem,material,material,shader,VisualShader,Canvas Iten
# Vertex 是颜色 Color 是透明度 灰色是填入浮点数 不同深浅代表各类向量数据
# 给贴图图像整图添加颜色  ColorConstant  连接Color
# 给贴图图像添加颜色 Color 连接Color
# 透明度 FioatConstant 连接 Alpha
# 计算浮点数运算 multiply(*) 图像是FL匕
# 设置半透明用 Color + FloatConstant 连接到 multiply(*) 再连到 Alpha
# 面板颜色参数节点 colorpara 可添加至面板利用函数调节
# 两种颜色做混合 调节占比 mix3维
# 面板浮点数 FloatParameter

# 函数修改面板着色器参数
# 图片{节点名}.根路径.set_{第二个折叠路径}('{参数名}',{修改数值})
# 补间函数 tween.tween_property({节点名}.根路径,'{第二个折叠路径}/{参数名}',{修改数值},{持续时间})

# 补间动画
# var tween = get_tree().create_tween()
# tween.set_loops()                             # 括号内填循环次数
# tween.tween_property(${贴图节点名},'{需变换的属性}'Vector2(变化的数值),变化时间).from(Vector2(起始数值))

# 鼠标朝向对应动画帧
# 建立字典
#const {新建字典名} = {
#	Vector2i(1,1):   0,
#	Vector2i(1,0):   1,
#	Vector2i(0,1):   2,
#	Vector2i(-1,1):  3,
#	Vector2i(-1,0):  4,
#	Vector2i(-1,-1): 5,
#	Vector2i(0,-1):  6,
#	Vector2i(1,-1):  7,
#}

# var raw_dir = get_local_mouse_position().normalized()                        # get_local_mouse_position() 用于获得以脚本为中心的相对位置鼠标位置, normalized() 用作归一化
# var adjusted_dir = Vector2i(round(raw_dir.x),round(raw_dir.y))               # 鼠标位置四舍五入
# $Torso.frame = gun_directions[adjusted_dir]                                  # 字典关联四舍五入取值

# 瓦片图层
# 面板新建瓦片集 再次点击瓦片新建出现详细选项
# 碰撞层 开启详细选项的状态下TileMapLayer,Physics Layers 
# 碰撞设置 底下TileSet 是碰撞设置,绘制,物理层0
# 图层CanvasItem,Ordering,Zlndex
# 复制瓦片 下方面板鼠标图案后框选

# 追随玩家
# var player : CharacterBody2D      # 建立追随对象指定类型
# func _on_detection_area_body_entered(Player_bodt: CharacterBody2D) -> void:    # 传入追随对象坐标
#	player = Player_bodt
#func _physics_process(delta: float) -> void:                                    # 建立每帧更新坐标追随
#	if player:                                                                   # 判断是否 存在记录坐标
#		var dir = (player.position - position).normalized()                      # 两个对象之间坐标相减并归一化
#		velocity = dir * speed
#		move_and_slide()
#player = null                                                                   # 离开检测时清除player内数据

# 分组
# 打印所有分组内节点
#func _ready() -> void:
#	print(get_tree().get_nodes_in_group('{分组名}'))
# 从分组取出坐标 ,计算距离执行函数
#	for drone in get_tree().get_nodes_in_group('{分组名}'):
#		if position.distance_to(drone.position) < 10:                               # 判断 取出的坐标距离小于10像素
#			drone.{函数名}()                                                         # 小于调用爆炸函数

# 实用函数
# position = {坐标} + {方向} * 10                   # 以玩家为中心 朝鼠标方向偏移 10
# ${节点名}.show()                                  # 显示节点贴图
# ${节点名}.hide()                                  # 隐藏节点贴图
# await ${动画名}.animation_finished               # 结束播放完动画
# func _on_detection_area_body_entered({检测节点名}: {检测类型}) -> void: # 检测进入修改
# if '{函数名} ' in body:                                # 判断 body 内部是否有指定函数名
# body.{函数名}                                     # 连锁执行参数,触发函数内部的参数，可以是另一个文件的函数
# ${声音节点名}.play()                               # 调用音乐

# 判断连锁爆炸
# var is_{变量名}: bool = false        # 设定初始状态
# is_{变量名} = true                   # 达成目标
# if not is_{变量名}:                  # 判断是否达成模版,达成后执行

# 灯光
# 太阳光需要调到混合模式 Mix 才能与别的灯泡一起生效
# 太阳光可以 添加剪去当前灯光 Light2D,Blend_mode
# 添加太阳光阴影时 需要勾选太阳光节点的阴影
# 灯泡可以自定义渐变光源贴图 GradientTexture2D

########################################

# 三 星露谷
# 
# 控制动画
# 播放动画   右键控制动画树面板插入 动画选项 连接到输出,播放次数由动画设置决定
# 动画切换   One Shot 右键右键控制动画树面板插入 上面是常态动画 
# 状态机     StateMachine  右键右键控制动画树面板插入 需要点击打开编辑器 选择左上角连接节点(小飞机图标)
# 方向动画   状态机界面右键 添加BlendSpace2D 需要点击小铅笔进入方向动画界面 添加移动点 和游戏里的y轴相反
# 进入控制动画面板 需需双击控制动画节点

# 切换待机动画 Start -> idle  <- 不带自动播放互联->  move 
# @onready var move_state_machine:AnimationNodeStateMachinePlayback = ${控制动画节点名}.get('parameters/MoveStateMachine/playback')
# {创建的路径节点名}.travel('{状态名称}')

# 函数修改控制动画
# ${节点名}.set("{路径}",{修改数值})

# 枚举
# 建立枚举 enum Tools {如 HOE,AXE,WATER}                                          # 用于建立如多项农具,来减少输入格式字母错误
# 设定枚举初始 var current_tool : Tools = 如 Tools.HOE                             # 用于相加切换
# current_tool = posmod(current_tool + 1,Tools.size()) as Tools                 # posmod()正向取模函数,内部需要输入最小值和最大值 Tools.size()来计算内部有几个元素,用来取最大值
#	if Input.is_action_just_pressed("tool_forward"):
#		current_tool = posmod(current_tool + 1,Tools.size()) as Tools
#	if Input.is_action_just_pressed("tool_backward"):
#		current_tool = posmod(current_tool - 1,Tools.size()) as Tools
# 缩减代码
#	if Input.is_action_just_pressed("tool_forward") or Input.is_action_just_pressed("tool_backward") :
#		var tool_direction = Input.get_axis("tool_backward","tool_forward") as int
#		current_tool = posmod(current_tool + tool_direction,Tools.size()) as Tools

# 从字典里遍历出值并循环出所有 state 的拼接语句,减少代码行数
# for state in {需遍历字典}.values():

# 工具使用时不能动                                   # 非循环动画结束时
# 控制动画信号 animation_finished
# {建立布尔变量} := true
#	if {建立布尔变量}:
#		{键盘映射函数}
#	velocity = direction * speed * int({建立布尔变量}) 
# 播放动画时 can_move = false
# 动画结束信号 {建立布尔变量} := tru

# 自动铺瓦
# 瓦片集匹配模式 面板 terrain_set_0.mode 添加元素 Match Corners Sides
# 建立拼接显示 面板 terrain_set_0.terrain_0.添加元素
# 设定拼接贴图 下面板 TileSet 绘制 地形 选择拼接显示 选择颜色,最后选择贴图上所有可拼接方格
# 设定后铺瓦 TileMap 地形 地图集中选择贴图
# 设定变体瓦片 设定拼接贴图完在绘制标签概率
# 建立瓦片动画 不自动创建图块 选择一张贴图 选择标签 动画里修改列数 Frames添加帧数 TileMap 图块选择第一种瓦片
# 碰撞Physicn Layers  添加元素 选择图层 TileSet 绘制 物理层0
# 瓦片做限制 面板 Custom Data Layers Type为bool 面板下 TileSet 绘制自定义数据 启用

# 分组判断 物品是否在某种格子内 
# ${瓦片集节点}.get_used_cells()

# 给创建的信号赋值
# {变量名}.emit({值}) 

# 游戏内按键转换地块
# {瓦片节点路径}.set_cells_terrain_connect([{网格坐标}],{Terrain_Sets里的第几个},{Terrains里的第几个})
# 随机取地块
# ${瓦片节点路径}.set_cell(网格坐标,图编号,Vector2i(randi_range(范围),0))
#
# 着色器闪烁动画fragment()  面板Material.shader.Shader fragment()
#uniform float progress : hint_range(0.0,1.0);          # 浮点变量 0~1 之间
#void fragment() {                                      # 修改输出颜色 混合颜色
#	COLOR.rgb = mix(COLOR.rgb,vec3(1.0),progress); 
#}
# 修复共享着色器 Material.Resource_local_to_scene 开启
# 
# 自定义停止时长
# await get_tree().create_timer({时长}).timeout

# 字典索引
# 新建变量名 = 字典名[索引]['[值]']

# 纯色矩形函数修改
# modulate:a                                                 # a为透明度通道 r为红色通道
# 转变为黑色 面板Visibility.Modulate 透明度设为0

# 补间动画进阶
# 暂停时长 tween.tween_interval({时长})
# 使用函数 tween.tween_callback({使用函数})

# 作物生长
# 	if watered:
#		age += min(grow_speed,max_age)  # grow_speed 为生长速度,max_age为最大生长时长
#		$[作物贴图].frame = int(age)

# 叠加调色滤镜,天黑
# 需要配套计时器 开启 wait_time autostart
# 创建 @export var datyime_gradient: Gradient
# 根节点面板 datyime_gradient 
# 新建 双击过渡标
# 三个标e9d3c2  ffffff 3e5695
# var daytime_point: float = 1.0 - ${计时器}.time_left /   ${计时器}.wait_tim
# ${叠加调色滤镜节点}.color = datyime_gradient.sample(daytime_point)                        # 调色滤镜读取 datyime_gradient
# 第二天重启计时器 ${计时器}.start()
# tab = ui_focus_next

#####################################

# 4.宝可梦

# ui精灵帧
# Texture.AtlasTextue.拖入精灵帧到 Atlas.在 region w和h 里填入单张帧的像素大小

# IU按钮
# 绑定信号 pressed 建立函数
# 鼠标穿透 选择按钮节点 面板Mouse.mouse_filter.Ignore
# 向节点内添加新节点 ${根节点}.add_child({添加的子节点})

# ！！！！！！！给另一个文件传参数，？预加载,初始化参数
# setup()

# 节点附参数
# 文本 .txet
# 图片  .texture            load()

# if判断 
# match {判断==}:

# 任何按键都会触发的函数 func _input(event: InputEvent) -> void:

# 键盘按键名称
# esc = ui_cancel

# 键盘交点
# await get_tree().process_frame
# ${节点名}.get_child(0).grab_focus()
# 滚动条交点开启 面板 follow_focus 

# 忽略警告
# @warning_ignore

# 补间隐藏
# tween.tween_property($AttackSprite,'visible',false,0)

# 函数
# .pop_at()  去除值并剔除
# .append()  添加回去
# .erase()   删除

# 用界面展示图片做初始帧
# var new_atlas: AtlasTexture = AtlasTexture.new()
# new_atlas.atlas = load(Global.monster_data[Global.current_enemy]['front texture'])
# new_atlas.region = Rect2i(Vector2i.ZERO,Vector2i(96,96))
# $Monsters/Enemy.texture = new_atlas

# 用界面展示图片做动画
# @export var animation_index: int = 0  # 建立动画播放帧
#func _process(delta: float) -> void:                                                     # 精灵帧播放函数
#	var atlas = $Monsters/Enemy.texture as AtlasTexture                                  # 读取纹理传入位置
#	atlas.region = Rect2i(Vector2(96 * animation_index,0),Vector2i(96,96))               # 位置xy,尺寸xy
# 建立动画轨道 插入帧选择帧号
