# 🎸Potato🥔Midi🎤

This mod takes MIDI input and allows you to configure it to output through not only guitar but in-game sounds, _however you see fit..._
Like, singing, or playing drums with a boxing glove, and more...

It's for power users who want to experimenting and enjoy playing around with a [configuration](#configuration) file to make more noises than just guitar notes!

> [!WARNING]
> If you are not comfortable with editing
> --**[or learning how to edit](https://www.youtube.com/results?search_query=how%20to%20edit%20a%20json%20file)**--
> a `.json` config file, you should use something like [MidiStrummer](https://github.com/puppy-girl/MidiStrummer) instead.

## Project

## [Changelog](https://thunderstore.io/c/webfishing/p/toes/PotatoMidi/changelog)

### [Contributing - pull requests welcomed](https://github.com/binury/PotatoMidi/pulls)

### [Known Issues](https://github.com/binury/PotatoMidi/issues?q=sort%3Aupdated-desc+is%3Aissue+is%3Aopen)

### [Report an issue / Feedback](https://discord.gg/kjf3FCAMDb)

### [Roadmap and feature requests](https://github.com/binury/PotatoMidi/issues?q=sort%3Aupdated-desc%20is%3Aissue%20is%3Aopen%20label%3Aenhancement)

## Configuration

Any changes made to the configuration file will take effect immediately!
Issues with the configuration file will be logged to the log file and the player warned, if in-game (and so the chat window is visible).

**_If you want to reset your configuration file to default, delete the file and it'll be recreated!._**

`%AppData%\Godot\app_userdata\webfishing_2_newver\PotatoMidi.json`

### Structure

The configuration file has the following structure:

- `version`: [The PotatoMidi configuration-scheme version number](#version)
- `channel_mappings`: [A dictionary mapping your chosen instrument names to MIDI channel numbers.](#channel-mappings)
- `instruments`: [A list of your instrument configurations](#instruments)

### Version

- **Type**: `int`
- **Description**: The version of the configuration file.
- **Current version**: `1`
- **Example**:

```jsonc
"version": 1
```

### Channel mappings

These are named references, for you convenience, to map to channel numbers- you can name them _whatever you want_.

- **Type**: `Dictionary`
- **Description**: A dictionary mapping user-defined names to MIDI channel numbers.
- **Example**:

```jsonc
"channel_mappings": {
    "acoustic_grand_piano": 0,
    "bright_acoustic_piano": 1,
    "banana": 2,
    ...
}
```

### Instruments

- **Type**: `Array of Dictionaries`
- **Description**: Each dictionary defines an instrument with unique properties and specific parameters.
- **Keys**:

  - `instrument`: The name of the instrument.

    - **Type**: `String`
    - **Description**: The name of the instrument.
    - **Example**:

    ```jsonc
    "instrument": "guitar_strummer"
    ```

  - `channels`

    - **Type**: `Array of Strings`
    - **Description**: A list of MIDI channel names for the instrument.
    - **Example**:

    ```jsonc
    "channels": [
        "acoustic_grand_piano",
        "bright_acoustic_piano",
        "electric_grand_piano",
        "honky_tonk_piano",
        "rhodes_piano",
        "chords",
        "synth_pad"
    ]
    ```

  - **Pitch**

    - _One_ of the following:

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

          ```jsonc
          "pitch_range": {
              "min": 40,
              "max": 80
          }
          ```

      - `pitch`

        - **Type**: `int`
        - **Description**: The pitch of the instrument.
        - **Example**:

        ```jsonc
        "pitch": 40
        ```

      - `pitch_list`

        - **Type**: `Array of ints`
        - **Description**: An array of pitches for the instrument.
        - **Example**:

        ```jsonc
        "pitch_list": [
            40,
            45,
            50,
            55,
            59,
            64
        ]
        ```

### MIDI Percussion Conventions

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

### Instrument-specific Settings

#### guitar_strummer

- `apply_velocity`

  - **Type**: `bool`
  - **Description**: Whether to apply velocity to the strum. You **_should not ever turn this off!_**
  - **Default**: `true`
  - **Example**:

  ```jsonc
  "apply_velocity": true
  ```

#### talk_effect

- `apply_pitch`

  - **Type**: `bool`
  - **Description**: Whether to use the note's pitch to determine the spoken letter's pitch. You **_should not ever turn this off!_**
  - **Default**: `true`
  - **Example**:

  ```jsonc
  "apply_pitch": true
  ```

- `base_pitch`

  - **Type**: `int`
  - **Description**: The base pitch for the talk effect. Note that the game limits the pitch (between "`0.5` and `2.0`").
  - **Default**: The lowest note in your instrument's pitch range
  - **Example**:

  ```jsonc
  "base_pitch": 53
  ```

- `letter`

  - **Type**: `String` OR `String[]`
  - **Description**: The letter to use for the talk effect.
  - **Default**: Randomly chosen (each note) between `a`, `o`, or `e`
  - **Examples**:

  ```jsonc
  "letter": "a",
  ```

  ```jsonc
  "letter": ["a", "o", "e"],
  ```

#### sfx

- `apply_pitch`

  - **Type**: `bool`
  - **Description**: Whether to apply pitch to the SFX.
  - **Default**: `true`
  - **Example**:

  ```jsonc
  "apply_pitch": true
  ```

- `base_pitch`

  - **Type**: `int`
  - **Description**: The base pitch for the SFX.
  - **Default**: The lowest note in your instrument's pitch range
  - **Example**:

  ```jsonc
  "base_pitch": 80
  ```

- `face_emote`

  - **Type**: `String`
  - **Description**: The face emote to use for the SFX. Any of one: `angry`, `bark`, `cat`, `flat`, `happy`, `kiss`, `strum`, `surprised`, `whine`
  - **Default**: `null`
  - **Example**:

  ```jsonc
  // "angry", "bark", "cat", "flat", "happy", "kiss", "strum", "surprised", "whine"
  "face_emote": "bark"
  ```

- `sfx_sound`

  - **Type**: `String`
  - **Description**: The name of the SFX sound to play. See [below](#valid-sfx-instrument-kinds) for a list of valid SFX sounds.
  - **Default**: `bark_cat`
  - **Example**:

  ```jsonc
  // "equip", "splash", "splashb", "drown", "land", "jump", "jump_big", "dive_woosh", "dive_scrape", "reel_slow", "reel_fast", "woosh", "drink", "drink_nocap", "md_beep_veryslow", "md_beep_veryslowb", "md_beep_slow", "md_beep_slowb", "md_beep_fast", "md_beep_veryfast", "growl_cat", "growl_dog", "whine_dog", "whine_cat", "punch", "phone_call", "kiss", "rip", "cash1", "cash2", "cash3", "strum", "menu_a", "menu_b" "notification"

  "sfx_sound": "bark_cat"
  ```

### Valid SFX Instrument Kinds

Some sounds, unfortunately, have a [random pitch modifier](https://docs.godotengine.org/en/3.5/classes/class_audiostreamrandompitch.html).

| sound_name        | Hear normally in game when...                                              | Random pitch intensity |
| ----------------- | -------------------------------------------------------------------------- | ---------------------- |
| bark_cat          | meowing                                                                    | 1.25                   |
| bark_dog          | woofing                                                                    | 1.25                   |
| cash1             | Buying Something (A)                                                       | -                      |
| cash2             | Buying Something (B)                                                       | -                      |
| cash3             | Buying Something (C)                                                       | -                      |
| dive_scrape       | You land on the ground after diving                                        | -                      |
| dive_woosh        | You press the jump button twice                                            | -                      |
| drink             | Sippin A                                                                   | -                      |
| drink_nocap       | Sippin B                                                                   | -                      |
| drown             | You try to go swimming                                                     | -                      |
| equip             | Switching items                                                            | -                      |
| growl_cat         | `<CTRL + g>`                                                               | -                      |
| growl_dog         | "                                                                          | -                      |
| jump              | You jump off the ground                                                    | -                      |
| jump_big          | You jump while under the effect of performance enhancing substances (soda) | -                      |
| kiss              | 😘                                                                         | -                      |
| land              | You land on the ground                                                     | -                      |
| md_beep_fast      | "                                                                          | -                      |
| md_beep_slow      | "                                                                          | -                      |
| md_beep_slowb     | "                                                                          | -                      |
| md_beep_veryfast  | "                                                                          | -                      |
| md_beep_veryslow  | Metal detector                                                             | -                      |
| md_beep_veryslowb | "                                                                          | -                      |
| menu_a            | Changing menus                                                             | -                      |
| menu_b            | "                                                                          | -                      |
| notification      | Someone asks to join your island                                           | -                      |
| phone_call        | Ringing the fish broker                                                    | -                      |
| poof              | Spawning props                                                             | 1.4                    |
| punch             | Choosing violence                                                          | -                      |
| reel_fast         | Reely reely?                                                               | -                      |
| reel_slow         | Reely?                                                                     | -                      |
| rip               | Gambling                                                                   | -                      |
| splash            | Fish make this noise                                                       | -                      |
| splashb           | Fish make this noise                                                       | -                      |
| step              | Walking                                                                    | 1.3                    |
| step_fastrun      | Running while tweaked on sugar                                             | 1.5                    |
| step_run          | Running                                                                    | 1.3                    |
| strum             | Entering a lobby                                                           | -                      |
| tambourine        | -                                                                          | 1.02                   |
| whine_cat         | `<ALT + g>`                                                                | -                      |
| whine_dog         | "                                                                          | -                      |
| woosh             | You cast a fishing line                                                    | -                      |
| zip               | Opening your backpack                                                      | 1.4                    |

## Example configuration

```jsonc
[
  {
    "instrument": "guitar_strummer",
    "channels": [
      "acoustic_grand_piano",
      "bright_acoustic_piano",
      "electric_grand_piano",
      "honky_tonk_piano",
      "rhodes_piano",
      "chords",
      "synth_pad"
    ],
    "pitch_range": {
      "min": 40,
      "max": 80
    },
    "parameters": {
      "apply_pitch": true,
      "apply_velocity": true
      // "base_pitch": 40
    }
  },
  {
    "instrument": "talk_effect",
    "channels": ["acoustic_grand_piano"],
    "pitch_range": {
      "min": 50,
      "max": 95
    },
    "parameters": {
      "apply_pitch": true,
      "apply_velocity": true,
      // "base_pitch": 50,
      "letter": ["a", "e", "o"]
    }
  },
  {
    // Bass drum
    "instrument": "sfx",
    "channels": ["DRUMS", "PERCUSSION"],
    "pitch_list": [35, 36],
    "parameters": {
      "base_pitch": 10,
      "apply_pitch": false,
      "apply_velocity": false,
      "sfx_sound": "punch"
    }
  },
  {
    // Bass drum 2
    "instrument": "sfx",
    "channels": ["DRUMS", "PERCUSSION"],
    "pitch_list": [35, 36],
    "parameters": {
      "base_pitch": 7,
      "apply_pitch": true,
      "apply_velocity": true,
      "sfx_sound": "menu_b"
    }
  },
  {
    // Snares
    "instrument": "sfx",
    "channels": ["DRUMS", "PERCUSSION"],
    "pitch_list": [38, 40],
    "parameters": {
      "apply_pitch": true,
      "base_pitch": 40,
      "apply_velocity": true,
      "sfx_sound": "tambourine"
    }
  },
  {
    // Hi-hats closed
    "instrument": "sfx",
    "channels": ["DRUMS", "PERCUSSION"],
    "pitch_list": [44],
    "parameters": {
      "apply_pitch": true,
      "apply_velocity": true,
      "base_pitch": 60,
      // Maybe better base pitch
      "sfx_sound": "notification"
    }
  },
  {
    // Hi-hats open
    "instrument": "sfx",
    "channels": ["DRUMS", "PERCUSSION"],
    "pitch_list": [46],
    "parameters": {
      "apply_pitch": true,
      "apply_velocity": false,
      "base_pitch": 40,
      // Maybe better base pitch
      "sfx_sound": "cash3"
    }
  },
  {
    // Toms
    "instrument": "sfx",
    "channels": ["DRUMS", "PERCUSSION"],
    "pitch_list": [41, 43, 45, 47, 48, 50],
    "parameters": {
      "apply_pitch": false,
      "apply_velocity": true,
      "sfx_sound": "woosh"
    }
  },
  {
    // Toms 2
    "instrument": "sfx",
    "channels": ["DRUMS", "PERCUSSION"],
    "pitch_list": [41, 43, 45, 47, 48, 50],
    "parameters": {
      "apply_pitch": false,
      "apply_velocity": true,
      "sfx_sound": "jump"
    }
  },
  {
    // Cymbals
    "instrument": "sfx",
    "channels": ["DRUMS", "PERCUSSION"],
    "pitch_list": [49, 51, 52, 55, 57, 59],
    "parameters": {
      "apply_pitch": false,
      "apply_velocity": true,
      "sfx_sound": "dive_woosh"
    }
  },
  {
    // Etc.
    "instrument": "sfx",
    "channels": ["DRUMS", "PERCUSSION"],
    "pitch_list": [
      54, // Tambourine
      53, // Bell
      56, // Cowbell
      70 // Maracas
    ],
    "parameters": {
      "apply_pitch": false,
      "apply_velocity": false,
      "sfx_sound": "tambourine"
    }
  }
]
```
