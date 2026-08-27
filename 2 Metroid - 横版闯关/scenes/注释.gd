extends Node2D

# 零
# 游戏每秒至少30帧
# position 坐标 可以直接访问面板的坐标
# 1280x720

################################################

# 一 俯视角
# 导入
# var {变量名}_scene = preload("{文件路径}.tscn")

# 位置方向
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
 
# 创建动画
# 行走动画1.4秒
# 跳跃动画不自动
# 创建静态贴图放入精灵帧，添加节点AnimationPlayer，动画新建输入动画名，左上加号属性轨道，选择精灵帧frame，右键插入关键帧,自动循环播放
# ${动画节点名}.current_animation = '{播放动作}' if direction_x else '{动作名2}'    # 播放动画判断切换

# 缩放动画
# 创建静态贴图放入精灵帧，添加节点AnimationPlayer，动画新建输入动画名，左上加号属性轨道，选择精灵帧scale，右键插入关键帧
# ${动画名}.play("{动作名}")        # 调用

# 补间动画
# var tween = get_tree().create_tween()
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
# await  ${动画名}.animation_finished               # 播放完动画
# func _on_detection_area_body_entered({检测节点名}: {检测类型}) -> void: # 检测进入修改
# if '{函数名} ' in body:                                # 判断 body 内部是否有指定函数名
# body.{函数名}                                     # 连锁执行参数,触发函数内部的参数，可以是另一个文件的函数
