extends Camera2D

const CAMERA_MOVEMENT_SPEED : float = 10
const CAMERA_ZOOM_SPEED : Vector2 = Vector2(0.6, 0.6)
const CAMERA_ZOOM_DEFAULT : Vector2 = Vector2(1.0, 1.0)
const CAMERA_ZOOM_MIN : Vector2 = Vector2(0.6, 0.6)
const CAMERA_ZOOM_MAX : Vector2 = Vector2(2.0, 2.0)
const CAMERA_TWEEN_DURATION : float = 0.5

var m_CameraTween : Tween = null

func _ready() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, 'offset', Vector2(0, 200), 1)

func _process(_delta) -> void:
	if (Input.is_action_pressed("mr")):
		move_local_x(CAMERA_MOVEMENT_SPEED)
		
	elif (Input.is_action_pressed("ml")):
		move_local_x(-CAMERA_MOVEMENT_SPEED)
		
	if (Input.is_action_pressed("mu")):
		move_local_y(-CAMERA_MOVEMENT_SPEED)
		
	elif (Input.is_action_pressed("md")):
		move_local_y(CAMERA_MOVEMENT_SPEED)
		
	if (Input.is_action_just_pressed("mmu")):
		if (get_zoom() < CAMERA_ZOOM_MAX):
			if (m_CameraTween == null or not m_CameraTween.is_running()):
				m_CameraTween = create_tween()
				m_CameraTween.tween_property(self, "zoom", get_zoom() * (CAMERA_ZOOM_DEFAULT + CAMERA_ZOOM_SPEED),
												CAMERA_TWEEN_DURATION).set_trans(Tween.TRANS_CUBIC)
		
	elif (Input.is_action_just_pressed("mmd")):
		if (get_zoom() > CAMERA_ZOOM_MIN):
			if (m_CameraTween == null or not m_CameraTween.is_running()):
				m_CameraTween = create_tween()
				m_CameraTween.tween_property(self, "zoom", get_zoom() / (CAMERA_ZOOM_DEFAULT + CAMERA_ZOOM_SPEED),
												CAMERA_TWEEN_DURATION).set_trans(Tween.TRANS_CUBIC)
