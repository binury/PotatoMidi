extends Resource

var default_config = {
    "channel_mappings": {
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
    "instruments": [
        {
            "name": "guitar_strummer",
            "channels": [
                "ACOUSTIC_GRAND_PIANO",
                "BRIGHT_ACOUSTIC_PIANO",
                "ELECTRIC_GRAND_PIANO",
                "HONKY_TONK_PIANO",
                "RHODES_PIANO",
                "CHORDS",
                "SYNTH_PAD"
            ],
            "pitch_range": {
                "min": 40,
                "max": 80
            }
        },
        {
            "name": "talk_effect",
            "channels": [
                "ACOUSTIC_GRAND_PIANO",
                "BRIGHT_ACOUSTIC_PIANO",
                "ELECTRIC_GRAND_PIANO",
                "HONKY_TONK_PIANO",
                "RHODES_PIANO",
                "CHORDS",
                "SYNTH_PAD"
            ],
            "pitch_range": {
                "min": 12,
                "max": 40
            }
        }
    ],
    "sfx_mappings": [
        {
            "channels": [
                "DRUMS",
                "PERCUSSION"
            ],
            "pitch": 35,
            "effect": "punch",
            "apply_pitch": false
        },
        {
            "channels": [
                "DRUMS",
                "PERCUSSION"
            ],
            "pitch": 36,
            "effect": "jump",
            "apply_pitch": false
        },
        {
            "channels": [
                "DRUMS",
                "PERCUSSION"
            ],
            "pitch_list": [
                48,
                54
            ],
            "effect": "tambourine",
            "apply_pitch": false
        },
        {
            "channels": [
                "ACOUSTIC_GRAND_PIANO",
                "BRIGHT_ACOUSTIC_PIANO",
                "ELECTRIC_GRAND_PIANO",
                "HONKY_TONK_PIANO",
                "RHODES_PIANO",
                "CHORDS",
                "SYNTH_PAD"
            ],
            "pitch_range": {
                "min": 72,
                "max": 100
            },
            "effect": "bark_cat",
            "apply_pitch": true
        }
    ],
    "talk_effect_letter_mappings": [
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 12,
                "max": 15
            },
            "letter": "A",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 15,
                "max": 18
            },
            "letter": "B",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 18,
                "max": 21
            },
            "letter": "C",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 21,
                "max": 24
            },
            "letter": "D",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 24,
                "max": 27
            },
            "letter": "E",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 27,
                "max": 30
            },
            "letter": "F",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 30,
                "max": 33
            },
            "letter": "G",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 33,
                "max": 36
            },
            "letter": "H",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 36,
                "max": 39
            },
            "letter": "I",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 39,
                "max": 42
            },
            "letter": "J",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 42,
                "max": 45
            },
            "letter": "K",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 45,
                "max": 48
            },
            "letter": "L",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 48,
                "max": 51
            },
            "letter": "M",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 51,
                "max": 54
            },
            "letter": "N",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 54,
                "max": 57
            },
            "letter": "O",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 57,
                "max": 60
            },
            "letter": "P",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 60,
                "max": 63
            },
            "letter": "Q",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 63,
                "max": 66
            },
            "letter": "R",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 66,
                "max": 69
            },
            "letter": "S",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 69,
                "max": 72
            },
            "letter": "T",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 72,
                "max": 75
            },
            "letter": "U",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 75,
                "max": 78
            },
            "letter": "V",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 78,
                "max": 81
            },
            "letter": "W",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 81,
                "max": 84
            },
            "letter": "X",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 84,
                "max": 87
            },
            "letter": "Y",
            "apply_pitch": false
        },
        {
            "channels": [
                "VOCAL",
                "CHOIR"
            ],
            "pitch_range": {
                "min": 87,
                "max": 90
            },
            "letter": "Z",
            "apply_pitch": false
        }
    ]
}

func get_config():
	return default_config