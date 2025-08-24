class_name GuitarString
extends Resource

var base_pitch: int
var last_strum_time: int = 0
var last_fret: int = 0


func _init(pitch: int):
	base_pitch = pitch


func update_strum(fret: int, time: int):
	last_strum_time = time
	last_fret = fret


func can_play_pitch(pitch: int) -> bool:
	return pitch >= base_pitch and pitch < base_pitch + 16


func get_fret_for_pitch(pitch: int) -> int:
	return pitch - base_pitch
