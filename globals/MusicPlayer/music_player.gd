extends Node

# Music catalog
const SPACE_AMBIENT = preload("uid://75rwwv6yopxv")

# Logic
@export var audio_player : AudioStreamPlayer

func play_music(music):
	if audio_player.playing and audio_player.stream == music:
		return
	
	audio_player.stream = music
	audio_player.play()

func stop_music():
	audio_player.stop()
