extends Node2D

@export var CardList = ["res://Resources/my_nuts.tres", "common2", "common3", "uncommon1", "uncommon2", "rare1", "rare2"]
@export var commons = ["common1", "common2", "common3"]
@export var uncommons = ["uncommon1", "uncommon2"]
@export var rares = ["rare1", "rare2"]

# pack_size: int
# rarity_dist: Array [common_percent, uncommon_percent, rare_percent]
# guaranteed: Array [#common, #uncommon, #rare]
func open_pack(pack_size: int, rarity_dist: Array, guaranteed: Array) -> Array:
	var return_pack = []

	# Add guaranteed cards
	for j in range(guaranteed[0]):
		return_pack.append(commons[randi() % commons.size()])
	for l in range(guaranteed[1]):
		return_pack.append(uncommons[randi() % uncommons.size()])
	for p in range(guaranteed[2]):
		return_pack.append(rares[randi() % rares.size()])
	
	var total_guaranteed = guaranteed[0] + guaranteed[1] + guaranteed[2]
	
	# Add the rest of the cards based on probability
	for i in range(pack_size - total_guaranteed):
		var chance = randi() % 100
		if chance < rarity_dist[0]:
			return_pack.append(commons[randi() % commons.size()])
		elif chance < rarity_dist[0] + rarity_dist[1]:
			return_pack.append(uncommons[randi() % uncommons.size()])
		else:
			return_pack.append(rares[randi() % rares.size()])
	
	return return_pack
