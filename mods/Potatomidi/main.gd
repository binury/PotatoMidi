extends Node

enum MidiNote {
	C_neg1,   # 0
	Cs_neg1,  # 1
	D_neg1,   # 2
	Ds_neg1,  # 3
	E_neg1,   # 4
	F_neg1,   # 5
	Fs_neg1,  # 6
	G_neg1,   # 7
	Gs_neg1,  # 8
	A_neg1,   # 9
	As_neg1,  # 10
	B_neg1,   # 11

	C0,   # 12
	Cs0,  # 13
	D0,   # 14
	Ds0,  # 15
	E0,   # 16
	F0,   # 17
	Fs0,  # 18
	G0,   # 19
	Gs0,  # 20
	A0,   # 21
	As0,  # 22
	B0,   # 23

	C1,   # 24
	Cs1,  # 25
	D1,   # 26
	Ds1,  # 27
	E1,   # 28
	F1,   # 29
	Fs1,  # 30
	G1,   # 31
	Gs1,  # 32
	A1,   # 33
	As1,  # 34
	B1,   # 35

	C2,   # 36
	Cs2,  # 37
	D2,   # 38
	Ds2,  # 39
	E2,   # 40
	F2,   # 41
	Fs2,  # 42
	G2,   # 43
	Gs2,  # 44
	A2,   # 45
	As2,  # 46
	B2,   # 47

	C3,   # 48
	Cs3,  # 49
	D3,   # 50
	Ds3,  # 51
	E3,   # 52
	F3,   # 53
	Fs3,  # 54
	G3,   # 55
	Gs3,  # 56
	A3,   # 57
	As3,  # 58
	B3,   # 59

	C4,   # 60
	Cs4,  # 61
	D4,   # 62
	Ds4,  # 63
	E4,   # 64
	F4,   # 65
	Fs4,  # 66
	G4,   # 67
	Gs4,  # 68
	A4,   # 69
	As4,  # 70
	B4,   # 71

	C5,   # 72
	Cs5,  # 73
	D5,   # 74
	Ds5,  # 75
	E5,   # 76
	F5,   # 77
	Fs5,  # 78
	G5,   # 79
	Gs5,  # 80
	A5,   # 81
	As5,  # 82
	B5,   # 83

	C6,   # 84
	Cs6,  # 85
	D6,   # 86
	Ds6,  # 87
	E6,   # 88
	F6,   # 89
	Fs6,  # 90
	G6,   # 91
	Gs6,  # 92
	A6,   # 93
	As6,  # 94
	B6,   # 95

	C7,   # 96
	Cs7,  # 97
	D7,   # 98
	Ds7,  # 99
	E7,   # 100
	F7,   # 101
	Fs7,  # 102
	G7,   # 103
	Gs7,  # 104
	A7,   # 105
	As7,  # 106
	B7,   # 107

	C8,   # 108
	Cs8,  # 109
	D8,   # 110
	Ds8,  # 111
	E8,   # 112
	F8,   # 113
	Fs8,  # 114
	G8,   # 115
	Gs8,  # 116
	A8,   # 117
	As8,  # 118
	B8,   # 119

	C9,   # 120
	Cs9,  # 121
	D9,   # 122
	Ds9,  # 123
	E9,   # 124
	F9,   # 125
	Fs9,  # 126
	G9    # 127
}


const MIDI_NOTE_NAMES := {
	0: "C-1",
	1: "C#-1",
	2: "D-1",
	3: "D#-1",
	4: "E-1",
	5: "F-1",
	6: "F#-1",
	7: "G-1",
	8: "G#-1",
	9: "A-1",
	10: "A#-1",
	11: "B-1",
	12: "C0",
	13: "C#0",
	14: "D0",
	15: "D#0",
	16: "E0",
	17: "F0",
	18: "F#0",
	19: "G0",
	20: "G#0",
	21: "A0",
	22: "A#0",
	23: "B0",
	24: "C1",
	25: "C#1",
	26: "D1",
	27: "D#1",
	28: "E1",
	29: "F1",
	30: "F#1",
	31: "G1",
	32: "G#1",
	33: "A1",
	34: "A#1",
	35: "B1",
	36: "C2",
	37: "C#2",
	38: "D2",
	39: "D#2",
	40: "E2",
	41: "F2",
	42: "F#2",
	43: "G2",
	44: "G#2",
	45: "A2",
	46: "A#2",
	47: "B2",
	48: "C3",
	49: "C#3",
	50: "D3",
	51: "D#3",
	52: "E3",
	53: "F3",
	54: "F#3",
	55: "G3",
	56: "G#3",
	57: "A3",
	58: "A#3",
	59: "B3",
	60: "C4",
	61: "C#4",
	62: "D4",
	63: "D#4",
	64: "E4",
	65: "F4",
	66: "F#4",
	67: "G4",
	68: "G#4",
	69: "A4",
	70: "A#4",
	71: "B4",
	72: "C5",
	73: "C#5",
	74: "D5",
	75: "D#5",
	76: "E5",
	77: "F5",
	78: "F#5",
	79: "G5",
	80: "G#5",
	81: "A5",
	82: "A#5",
	83: "B5",
	84: "C6",
	85: "C#6",
	86: "D6",
	87: "D#6",
	88: "E6",
	89: "F6",
	90: "F#6",
	91: "G6",
	92: "G#6",
	93: "A6",
	94: "A#6",
	95: "B6",
	96: "C7",
	97: "C#7",
	98: "D7",
	99: "D#7",
	100: "E7",
	101: "F7",
	102: "F#7",
	103: "G7",
	104: "G#7",
	105: "A7",
	106: "A#7",
	107: "B7",
	108: "C8",
	109: "C#8",
	110: "D8",
	111: "D#8",
	112: "E8",
	113: "F8",
	114: "F#8",
	115: "G8",
	116: "G#8",
	117: "A8",
	118: "A#8",
	119: "B8",
	120: "C9",
	121: "C#9",
	122: "D9",
	123: "D#9",
	124: "E9",
	125: "F9",
	126: "F#9",
	127: "G9"
}

const NOTE_TO_MIDI := {
	"C-1": 0,
	"C#-1": 1,
	"D-1": 2,
	"D#-1": 3,
	"E-1": 4,
	"F-1": 5,
	"F#-1": 6,
	"G-1": 7,
	"G#-1": 8,
	"A-1": 9,
	"A#-1": 10,
	"B-1": 11,
	"C0": 12,
	"C#0": 13,
	"D0": 14,
	"D#0": 15,
	"E0": 16,
	"F0": 17,
	"F#0": 18,
	"G0": 19,
	"G#0": 20,
	"A0": 21,
	"A#0": 22,
	"B0": 23,
	"C1": 24,
	"C#1": 25,
	"D1": 26,
	"D#1": 27,
	"E1": 28,
	"F1": 29,
	"F#1": 30,
	"G1": 31,
	"G#1": 32,
	"A1": 33,
	"A#1": 34,
	"B1": 35,
	"C2": 36,
	"C#2": 37,
	"D2": 38,
	"D#2": 39,
	"E2": 40,
	"F2": 41,
	"F#2": 42,
	"G2": 43,
	"G#2": 44,
	"A2": 45,
	"A#2": 46,
	"B2": 47,
	"C3": 48,
	"C#3": 49,
	"D3": 50,
	"D#3": 51,
	"E3": 52,
	"F3": 53,
	"F#3": 54,
	"G3": 55,
	"G#3": 56,
	"A3": 57,
	"A#3": 58,
	"B3": 59,
	"C4": 60,
	"C#4": 61,
	"D4": 62,
	"D#4": 63,
	"E4": 64,
	"F4": 65,
	"F#4": 66,
	"G4": 67,
	"G#4": 68,
	"A4": 69,
	"A#4": 70,
	"B4": 71,
	"C5": 72,
	"C#5": 73,
	"D5": 74,
	"D#5": 75,
	"E5": 76,
	"F5": 77,
	"F#5": 78,
	"G5": 79,
	"G#5": 80,
	"A5": 81,
	"A#5": 82,
	"B5": 83,
	"C6": 84,
	"C#6": 85,
	"D6": 86,
	"D#6": 87,
	"E6": 88,
	"F6": 89,
	"F#6": 90,
	"G6": 91,
	"G#6": 92,
	"A6": 93,
	"A#6": 94,
	"B6": 95,
	"C7": 96,
	"C#7": 97,
	"D7": 98,
	"D#7": 99,
	"E7": 100,
	"F7": 101,
	"F#7": 102,
	"G7": 103,
	"G#7": 104,
	"A7": 105,
	"A#7": 106,
	"B7": 107,
	"C8": 108,
	"C#8": 109,
	"D8": 110,
	"D#8": 111,
	"E8": 112,
	"F8": 113,
	"F#8": 114,
	"G8": 115,
	"G#8": 116,
	"A8": 117,
	"A#8": 118,
	"B8": 119,
	"C9": 120,
	"C#9": 121,
	"D9": 122,
	"D#9": 123,
	"E9": 124,
	"F9": 125,
	"F#9": 126,
	"G9": 127
}

const CONFIG_FILE_PATH = "user://PotatoMidi.json"
var global_config_file_path = ProjectSettings.globalize_path(CONFIG_FILE_PATH)

# MIDI configuration
const MIDI_MIN_VELOCITY = 0.1
const MIDI_MAX_VELOCITY = 1.0

onready var Players = get_node("/root/ToesSocks/Players")
onready var Chat = get_node("/root/ToesSocks/Chat")

# Exported properties
export(bool) var enable_bark_effects = true

# Internal state
var _state = {"is_initialized": false}
var config := {}


class Instrument:
	var callback: FuncRef
	var channel: int
	var priority: int
	var pitch: int


# https://soundprogramming.net/file-formats/general-midi-instrument-list/
var instruments = []

onready var _guitar_strummer = preload("res://mods/PotatoMidi/Scripts/Guitar/GuitarStrummer.gd").new()
onready var _sfx_effect = preload("res://mods/PotatoMidi/Scripts/SFX/SFXEffect.gd").new()
onready var _talk_effect = preload("res://mods/PotatoMidi/Scripts/Talk/TalkEffect.gd").new()
onready var _default_config = preload("res://mods/PotatoMidi/default_config.gd").new()
onready var JSONMinifier = preload("res://mods/PotatoMidi/Lib/json_minifier.gd").new()

var DEBUG = false


func _setup_midi():
	if OS.open_midi_inputs():
		print("Midi: Successfully opened MIDI inputs")
		_state.is_initialized = true
	else:
		Chat.notify("Midi: Failed to open MIDI inputs")


func _input(event: InputEvent) -> void:
	var player = Players.local_player
	if not event is InputEventMIDI:
		return
	if not event.message == MIDI_MESSAGE_NOTE_ON:
		return
	if DEBUG:
		print(
			{
				"channel": event.channel,
				"instrument": event.instrument,
				"pitch": event.pitch,
				"pressure": event.pressure,
				"velocity": event.velocity
			}
		)

	if event.message == MIDI_MESSAGE_NOTE_ON and event.velocity > 0:
		_handle_note_on(event)


var _last_config: String = ""

var _last_modified_time: int = 0


func _load_config() -> Dictionary:
	var new_config := {}
	var config_file := File.new()
	if config_file.file_exists(CONFIG_FILE_PATH):
		# TODO: This is weird dont do this
		var current_modification_time := config_file.get_modified_time(CONFIG_FILE_PATH)
		if current_modification_time != _last_modified_time:
			_last_modified_time = current_modification_time
			config_file.open(CONFIG_FILE_PATH, File.READ)
			var parsed_json := JSON.parse(JSONMinifier.minify_json(config_file.get_as_text()))
			var result = parsed_json.result
			config_file.close()
			if typeof(result) != TYPE_DICTIONARY or parsed_json.error != OK:
				Chat.write(
					"PotatoMidi: Oops! Something is broken in your configuration. [url=file://%s]Click here to edit config.json[/url] and try again!" % global_config_file_path
				)
				Chat.write("[color=red]Error encountered while parsing: %s[/color]" % parsed_json.error_string)
			elif parsed_json.result.hash() != config.hash():
				if config.empty() == false:
					Chat.notify("PotatoMidi: Config file modified, reloading...")
				new_config = parsed_json.result
	else:
		var default_config = _default_config.get_config()
		config_file.open(CONFIG_FILE_PATH, File.WRITE)
		config_file.store_string(JSON.print(default_config, "\t"))
		config_file.close()
	return new_config


func _create_pitch_array(instrument: Dictionary) -> Array:
	if instrument.has("pitch_range"):
		var pitch_range = instrument["pitch_range"]
		return range(pitch_range["min"], pitch_range["max"])
	elif instrument.has("pitch"):
		var pitch = instrument["pitch"]
		return [pitch]
	elif instrument.has("pitch_list"):
		var pitch_list = instrument["pitch_list"]
		return pitch_list
	else:
		Chat.write(
			(
				"[color=yellow]"
				+ "PotatoMidi: One or more of your instruments has [b]no pitch information.[/b]"
				+ "You may safely ignore this message if this is intentional, although it likely is not..."
				+ "[/color]"
			)
		)
		instrument.pitch_range = {"min": MidiNote.C0, "max": MidiNote.G9}
		return _create_pitch_array(instrument)


func _add_instrument(callback: FuncRef, channel_lookup: Dictionary, channels: Array, instrument: Dictionary) -> void:
	var pitches := _create_pitch_array(instrument)
	var params: Dictionary = instrument.get("parameters", {})
	if not params.has("base_pitch"):
		params.base_pitch = MidiNote.C3 if pitches.empty() else pitches[0]

	for channel in channels:
		var channel_id
		if channel_lookup.has(channel):
			channel_id = channel_lookup[channel]
		else:
			print("PotatoMidi: Unknown channel: ", channel)
			continue
		for pitch in pitches:
			instruments.append({"callback": callback, "channel": channel_id, "pitch": pitch, "parameters": params})

	if DEBUG:
		print("Potatomidi: Loaded instruments:")
		print(instruments)


func _validate_instrument(instrument) -> bool:
	var error: String
	if typeof(instrument) != TYPE_DICTIONARY:
		error = "Invalid instruments configuration. Check your instruments list for typos..."
	elif not instrument.has("instrument"):
		error = "%s has no instrument set" % instrument
	elif not instrument.has("channels"):
		error = "%s has no channels" % instrument
	elif _create_pitch_array(instrument).empty():
		# This should no longer ever happen
		error = "%s has no pitch information" % instrument
	if error:
		Chat.write("[color=red]PotatoMidi: " + error + "[/color]")
		push_error("[PotatoMidi]: " + error)
		return false
	return true


func _load_user_config() -> void:
	var instruments_lookup = {
		"guitar_strummer": funcref(_guitar_strummer, "input"),
		"talk_effect": funcref(_talk_effect, "trigger_talk"),
		"sfx": funcref(_sfx_effect, "trigger_sfx")
	}

	config = _load_config()

	if config.empty():
		return
	instruments = []

	var channel_mappings_config: Dictionary = config["channel_mappings"]

	var instruments_config: Array = config.get("instruments", [])

	var sfx_mappings_config: Array = config.get("sfx_mappings", [])

#	var talk_effect_letter_mappings_config = config.get("talk_effect_letter_mappings", [])

	for instrument in instruments_config:
		if not _validate_instrument(instrument):
			continue
		var channels: Array = instrument["channels"]
		var instrument_name: String = instrument["instrument"]
		instrument_name = instrument_name.to_lower()

		var instrument_callback = instruments_lookup[instrument_name]

		if instrument_callback:
			_add_instrument(instrument_callback, channel_mappings_config, channels, instrument)
		else:
			var msg: String = "Unknown instrument %s" % instrument_name
			Chat.write("[color=yellow]PotatoMidi: (warning)" + msg + "[/color]")
			if DEBUG:
				print("[PotatoMidi]: %s" % msg)


func _ready() -> void:
	print("PotatoMidi: Initializing MIDI system...")
	var timer = Timer.new()
	timer.wait_time = 2.0
	timer.autostart = true
	timer.connect("timeout", self, "_load_user_config")
	add_child(timer)
	timer.start()
	_setup_midi()


func _find_best_instrument(event: InputEventMIDI) -> Array:
	var best_instruments = []
	for instrument in instruments:
		if instrument.pitch == event.pitch and instrument.channel == event.channel:
			best_instruments.append(instrument)
	return best_instruments


func _handle_note_on(event: InputEvent) -> void:
	var player = Players.local_player
	if not is_instance_valid(player):
		return

	for instrument in _find_best_instrument(event):
		instrument.callback.call_func({"player": player, "event": event, "parameters": instrument.parameters})

	# var drums = [114, 116, 118, 35, 36]

	# if _is_drums_compatible_channel(event.channel):
	# 	_handle_drum_event(player, event)

	# if _is_guitar_compatible_channel(event.channel):
	# 	var guitar_played = _guitar_strummer.input(event)
	# 	if enable_bark_effects and _sfx_effect and not guitar_played:
	# 		_sfx_effect.trigger_bark(player, event.pitch)

	# if _is_vocals_compatible_channel(event.channel):
	# 	_sfx_effect.trigger_bark(player, event.pitch)
