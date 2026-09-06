# Yoko-DebugMenu

[![Release](https://img.shields.io/github/v/release/CYoJkoY/Yoko-DebugMenu?display_name=tag&sort=semver)](https://github.com/CYoJkoY/Yoko-DebugMenu/releases)
[![License](https://img.shields.io/github/license/CYoJkoY/Yoko-DebugMenu)](LICENSE)
[![Release Workflow](https://github.com/CYoJkoY/Yoko-DebugMenu/actions/workflows/release.yml/badge.svg)](https://github.com/CYoJkoY/Yoko-DebugMenu/actions/workflows/release.yml)

> A runtime debug panel for Brotato mod development and testing.

Yoko-DebugMenu extends Brotato's built-in debug service with an in-game debug interface. It provides quick access to player-state manipulation, inventory and equipment changes, enemy spawning/selection, wave testing, and progression-related controls without modifying the base game files.

## Features

### Player testing

- Give or remove items.
- Give or remove weapons.
- Give or remove upgrades.
- Add materials directly.
- Randomize equipment.
- Toggle invulnerability.
- Toggle invisibility.
- Enable one-shot enemies.
- Toggle slow motion.
- Remove starting weapons.

### Progression controls

- Unlock all progression entries.
- Lock progression entries again for repeatable testing.
- Inspect and manipulate player-related debug state from one panel.

### Enemy and wave testing

- Browse enemy entities registered by the game and installed content mods.
- Test encounters involving vanilla and compatible modded enemies.
- Keep debug controls grouped into player, enemy, and wave tabs.

### Controller support

The debug menu can be opened with the keyboard `T` key or with the configured simultaneous left/right trigger input on player 1. Text-entry controls are ignored so the shortcut does not interfere with `LineEdit` or `TextEdit` input.

## Installation

Download the latest `DebugMenu-*.zip` from [Releases](https://github.com/CYoJkoY/Yoko-DebugMenu/releases) and place the ZIP in the game's `mods` directory used by Godot Mod Loader. The mod ZIP is intended to be loaded as a ZIP; do not unpack it for normal use.

For development, the unpacked project should use the standard Mod Loader layout:

```text
mods-unpacked/
└── Yoko-DebugMenu/
    ├── content/
    ├── extensions/
    ├── manifest.json
    └── mod_main.gd
```

See the [Godot Mod Loader documentation](https://github.com/GodotModding/godot-mod-loader/wiki) for the loader's current installation and mod-directory conventions.

## Usage

1. Launch Brotato with Mod Loader enabled.
2. Enter a game or another scene where the debug service is available.
3. Press `T`, or use the supported trigger combination on player 1.
4. Use the tabs to switch between player, enemy, and wave tools.
5. Close the panel to return focus to the control that was active before the menu opened.

## How it works

The mod does not replace the game's debug service wholesale. Its entry point installs a script extension for `res://singletons/debug_service.gd`, and the extension creates the custom debug panel on demand. The custom panel inherits from the game's debug menu and adds the mod-specific item handling and focus behavior.

The project also keeps the debug UI as a normal Godot scene, making the interface itself easy to inspect and modify:

```text
content/
└── scenes/
    ├── debug_menu.gd
    └── debug_menu.tscn

extensions/
└── debug_service.gd
```

## Compatibility

| Component | Target |
| :--- | :--- |
| Engine | Godot 3.x / GDScript |
| Mod Loader | 6.1.0 (manifest target) |
| Version | 1.0.0 |

The repository's current manifest contains a placeholder game-version value, so compatibility with a specific Brotato game build should be verified against the game/mod-loader version you are using.

## Development

The repository is a Godot Mod Loader project. The main entry point is `mod_main.gd`; runtime behavior is implemented through script extensions under `extensions/`, while the UI lives under `content/`.

Release builds are generated automatically from semantic version tags such as:

```text
v1.0.0
v1.1.0
v2.0.0
```

## License

This project is licensed under the [MIT License](LICENSE).

## 💰 Support the Author

If this project saves you time or improves your workflow, consider supporting its development.

<div align="center">
  <a href="https://cyojkoy.github.io/Payment/">
    <img src="https://img.shields.io/badge/Support_the_Author-9E8F7E?style=for-the-badge&logo=buy-me-a-coffee&logoColor=BEB8AE" alt="Support the Author">
  </a>
</div>

---

<div align="center">
  <sub>Yoko-DebugMenu · Brotato modding utility by CYoJkoY</sub>
</div>
