class_name Card_Information extends Resource

@export var card_name : String
@export_multiline var description : String

@export var art : Texture2D

@export_enum("COMMON", "UNCOMMON", "RARE", "SUPER RARE") var rarity: int
