extends Node
class_name GuitarStrummer

const HAMMER_ON_WINDOW = 500 # milliseconds
const MIN_VELOCITY_THRESHOLD = 0 # minimum velocity to trigger note

var strings: Array = []
var string_queue: MidiStringQueue

const GuitarNote = preload("res://mods/PotatoMidi/Scripts/Guitar/GuitarNote.gd")
const GuitarString = preload("res://mods/PotatoMidi/Scripts/Guitar/GuitarString.gd")
const MidiStringQueue = preload("res://mods/PotatoMidi/Scripts/Guitar/StringQueue.gd")


func _init():
	_setup_strings()
	string_queue = MidiStringQueue.new()


func _setup_strings():
	# Initialize guitar strings with their base pitches
	var base_pitches = [40, 45, 50, 55, 59, 64]
	strings = []
	for pitch in base_pitches:
		strings.append(GuitarString.new(pitch))

func input(input_event: Dictionary):
	var event = input_event.event
	if not _is_valid_midi_note_on(event):
		return

	var parameters = input_event.get("parameters", {})

	var volume = 1.0
	if parameters.get("apply_velocity", true):
		volume = -(1 - (event.velocity / 128.0)) * 15
		
	var pitch = event.pitch
	var note = _find_best_note(pitch)
	if note != null:

		play_note(note, volume)
		return
		
	return

func _is_valid_midi_note_on(event: InputEvent) -> bool:
	if not (event is InputEventMIDI):
		return false
	return event.message == MIDI_MESSAGE_NOTE_ON and event.velocity > MIN_VELOCITY_THRESHOLD

func _find_best_note(pitch: int) -> GuitarNote:
	var possible_notes = _find_possible_notes(pitch)
	if possible_notes.size() == 0:
		return null
	return select_best_note(possible_notes)
	
func _find_possible_notes(pitch: int) -> Array:
	var notes = []
	
	for string_idx in strings.size():
		var string = strings[string_idx]
		if string.can_play_pitch(pitch):
			var fret = string.get_fret_for_pitch(pitch)
			notes.append(GuitarNote.new(string_idx, fret))
	
	return notes

func select_best_note(notes: Array) -> GuitarNote:
	var best_note: GuitarNote = notes[0]
	var lowest_priority = string_queue.get_string_priority(notes[0].string)
	
	for note in notes:
		var priority = string_queue.get_string_priority(note.string)
		if priority < lowest_priority:
			best_note = note
			lowest_priority = priority
	
	return best_note

func play_note(note: GuitarNote, velocity: float):
	var string = strings[note.string]
	var current_time = OS.get_system_time_msecs()
	var time_since_last_strum = current_time - string.last_strum_time

	if should_hammer_on(time_since_last_strum, note.fret, string.last_fret):
		emit_hammer_on(note)
	else:
		emit_regular_strum(note)
		string.update_strum(note.fret, current_time)
	
	string_queue.update(note.string)

func should_hammer_on(time_delta: int, new_fret: int, last_fret: int) -> bool:
	return time_delta < HAMMER_ON_WINDOW and new_fret != last_fret

func emit_hammer_on(note: GuitarNote):
	PlayerData.emit_signal("_hammer_guitar", note.string, note.fret)

func emit_regular_strum(note: GuitarNote, velocity: float):
	PlayerData.emit_signal("_play_guitar", note.string, note.fret, velocity)
