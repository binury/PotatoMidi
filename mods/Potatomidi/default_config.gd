extends Resource

var default_config = {
	"version": 1,
	"channel_mappings":
	{
		"acoustic_grand_piano": 0,
		"bright_acoustic_piano": 1,
		"electric_grand_piano": 2,
		"honky_tonk_piano": 3,
		"rhodes_piano": 4,
		"chords": 5,
		"synth_lead": 6,
		"synth_pad": 7,
		"vocal": 8,
		"drums": 9,
		"percussion": 10,
		"string_ens": 11,
		"choir": 12,
		"orchestra": 13,
		"sfx": 14,
		"general_midi_control": 15
	},
	"instruments":
	[
		{
			"instrument": "guitar_strummer",
			"channels":
			[
				"acoustic_grand_piano",
				"bright_acoustic_piano",
				"electric_grand_piano",
				"honky_tonk_piano",
				"rhodes_piano",
				"chords",
				"synth_pad"
			],
			"pitch_range": {"min": 40, "max": 80},
			"parameters":
			# "base_pitch": 40
			{"apply_pitch": true, "apply_velocity": true}
		},
		{
			"instrument": "talk_effect",
			"channels": ["acoustic_grand_piano"],
			"pitch_range": {"min": 50, "max": 95},
			"parameters":
			# "base_pitch": 50,
			{"apply_pitch": true, "apply_velocity": true, "letter": ["a", "e", "o"]}
		},
		{
			# Bass drum
			"instrument": "sfx",
			"channels": ["drums", "percussion"],
			"pitch_list": [35, 36],
			"parameters": {"base_pitch": 10, "apply_pitch": false, "apply_velocity": false, "sfx_sound": "punch"}
		},
		{
			# Bass drum 2
			"instrument": "sfx",
			"channels": ["drums", "percussion"],
			"pitch_list": [35, 36],
			"parameters": {"base_pitch": 7, "apply_pitch": true, "apply_velocity": true, "sfx_sound": "menu_b"}
		},
		{
			# Snares
			"instrument": "sfx",
			"channels": ["drums", "percussion"],
			"pitch_list": [38, 40],
			"parameters": {"apply_pitch": true, "base_pitch": 40, "apply_velocity": true, "sfx_sound": "tambourine"}
		},
		{
			# Hi-hats closed
			"instrument": "sfx",
			"channels": ["drums", "percussion"],
			"pitch_list": [44],
			"parameters":
			# Maybe better base pitch
			{"apply_pitch": true, "apply_velocity": true, "base_pitch": 60, "sfx_sound": "notification"}
		},
		{
			# Hi-hats open
			"instrument": "sfx",
			"channels": ["drums", "percussion"],
			"pitch_list": [46],
			"parameters":
			# Maybe better base pitch
			{"apply_pitch": true, "apply_velocity": false, "base_pitch": 40, "sfx_sound": "cash3"}
		},
		{
			# Toms
			"instrument": "sfx",
			"channels": ["drums", "percussion"],
			"pitch_list": [41, 43, 45, 47, 48, 50],
			"parameters": {"apply_pitch": false, "apply_velocity": true, "sfx_sound": "woosh"}
		},
		{
			# Toms 2
			"instrument": "sfx",
			"channels": ["drums", "percussion"],
			"pitch_list": [41, 43, 45, 47, 48, 50],
			"parameters": {"apply_pitch": false, "apply_velocity": true, "sfx_sound": "jump"}
		},
		{
			# Cymbals
			"instrument": "sfx",
			"channels": ["drums", "percussion"],
			"pitch_list": [49, 51, 52, 55, 57, 59],
			"parameters": {"apply_pitch": false, "apply_velocity": true, "sfx_sound": "dive_woosh"}
		},
		{
			# Etc.
			"instrument": "sfx",
			"channels": ["drums", "percussion"],
			"pitch_list": [54, 53, 56, 70],  # Tambourine  # Bell  # Cowbell  # Maracas
			"parameters": {"apply_pitch": false, "apply_velocity": false, "sfx_sound": "tambourine"}
		}
	]
}


func get_config() -> Dictionary:
	return default_config
