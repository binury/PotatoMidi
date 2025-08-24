class_name MidiStringQueue
extends Resource

const MAX_SIZE = 6
var queue: Array = []


func _init():
	reset()


func reset():
	queue = range(MAX_SIZE)


func update(last_played_string: int):
	var index = queue.find(last_played_string)
	if index != -1:
		queue.pop_at(index)
	queue.append(last_played_string)


func get_string_priority(string_num: int) -> int:
	return queue.find(string_num)
