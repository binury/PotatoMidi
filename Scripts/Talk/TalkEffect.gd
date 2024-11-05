extends Node
class_name TalkEffect


# Audio settings
const MIDI_ORIGINAL_NOTE = 45 # C3
const TALK_COOLDOWN = 5     # ms between talk effect


func _play_talk_effect(player, pitch, letter = "a"):
	
	# Send network event
	Network._send_actor_action(player.actor_id, "_talk", [letter.to_lower(), pitch], false)
	
	# Play local effect
	player._talk(letter.to_lower(), pitch)





func _calculate_talk_pitch(midi_pitch):
	var semitone_difference = midi_pitch - MIDI_ORIGINAL_NOTE
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
	if not letter:
		letter = "a"

	var apply_pitch = parameters.get("apply_pitch", true)
	if apply_pitch:
		var pitch = _calculate_talk_pitch(midi_pitch)
		_play_talk_effect(player, pitch, letter)
	else:
		_play_talk_effect(player, 1, letter)
	_last_talk_time = current_time
