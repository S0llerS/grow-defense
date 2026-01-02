extends Node

# SFX catalog
const HOVERED = preload("uid://bbvr0wpd2a432")
const PRESSED = preload("uid://dqvo4slhtxovl")

const TRANSITION = preload("uid://dux6ums3x8hu7")

const EXPLOSION = preload("uid://djql5r5i2poka")

const ENEMY_ATTACK = preload("uid://cjeaflig7ptya")

const ENEMY_DAMAGED = preload("uid://drxc32crqda65")
const ENEMY_DESTROYED = preload("uid://sobvbeg84xai")

# plants
const PLANT = preload("uid://ck833psr13bts")

const SUNFLOWER = preload("uid://dcedo00wijl23")
const MUSHROOM = preload("uid://c1smdslyvm6oi")
const FREEZE = preload("uid://di77fuygctkfj")

const WATERMELON = preload("uid://dvg2o1fxa8sh6")
const MORTAR = preload("uid://byl6s0whcyp5a")

# Logic
var audio_players

func _ready() -> void:
	audio_players = get_children()

func play_sound(sound):
	for audio_player in audio_players:
		if !audio_player.playing:
			audio_player.stream = sound
			audio_player.pitch_scale = randf_range(0.95, 1.05)
			
			audio_player.play()
			
			break
