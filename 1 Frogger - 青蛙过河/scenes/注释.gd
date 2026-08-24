extends Node2D

# 零
# 游戏每秒至少30帧
# position 坐标 可以直接访问面板的坐标
# 1280x720

################################################

# 一
# 初始定义方向度
# var direction： Vector2 = 	Vector2.({初始坐标位置}) # 创建二维初始坐标变量
# var speed： {整数/浮点数} = {数值}                  # 定义速度变量

# 持续函数
# func _process(delta: float) -> void:                       # 无碰撞
# func _physics_process(delta: float) -> void:               # 有碰撞

# 键盘映射
# direction = Input.get_vector("left","right","up","down")  # 键盘按键上下左右移动方向
# if Input.is_action_pressed("动作小写"):                     # 判断键盘按下,每帧输出一次
#	direction = Vector2.{动作大写}                            # 上一行判断后执行移动
# if Input.is_action_just_pressed("{动作名称}"):              # 判断键盘按下,输出一次

# 实现移动
# position += direction * speed    # 无碰撞
# velocity = direction * speed     # 有碰撞
# move_and_slide()                 # 驱动 velocity 移动
  
# 动画
# 精灵帧要开启自动播发和循环播放
# 记得调用函数
# func animation():
#	if direction:                                                                # 检测是否存在移动方向
#		${动画节点名}.flip_h = direction.x > 0                                     # 左右播放动画的翻转
#		if direction. x != 0:                                                    # 判断左右移动还是上下移动,为了向卸下走 脸是朝向左右
#			${动画节点名}.animation = "left"                                 # 判断为左右移动
#		else:
#			${动画节点名}.animation = 'up' if direction.y < 0 else 'down'    # 播放向上下动画
#	else:                                                                        # 设定精灵帧的待机帧
#		${动画节点名}.frame = 0 
################################################













 

# 预加载 实例化 生成显示图片
# var {变量名}_scene = preload("{文件位置}")
# var {变量名} = {变量名}_scene.instantiate()
# ${生成的子节点}.add_child(变量名)


# 销毁指令函数
# queue_free()                                               
