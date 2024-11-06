extends Node

# MIDI configuration
const MIDI_MIN_VELOCITY = 0.1
const MIDI_MAX_VELOCITY = 1.0

# Exported properties
export(bool) var enable_bark_effects = true

# Internal state
var _state = {
	"is_initialized": false
}
var _player_api

class Instrument:
	var callback: FuncRef
	var channel: int
	var priority: int
	var pitch: int


var instruments = []

onready var _guitar_strummer = preload("res://mods/PotatoMidi/Scripts/Guitar/GuitarStrummer.gd").new()
onready var _sfx_effect = preload("res://mods/PotatoMidi/Scripts/SFX/SFXEffect.gd").new()
onready var _talk_effect = preload("res://mods/PotatoMidi/Scripts/Talk/TalkEffect.gd").new()
onready var _default_config = preload("res://mods/PotatoMidi/default_config.gd").new()
	
func _setup_player_api():
	_player_api = get_node_or_null("/root/BlueberryWolfiAPIs/PlayerAPI")
	
func _setup_midi():
	if OS.open_midi_inputs():
		print("Midi: Successfully opened MIDI inputs")
		_state.is_initialized = true
	else:
		push_error("Midi: Failed to open MIDI inputs")


func _input(event):
	var player = _player_api.local_player
	if not event is InputEventMIDI: return
	
	if event.message == MIDI_MESSAGE_NOTE_ON and event.velocity > 0:
		_handle_note_on(event)

var _last_config: String = ""

var _last_modified_time: int = 0

func _load_config():
	var config_file = File.new()
	if config_file.file_exists("user://PotatoMidi.json"):
		var current_modification_time = config_file.get_modified_time("user://PotatoMidi.json")
		if current_modification_time == _last_modified_time:
			return null

		_last_modified_time = current_modification_time
		config_file.open("user://PotatoMidi.json", File.READ)
		var user_config_content = config_file.get_as_text()
		if user_config_content == _last_config:
			return null
		print("PotatoMidi: Config file modified, reloading...")
		_last_config = user_config_content
		config_file.close()
		
		var parsed_json: JSONParseResult = JSON.parse(user_config_content)
		if parsed_json.error == OK:

			return parsed_json.result
		else:
			print("PotatoMidi: Failed to parse user config.json")
			print(parsed_json.error_string)
	else:
		var default_config = _default_config.get_config()
		config_file.open("user://PotatoMidi.json", File.WRITE)
		config_file.store_string(JSON.print(default_config, "\t"))
		config_file.close()
		return default_config

	return null

func _create_pitch_array(instrument: Dictionary):
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
		print("PotatoMidi: Instrument has no pitch information: ", instrument)
		return null
	

func _add_instrument(callback: FuncRef, channel_lookup: Dictionary, channels: Array, instrument: Dictionary):
	var pitches = _create_pitch_array(instrument)

	for channel in channels:
		var channel_id
		if channel_lookup.has(channel):
			channel_id = channel_lookup[channel]
		else:
			print("PotatoMidi: Unknown channel: ", channel)
			continue
		for pitch in pitches:
			instruments.append({
				"callback": callback,
				"channel": channel_id,
				"pitch": pitch,
				"parameters": instrument.get("parameters", {})
			})

func _validate_instrument(instrument: Dictionary):
	if not instrument.has("name"):
		print("PotatoMidi: Instrument has no name: ", instrument)
		return false
	if not instrument.has("channels"):
		print("PotatoMidi: Instrument has no channels: ", instrument)
		return false
	if _create_pitch_array(instrument) == null:
		print("PotatoMidi: Instrument has no pitch information: ", instrument)
		return false
	return true


func _load_user_config():
	var instruments_lookup = {
		"guitar_strummer": funcref(_guitar_strummer, "input"),
		"talk_effect": funcref(_talk_effect, "trigger_talk"),
		"sfx": funcref(_sfx_effect, "trigger_sfx")
	}

	var config = _load_config()

	if not config:
		return
	instruments = []
	
	var channel_mappings_config = config["channel_mappings"]

	var instruments_config = config.get("instruments", [])

	var sfx_mappings_config = config.get("sfx_mappings", [])

	var talk_effect_letter_mappings_config = config.get("talk_effect_letter_mappings", [])

	for instrument in instruments_config:
		if not _validate_instrument(instrument):
			continue
		var channels = instrument["channels"]
		var instrument_name = instrument["name"]

		var instrument_callback = instruments_lookup[instrument_name]

		if instrument_callback:
			_add_instrument(instrument_callback, channel_mappings_config, channels, instrument)
		else:
			print("PotatoMidi: Unknown instrument: ", instrument_name)
	

func _ready():
	print("PotatoMidi: Initializing MIDI system...")
	_setup_player_api()
	var timer = Timer.new()
	timer.wait_time = 2.0
	timer.autostart = true
	timer.connect("timeout", self, "_load_user_config")
	add_child(timer)
	timer.start()
	_setup_midi()


func _find_best_instrument(event: InputEventMIDI):
	# check for direct matches
	var best_instruments = []
	for instrument in instruments:
		if instrument.pitch == event.pitch and instrument.channel == event.channel:
			best_instruments.append(instrument)
	if best_instruments.size() > 0:
		return best_instruments


func _handle_note_on(event):
	var player = _player_api.local_player
	if not is_instance_valid(player):
		return

	var best_instruments = _find_best_instrument(event)

	if best_instruments and best_instruments.size() > 0:
		for instrument in best_instruments:
			instrument.callback.call_func({
				"player": player,
				"event": event,
				"parameters": instrument.parameters
			})

	# var drums = [114, 116, 118, 35, 36]

	# if _is_drums_compatible_channel(event.channel):
	# 	_handle_drum_event(player, event)
	
	# if _is_guitar_compatible_channel(event.channel):
	# 	var guitar_played = _guitar_strummer.input(event)
	# 	if enable_bark_effects and _sfx_effect and not guitar_played:
	# 		_sfx_effect.trigger_bark(player, event.pitch)
			
	# if _is_vocals_compatible_channel(event.channel):
	# 	_sfx_effect.trigger_bark(player, event.pitch)
