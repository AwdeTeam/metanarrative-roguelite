# https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html#doc-singletons-autoload
extends Node

const Entity = preload("res://Entity.gd")



export (Array) var characters = []
export (Array) var cities = []
export (String) var main_arc = ""

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func begin_story():
	self.generate_cities()
	self.generate_entities()
	self.generate_initial_story()


func generate_cities():
	for i in 5:
		var city = Entity.new()
		city.type = "city"
		city.entity_name = "Beantown " + String(i)
		cities.append(city)


func generate_entities():
	# generate protagonist 
	var pro = Entity.new()
	pro.type = "player"
	pro.entity_name = "Mr. Bean"
	characters.append(pro)
	
	# generate antagonist
	var ant = Entity.new()
	ant.type = "player"
	ant.entity_name = "Alejandro Garbanzo"
	characters.append(ant)
	
	# generate companion
	var comp = Entity.new()
	comp.type = "player"
	comp.entity_name = "Linetti Cannellini"
	characters.append(comp)


func generate_initial_story():
	# choose arc
	var arc_choice = randi() % 3

	if arc_choice == 0:
		main_arc = "redemption"
	elif arc_choice == 1:
		main_arc = "sacrifice"
	elif arc_choice == 2:
		main_arc = "revenge"
	
	# choose initial character to apply to and softly put weight there
	var player_choice = randi() % 3
	characters[player_choice].arc_weights[main_arc] = 1.0