extends Node


export (String) var entity_name = ""
export (String) var type = ""  # "player" or "city"
export (float) var strength = 0.0
export (float) var health = 0.0
export (float) var pride = 0.0
export (float) var protection = 0.0

# unclear if these are really necessary, as should be by-product of above 4
export (float) var alignment_ge = 0.0  # good-evil
export (float) var alignment_lc = 0.0  # lawful-chaotic

export (Dictionary) var arc_weights = {"redemption": 0.0, "sacrifice": 0.0, "revenge": 0.0}
export (Array) var story_path = []
export (Dictionary) var story_graph = {}

# ??
#export (int) var renown = 0
#export (int) var sanity = 0

# func _init():
#     self.entity_name = entity_name
#     pass