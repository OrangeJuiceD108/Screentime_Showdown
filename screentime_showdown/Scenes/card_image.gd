extends Node2D

@export var card_information : Card_Information

@onready var art = $Art
@onready var card_name = $Name
@onready var description = $Description

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	art.texture = card_information.art
	
	card_name.text = "[center][b]" + card_information.card_name
	description.text = "[center]" + card_information.description
