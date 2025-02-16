extends Node2D

#Initializes inventory
func write_to_file():
	var file = FileAccess.open("res://player_inventory.txt", FileAccess.WRITE) # Open the file in write mode
	if file:
		file.store_string("Inventory:") # Write text to the file
		file.close() # Close the file
	else:
		print("Failed to open file for writing")
#Adds to inventory
func append_to_file(cards: Array):
	var file = FileAccess.open("res://player_inventory.txt", FileAccess.WRITE) # Open file in append mode
	var readfile = FileAccess.open("user://my_file.txt", FileAccess.READ)
	var content = "";
	if readfile:
		content = file.get_as_text() # Read the entire file as a string
		file.close()
	else:
		print("Failed to open file for reading")
		return "" # Return an empty string if the file couldn't be opened
	if file:
		file.store_string(content)
		for j in range(cards.size()):
			file.store_string("\n") # Append text
			file.store_string(cards[j]) # Append text
		file.close()
	else:
		print("Failed to open file for appending")
#Retrieve inventory
func read_from_file():
	var file = FileAccess.open("res://player_inventory.txt", FileAccess.READ) # Open file in read mode
	var inventory = ""
	if file:
		var content = file.get_as_text() # Read the entire file content
		inventory = content.split("\n")
		inventory.remove_at(0)
		file.close()
		print(content) # Print to output console
	else:
		print("Failed to open file for reading")
	return inventory
