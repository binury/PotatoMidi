# 🎸Potato Midi🎤

This mod takes MIDI input and allows you to configure it to output through not only guitar but in-game sounds, however you see fit.

It's for power users who want to play around with a [configuration](#configuration) file to play more than just guitar.

If you are not a power user, you should consider using [MidiStrummer](https://github.com/puppy-girl/MidiStrummer) instead.

## Usage

- Connect your MIDI input device before starting WebFishing
- Launch WebFishing with GDWeave
- Begin (external) MIDI playback (e.g., MidiPlay, MIDI instrument)
- MIDI events will output into your game client!

## Configuration

Any changes made to the configuration file will take effect immediately. <br>
Any issues with the configuration file will be logged to the console/log file.

**If you want to reset the configuration file, delete the file and it'll be regenerated.**

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

- **Type**: `int`
- **Description**: The version of the configuration file.
- **Current version**: `1`
- **Example**:

```json
"version": 1
```

## Channel mappings

- **Type**: `Dictionary`
- **Description**: A dictionary mapping logical instrument names to MIDI channel numbers.
- **Example**:

```json
"channel_mappings": {
    "ACOUSTIC_GRAND_PIANO": 0,
    "BRIGHT_ACOUSTIC_PIANO": 1,
    ...
}
```

## Instruments

- **Type**: `Array of Dictionaries`
- **Description**: Each dictionary defines an instrument with unique properties and specific parameters.
- **Keys**:
  - `instrument`: The name of the instrument.
    - **Type**: `String`
    - **Description**: The name of the instrument.
    - **Example**:
    ```json
    "instrument": "guitar_strummer"
    ```
  - `channels`
    - **Type**: `Array of Strings`
    - **Description**: A list of MIDI channel names for the instrument.
    - **Example**:
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
        - **Type**: `Dictionary`
        - **Description**: A dictionary with the minimum and maximum pitches for the instrument.
        - **Keys**:
          - `min`: The minimum pitch for the instrument.
            - **Type**: `int`
            - **Description**: The minimum pitch for the instrument.
            - **Example**: `40`
          - `max`: The maximum pitch for the instrument.
            - **Type**: `int`
            - **Description**: The maximum pitch for the instrument.
            - **Example**: `80`
          - **Example**:
          ```json
          "pitch_range": {
              "min": 40,
              "max": 80
          }
          ```
      - `pitch`
        - **Type**: `int`
        - **Description**: The pitch of the instrument.
        - **Example**:
        ```json
        "pitch": 40
        ```
      - `pitch_list`
        - **Type**: `Array of ints`
        - **Description**: An array of pitches for the instrument.
        - **Example**:
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

## MIDI Percussion Conventions

> For MIDI Channel 10, each MIDI KEY number ("NOTE#") corresponds to a
> different drum sound, as shown below. While many current instruments
> also have additional sounds above or below the range show here, and
> may even have additional "kits" with variations of these sounds, only
> these sounds are supported by General MIDI Level 1 devices.

| Key# | Note | Drum               |
| ---- | ---- | ------------------ |
| 36   | C1   | Bass Drum 1        |
| 35   | B0   | Acoustic Bass Drum |
| 37   | C#   | 1 Side Stick       |
| 38   | D1   | Acoustic Snare     |
| 39   | Eb1  | Hand Clap          |
| 40   | E1   | Electric Snare     |
| 41   | F1   | Low Floor Tom      |
| 42   | F#   | 1 Closed Hi Hat    |
| 43   | G1   | High Floor Tom     |
| 44   | Ab1  | Pedal Hi-Hat       |
| 45   | A1   | Low Tom            |
| 46   | Bb1  | Open Hi-Hat        |
| 47   | B1   | Low-Mid Tom        |
| 48   | C2   | Hi Mid Tom         |
| 49   | C#   | 2 Crash Cymbal 1   |
| 50   | D2   | High Tom           |
| 51   | Eb2  | Ride Cymbal 1      |
| 52   | E2   | Chinese Cymbal     |
| 53   | F2   | Ride Bell          |
| 54   | F#   | 2 Tambourine       |
| 55   | G2   | Splash Cymbal      |
| 56   | Ab2  | Cowbell            |
| 57   | A2   | Crash Cymbal 2     |
| 58   | Bb2  | Vibraslap          |
| 59   | B2   | Ride Cymbal 2      |
| 60   | C3   | Hi Bongo           |
| 61   | C#   | 3 Low Bongo        |
| 62   | D3   | Mute Hi Conga      |
| 63   | Eb3  | Open Hi Conga      |
| 64   | E3   | Low Conga          |
| 65   | F3   | High Timbale       |
| 66   | F#   | 3 Low Timbale      |
| 67   | G3   | High Agogo         |
| 68   | Ab3  | Low Agogo          |
| 69   | A3   | Cabasa             |
| 70   | Bb3  | Maracas            |
| 71   | B3   | Short Whistle      |
| 72   | C4   | Long Whistle       |
| 73   | C#   | 4 Short Guiro      |
| 74   | D4   | Long Guiro         |
| 75   | Eb4  | Claves             |
| 76   | E4   | Hi Wood Block      |
| 77   | F4   | Low Wood Block     |
| 78   | F#   | 4 Mute Cuica       |
| 79   | G4   | Open Cuica         |
| 80   | Ab4  | Mute Triangle      |
| 81   | A4   | Open Triangle      |

## Instrument specific parameters

- **Type**: `Dictionary`
- **Description**: A dictionary of parameters specific to the instrument.

1. **guitar_strummer**
   - **Guitar can only do 40-80 pitch**
   - `apply_velocity`
     - **Type**: `bool`
     - **Description**: Whether to apply velocity to the strum.
     - **Default**: `true`
     - **Example**:
     ```json
     "apply_velocity": true
     ```
2. **talk_effect**
   - `apply_pitch`
     - **Type**: `bool`
     - **Description**: Whether to apply pitch to the talk effect.
     - **Default**: `true`
     - **Example**:
     ```json
     "apply_pitch": true
     ```
   - `base_pitch`
     - **Type**: `int`
     - **Description**: The base pitch for the talk effect. (The talk effect has been clamped between 0.5-2.0)
     - **Default**: The lowest note in your instrument's pitch range
     - **Example**:
     ```json
     "base_pitch": 53
     ```
   - `letter`
     - **Type**: `String`
     - **Description**: The letter to use for the talk effect.
     - **Default**: Randomly chosen (each note) between `a`, `o`, or `e`
     - **Example**:
     ```json
     "letter": "a"
     ```
3. **SFX**
   - `apply_pitch`
     - **Type**: `bool`
     - **Description**: Whether to apply pitch to the SFX.
     - **Default**: `true`
     - **Example**:
     ```json
     "apply_pitch": true
     ```
   - `base_pitch`
     - **Type**: `int`
     - **Description**: The base pitch for the SFX.
     - **Default**: `80`
     - **Example**:
     ```json
     "base_pitch": 80
     ```
   - `face_emote`
     - **Type**: `String`
     - **Description**: The face emote to use for the SFX.
     - **Default**: `null`
     - **Example**:
     ```json
     "face_emote": "bark"
     ```
   - `sfx_sound`
     - **Type**: `String`
     - **Description**: The name of the SFX sound to play. See [Valid SFX Sounds](https://github.com/ThePotato97/FishingPotatoMidi/blob/master/SFX%20Sounds.md) for a list of valid SFX sounds.
     - **Default**: `bark_cat`
     - **Example**:
     ```json
     "sfx_sound": "bark_cat"
     ```

- **Example instrument configuration**:

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
