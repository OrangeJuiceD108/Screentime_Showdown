extends Node2D

var is_dragging = false
var touch_pos : Vector2

func _process(delta: float) -> void:
	if is_dragging:
		self.position = touch_pos

func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if not event.canceled:
			is_dragging = true
		else:
			is_dragging = false
	
	if is_dragging:
		touch_pos = event.position



#func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#if event is InputEventScreenDrag:
		#pass # Replace with function body.
