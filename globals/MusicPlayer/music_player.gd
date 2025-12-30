extends Node

# Music catalog

# Logic
@export var audio_player : AudioStreamPlayer

func play_music(music):
	audio_player.stream = music
	audio_player.play()
