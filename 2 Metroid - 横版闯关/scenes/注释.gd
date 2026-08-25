extends Node2D

# 零
# 游戏每秒至少30帧
# position 坐标 可以直接访问面板的坐标
# 1280x720

################################################

# 一 俯视角
# 位置方向
# var direction: Vector2 = Vector2({初始坐标位置})                                # 创建二维初始坐标变量
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
#		${动画节点名}.flip_h = direction.x > 0                                    # 左右播放动画的翻转
#		if direction. x != 0:                                                   # 判断左右移动还是上下移动,为了向卸下走 脸是朝向左右
#			${动画节点名}.animation = "left"                                      # 判断为左右移动
#		else:
#			${动画节点名}.animation = 'up' if direction.y < 0 else 'down'         # 播放向上下动画
#	else:                                                                       # 设定精灵帧的待机帧
#		${动画节点名}.frame = 0 

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
 
# 函数
# direction_x = Input.get_axis("left","right")    # 只有左右的移动

# 导出至面板
# @export   # 关键字,运行也可修改
# signal    # 信号,导出信号的参数

# 计时冷却
# ${计时器节点名}.time_left == 0    # 作为判断
# ${计时器节点名}.start()           # 作为开启
 
# 实例化场景到指定坐标
# {变量名} = {位置}
