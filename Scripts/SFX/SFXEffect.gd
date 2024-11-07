extends Node
class_name SFXEffect

# Audio settings

const DEFAULT_MIDI_ORIGINAL_NOTE = 45 # C3
const BARK_COOLDOWN = 5 # ms between barks


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

	var effect = parameters.get("sfx_sound")
	
	var face_emote = parameters.get("face_emote", null)

	if face_emote:
		player._sync_face_emote(face_emote)

	var apply_pitch = parameters.get("apply_pitch", true)
	var base_pitch = parameters.get("base_pitch", DEFAULT_MIDI_ORIGINAL_NOTE)

	if apply_pitch:
		var pitch = _calculate_sfx_pitch(midi_pitch, base_pitch)
		player._sync_sfx(effect, null, pitch)
	else:
		player._sync_sfx(effect, null, 1)

	_last_bark_time = current_time

func _calculate_sfx_pitch(midi_pitch, original_note):
	var semitone_difference = midi_pitch - original_note
	return pow(2, semitone_difference / 12.0) * bark_pitch_multiplier
