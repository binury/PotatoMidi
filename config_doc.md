# PotatoMidi Configuration

Any changes made to the configuration file will take effect immediately.
Any issues with the configuration file will be logged to the console.

Logs are written to:

`%AppData%\Godot\app_userdata\webfishing_2_newver\logs\godot.log`

## File location

`%AppData%\Godot\app_userdata\webfishing_2_newver\PotatoMidi.json`

## Structure
The configuration file has the following structure:
- `version`: The version of the configuration file.
- `channel_mappings`: A dictionary mapping logical instrument names to MIDI channel numbers.
- `instruments`: A list of dictionaries, each representing an instrument with specific properties and parameters.

## Version
- *Type*: `int`
- *Description*: The version of the configuration file.
- *Current version*: `1`
- *Example*: 
```json
"version": 1
```

## Channel mappings
- *Type*: `Dictionary`
- *Description*: A dictionary mapping logical instrument names to MIDI channel numbers.
- *Example*: 
```json
"channel_mappings": {
    "ACOUSTIC_GRAND_PIANO": 0,
    "BRIGHT_ACOUSTIC_PIANO": 1,
    ...
}
```

## Instruments
- *Type*: `Array of Dictionaries`
- *Description*: Each dictionary defines an instrument with unique properties and specific parameters.
- *Keys*: 
    - `instrument`: The name of the instrument.
        - *Type*: `String`
        - *Description*: The name of the instrument.
        - *Example*: 
        ```json
        "instrument": "guitar_strummer"
        ```
    - `channels`
        - *Type*: `Array of Strings`
        - *Description*: A list of MIDI channel names for the instrument.
        - *Example*: 
        ```json
        "channels": [
            "ACOUSTIC_GRAND_PIANO",
            "BRIGHT_ACOUSTIC_PIANO",
            "ELECTRIC_GRAND_PIANO",
            "HONKY_TONK_PIANO",
            "RHODES_PIANO",
            "CHORDS",
            "SYNTH_PAD"
        ]
        ```
    - **Pitch Requirement**
        - One of the following:
            - `pitch_range`
                - *Type*: `Dictionary`
                - *Description*: A dictionary with the minimum and maximum pitches for the instrument.
                - *Keys*: 
                    - `min`: The minimum pitch for the instrument.
                        - *Type*: `int`
                        - *Description*: The minimum pitch for the instrument.
                        - *Example*: `40`
                    - `max`: The maximum pitch for the instrument.
                        - *Type*: `int`
                        - *Description*: The maximum pitch for the instrument.
                        - *Example*: `80`
                    - *Example*: 
                    ```json
                    "pitch_range": {
                        "min": 40,
                        "max": 80
                    }
            - `pitch`
                - *Type*: `int`
                - *Description*: The pitch of the instrument.
                - *Example*: 
                ```json
                "pitch": 40
                ```
            - `pitch_list`
                - *Type*: `Array of ints`
                - *Description*: An array of pitches for the instrument.
                - *Example*: 
                ```json
                "pitch_list": [
                    40,
                    45,
                    50,
                    55,
                    59,
                    64
                ]
                ```
## Instrument specific parameters
- *Type*: `Dictionary`
- *Description*: A dictionary of parameters specific to the instrument.

1. **guitar_strummer**
    - `apply_velocity`
        - *Type*: `bool`
        - *Description*: Whether to apply velocity to the strum.
        - *Default*: `true`
        - *Example*: 
        ```json
        "apply_velocity": true
        ```
2. **talk_effect**
    - `apply_pitch`
        - *Type*: `bool`
        - *Description*: Whether to apply pitch to the talk effect.
        - *Default*: `true`
        - *Example*: 
        ```json
        "apply_pitch": true
        ```
    - `base_pitch`
        - *Type*: `int`
        - *Description*: The base pitch for the talk effect. (The talk effect has been clamped between 0.5-2.0)
        - *Default*: `53`
        - *Example*: 
        ```json
        "base_pitch": 53
        ```
    - `letter`
        - *Type*: `String`
        - *Description*: The letter to use for the talk effect.
        - *Default*: `a`
        - *Example*: 
        ```json
        "letter": "a"
        ```
3. **SFX**
    - `apply_pitch`
        - *Type*: `bool`
        - *Description*: Whether to apply pitch to the SFX.
        - *Default*: `true`
        - *Example*: 
        ```json
        "apply_pitch": true
        ```
    - `base_pitch`
        - *Type*: `int`
        - *Description*: The base pitch for the SFX.
        - *Default*: `80`
        - *Example*: 
        ```json
        "base_pitch": 80
        ```
    - `face_emote`
        - *Type*: `String`
        - *Description*: The face emote to use for the SFX.
        - *Default*: `null`
        - *Example*: 
        ```json
        "face_emote": "bark"
        ```
    - `sfx_sound`
        - *Type*: `String`
        - *Description*: The name of the SFX sound to play.
        - *Default*: `bark_cat`
        - *Example*: 
        ```json
        "sfx_sound": "bark_cat"
        ```
- *Example instrument configuration*: 
```json
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
        "apply_velocity": true
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
    }
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
```
