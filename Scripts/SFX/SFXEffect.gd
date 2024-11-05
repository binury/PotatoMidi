extends Node
class_name SFXEffect

# Audio settings

const BARK_COOLDOWN = 5     # ms between barks


# Exported properties
export(float) var bark_pitch_multiplier = 1.0

# Internal state
var _last_bark_time = 0


func trigger_sfx(input_event: Dictionary):
	var player = input_event.player
	var midi_pitch = input_event.event.pitch
	var parameters = input_event.parameters

	var current_time = Time.get_ticks_msec()
	if current_time - _last_bark_time < BARK_COOLDOWN:
		return

	var effect = parameters.effect
	
	if effect == "bark_cat" or effect == "bark_dog":
		player._sync_face_emote("bark")


	var apply_pitch = parameters.get("apply_pitch", true)
	if apply_pitch:
		var pitch = _calculate_sfx_pitch(midi_pitch, 80)
		player._sync_sfx(effect, null, pitch)
	else:
		player._sync_sfx(effect, null, 1)

	_last_bark_time = current_time

func _calculate_sfx_pitch(midi_pitch, original_note):
	var semitone_difference = midi_pitch - original_note
	return pow(2, semitone_difference / 12.0) * bark_pitch_multiplier
