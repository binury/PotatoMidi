extends Resource

var default_config = {
    "version": 1,
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
            "instrument": "guitar_strummer",
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
            },
            "parameters": {
                "apply_velocity": true,
            }
        },
        {
            "instrument": "talk_effect",
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
            },
            "parameters": {
                "apply_pitch": true,
                "base_pitch": 53,
                "letter": "a"
            },
        },
        {
            "instrument": "sfx",
            "channels": [
                "DRUMS",
                "PERCUSSION"
            ],
            "pitch": 35,
            "parameters": {
                "apply_pitch": false,
                "sfx_sound": "punch"
            }
        },
        {
            "instrument": "sfx",
            "channels": [
                "DRUMS",
                "PERCUSSION"
            ],
            "pitch": 36,
            "parameters": {
                "apply_pitch": false,
                "sfx_sound": "jump"
            }
        },
        {
            "instrument": "sfx",
            "channels": [
                "DRUMS",
                "PERCUSSION"
            ],
            "pitch_list": [
                48,
                54
            ],
            "parameters": {
                "apply_pitch": false,
                "sfx_sound": "tambourine"
            }
        },
        {
            "instrument": "sfx",
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
            "parameters": {
                "base_pitch": 80,
                "face_emote": "bark",
                "apply_pitch": true,
                "sfx_sound": "bark_cat"
            }
        }
    ],
}

func get_config():
	return default_config