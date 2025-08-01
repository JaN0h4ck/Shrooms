extends Node2D

@export var basement_position : Node2D
@export var shop_position : Node2D

@export var shop_camera : Camera2D
@export var basement_camera : Camera2D
@export var lexicon_camera : Camera2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready():
	EventBus.interact_basement.connect(teleport_basement)
	EventBus.interact_shop.connect(teleport_shop)
	EventBus.interact_lexikon.connect(lexicon)
	EventBus.lexicon_back.connect(cameraShop)

func teleport_basement():
	audio_stream_player.set("parameters/switch_to_clip", &"Basement")
	$teleport_point_basement/BasementDoorAudio.play()
	var player : Player = get_tree().get_first_node_in_group("player")
	player.position = basement_position.position
	
	shop_camera.enabled = false
	lexicon_camera.enabled = false
	basement_camera.enabled = true

func teleport_shop():
	audio_stream_player.set("parameters/switch_to_clip", &"Shop")
	$teleport_point_shopt/ShopDoorAudio.play()
	var player : Player = get_tree().get_first_node_in_group("player")
	player.position = shop_position.position
	
	basement_camera.enabled = false
	lexicon_camera.enabled = false
	shop_camera.enabled = true
	

func lexicon():
	basement_camera.enabled = false
	lexicon_camera.enabled = true
	shop_camera.enabled = false
	
func cameraShop():
	shop_camera.enabled = true
	lexicon_camera.enabled = false
	basement_camera.enabled = false
