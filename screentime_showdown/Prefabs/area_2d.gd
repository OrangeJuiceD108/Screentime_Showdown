extends Area2D

@onready var parent := $".."
var dragging = false
var offset = Vector2.ZERO

func _input_event(viewport: Viewport, event: InputEvent, shape_index: int):
	if event is InputEventScreenTouch:
		if event.pressed:
			dragging = true
			offset = parent.global_position - event.position
		else:
			dragging = false

func _input(event: InputEvent) -> void:
	if dragging and event is InputEventScreenDrag:
		# Update the parent node’s position
		parent.global_position = event.position + offset
