extends Node
class_name TalkEffect


# Audio settings
const DEFAULT_MIDI_ORIGINAL_NOTE = 45 # C3
const TALK_COOLDOWN = 5 # ms between talk effect
const DEFAULT_LETTER = "a"


func _play_talk_effect(player, pitch, letter):
	
	# Send network event
	Network._send_actor_action(player.actor_id, "_talk", [letter.to_lower(), pitch], false, Network.CHANNELS.SPEECH)
	
	# Play local effect
	player._talk(letter.to_lower(), pitch)


func _calculate_talk_pitch(midi_pitch, original_note):
	var semitone_difference = midi_pitch - original_note
	return pow(2, semitone_difference / 12.0)

var _last_talk_time = 0

func trigger_talk(input_event: Dictionary):
	var player = input_event.player
	var event = input_event.event
	var midi_pitch = event.pitch

	var current_time = Time.get_ticks_msec()
	if current_time - _last_talk_time < TALK_COOLDOWN:
		return
	
	var parameters = input_event.parameters

	var letter = parameters.get("letter", "a")

	var apply_pitch = parameters.get("apply_pitch", true)
	
	var base_pitch = parameters.get("base_pitch", DEFAULT_MIDI_ORIGINAL_NOTE)

	if apply_pitch:
		var pitch = _calculate_talk_pitch(midi_pitch, base_pitch)
		_play_talk_effect(player, pitch, letter)
	else:
		_play_talk_effect(player, 1, letter)
	_last_talk_time = current_time
