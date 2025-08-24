extends Resource

var default_config = {
	"version": 1,
	"channel_mappings":
	{
		"ACOUSTIC_GRAND_PIANO": 0,
		"BRIGHT_ACOUSTIC_PIANO": 1,
		"ELECTRIC_GRAND_PIANO": 2,
		"HONKY_TONK_PIANO": 3,
		"RHODES_PIANO": 4,
		"CHORDS": 5,
		"SYNTH_LEAD": 6,
		"SYNTH_PAD": 7,
		"VOCAL": 8,
		"DRUMS": 9,
		"PERCUSSION": 10,
		"STRING_ENS": 11,
		"CHOIR": 12,
		"ORCHESTRA": 13,
		"SFX": 14,
		"GENERAL_MIDI_CONTROL": 15
	},
	"instruments":
	[
		{
			"instrument": "guitar_strummer",
			"channels":
			[
				"ACOUSTIC_GRAND_PIANO",
				"BRIGHT_ACOUSTIC_PIANO",
				"ELECTRIC_GRAND_PIANO",
				"HONKY_TONK_PIANO",
				"RHODES_PIANO",
				"CHORDS",
				"SYNTH_PAD"
			],
			"pitch_range": {"min": 40, "max": 80},
			"parameters":
			# "base_pitch": 40
			{"apply_pitch": true, "apply_velocity": true}
		},
		{
			"instrument": "talk_effect",
			"channels": ["ACOUSTIC_GRAND_PIANO"],
			"pitch_range": {"min": 50, "max": 95},
			"parameters":
			# "base_pitch": 50,
			{"apply_pitch": true, "apply_velocity": true, "letter": "random"}
		},
		{
			# Bass drum
			"instrument": "sfx",
			"channels": ["DRUMS", "PERCUSSION"],
			"pitch_list": [35, 36],
			"parameters": {"base_pitch": 10, "apply_pitch": false, "apply_velocity": false, "sfx_sound": "punch"}
		},
		{
			# Bass drum 2
			"instrument": "sfx",
			"channels": ["DRUMS", "PERCUSSION"],
			"pitch_list": [35, 36],
			"parameters": {"base_pitch": 7, "apply_pitch": true, "apply_velocity": true, "sfx_sound": "menu_b"}
		},
		{
			# Snares
			"instrument": "sfx",
			"channels": ["DRUMS", "PERCUSSION"],
			"pitch_list": [38, 40],
			"parameters": {"apply_pitch": true, "base_pitch": 40, "apply_velocity": true, "sfx_sound": "tambourine"}
		},
		{
			# Hi-hats closed
			"instrument": "sfx",
			"channels": ["DRUMS", "PERCUSSION"],
			"pitch_list": [44],
			"parameters":
			# Maybe better base pitch
			{"apply_pitch": true, "apply_velocity": true, "base_pitch": 60, "sfx_sound": "notification"}
		},
		{
			# Hi-hats open
			"instrument": "sfx",
			"channels": ["DRUMS", "PERCUSSION"],
			"pitch_list": [46],
			"parameters":
			# Maybe better base pitch
			{"apply_pitch": true, "apply_velocity": false, "base_pitch": 40, "sfx_sound": "cash3"}
		},
		{
			# Toms
			"instrument": "sfx",
			"channels": ["DRUMS", "PERCUSSION"],
			"pitch_list": [41, 43, 45, 47, 48, 50],
			"parameters": {"apply_pitch": false, "apply_velocity": true, "sfx_sound": "woosh"}
		},
		{
			# Toms 2
			"instrument": "sfx",
			"channels": ["DRUMS", "PERCUSSION"],
			"pitch_list": [41, 43, 45, 47, 48, 50],
			"parameters": {"apply_pitch": false, "apply_velocity": true, "sfx_sound": "jump"}
		},
		{
			# Cymbals
			"instrument": "sfx",
			"channels": ["DRUMS", "PERCUSSION"],
			"pitch_list": [49, 51, 52, 55, 57, 59],
			"parameters": {"apply_pitch": false, "apply_velocity": true, "sfx_sound": "dive_woosh"}
		},
		{
			# Etc.
			"instrument": "sfx",
			"channels": ["DRUMS", "PERCUSSION"],
			"pitch_list": [54, 53, 56, 70],  # Tambourine  # Bell  # Cowbell  # Maracas
			"parameters": {"apply_pitch": false, "apply_velocity": false, "sfx_sound": "tambourine"}
		}
	]
}


func get_config():
	return default_config
