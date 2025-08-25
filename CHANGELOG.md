# Changelog

## [v1.0.1](https://github.com/binury/PotatoMidi/releases/tag/v1.0.1) - Fixes

- Fixed crash when configuration file was totally invalid (#2)
- Fixed initial default configuration generation not loading until game restart (#3)
- Made it more obvious that you can click on the chat message to open your config file
- Made successful configuration reload more distinguished from error notifications (green vs red)

## [v1.0.0](https://github.com/binury/PotatoMidi/releases/tag/v1.0.0)

- Documentation overhaul - [check it out](https://github.com/binury/PotatoMidi/blob/master/README.md)
- The default configuration has been supercharged and now includes _most_ drum channel pitch assignments (by convention) - [check out the new documentation regarding that](https://github.com/binury/PotatoMidi/blob/master/README.md#midi-percussion-conventions)
- Major changes:
  - base_patch no longer defaults to a static value
    - This will always default to the lowest value in your instrument's pitch range
  - Omitting an instrument's pitch range will now default it to "all pitches"
    - A warning will be emitted in case this was unintentional
  - Your instrument names are **no longer case-sensitive**!
  - `talk_effect` can now receive a list of letters `["a", "b", ..., "z"]` to choose from randomly when 'playing' a note!
  - `talk_effect` now defaults to randomly choosing between "a", "o", and "i"

## 0.0.6

- You can now put comments in your `PotatoMidi.json` config without breaking the parser

## 0.0.4

- Swapped out BBApi for Socks
- Players will now be notified if an error occurs when loading their config.json file
