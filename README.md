<div align="center">

# Yoko-DebugMenu

**An in-game debugging toolkit for Brotato mod development, testing, and rapid iteration.**

<p>
  <a href="https://github.com/CYoJkoY/Yoko-DebugMenu/releases"><img src="https://img.shields.io/github/v/release/CYoJkoY/Yoko-DebugMenu?display_name=tag&sort=semver&style=flat-square&label=release" alt="Latest release"></a>
  <a href="https://github.com/CYoJkoY/Yoko-DebugMenu/actions/workflows/release.yml"><img src="https://img.shields.io/github/actions/workflow/status/CYoJkoY/Yoko-DebugMenu/release.yml?style=flat-square&label=build" alt="Build status"></a>
  <img src="https://img.shields.io/badge/Brotato-1.15.4-478CBF?style=flat-square" alt="Brotato 1.15.4">
  <img src="https://img.shields.io/badge/Mod%20Loader-6.3.0-5965FF?style=flat-square" alt="Mod Loader 6.3.0">
  <a href="LICENSE"><img src="https://img.shields.io/github/license/CYoJkoY/Yoko-DebugMenu?style=flat-square" alt="MIT License"></a>
</p>

<p><a href="#what-it-is">Overview</a> · <a href="#tools">Tools</a> · <a href="#usage">Usage</a> · <a href="#architecture">Architecture</a> · <a href="#installation">Installation</a></p>

</div>

## What it is

Yoko-DebugMenu adds a dedicated debug interface to Brotato without modifying the base game files. It is built for the moment when normal gameplay becomes a bottleneck: change player state, equipment, enemies, waves, or progression from one panel and continue testing immediately.

The mod extends Brotato's existing debug service rather than creating a parallel gameplay loop.

## Tools

| Area | Capabilities |
| :--- | :--- |
| Player | Give/remove items, weapons, and upgrades; add materials; randomize equipment; toggle invulnerability and invisibility; remove starting weapons |
| Combat | One-shot enemies and slow motion for targeted testing |
| Progression | Unlock or relock progression entries for repeatable test runs |
| Enemies & waves | Browse registered enemy entities and test vanilla or compatible modded encounters |
| Input | Open with `T` or the configured player-1 trigger combination |

Text-entry controls are respected, so the keyboard shortcut does not interfere with `LineEdit` or `TextEdit` input.

## Usage

1. Launch Brotato with Mod Loader enabled.
2. Enter a scene where the debug service is available.
3. Press `T`, or use the supported player-1 trigger combination.
4. Use the debug tabs to manipulate the state you need to test.
5. Close the panel when the test is complete.

The menu is intended to shorten the feedback loop between a code/content change and an observable in-game result.

## Architecture

The integration is deliberately narrow:

```text
Brotato debug service
        │
        ▼
extensions/debug_service.gd
        │
        ▼
   Yoko-DebugMenu
        │
        ├── Player tools
        ├── Enemy tools
        └── Wave / progression tools
```

`mod_main.gd` installs the extension for `res://singletons/debug_service.gd`. The debug UI remains ordinary Godot content under `content/`, while `extensions/` handles the integration boundary.

```text
content/
└── scenes/
    ├── debug_menu.gd
    └── debug_menu.tscn

extensions/
└── debug_service.gd
```

## Installation

Download the latest `DebugMenu-*.zip` from [Releases](https://github.com/CYoJkoY/Yoko-DebugMenu/releases) and place the ZIP in Brotato's Mod Loader `mods` directory.

Keep the release ZIP compressed for normal installation.

Development layout:

```text
mods-unpacked/
└── Yoko-DebugMenu/
    ├── content/
    ├── extensions/
    ├── manifest.json
    └── mod_main.gd
```

See the [Godot Mod Loader documentation](https://wiki.godotmodding.com/) for current installation conventions.

## Compatibility

| Component | Declared target |
| :--- | :--- |
| Game | **Brotato 1.15.4** |
| Engine | Godot 3.x / GDScript |
| Mod Loader | **6.3.0** |
| Mod version | **1.1.0** |
| Dependencies | None |
| License | MIT |

`manifest.json` is the source of truth for declared compatibility.

## Development

Keep UI behavior in `content/` and game-system integration in `extensions/`. New debug actions should target the narrowest game service that owns the relevant state so the testing layer remains isolated.

### Release pipeline

Releases are built from semantic version tags and require the tag to match `manifest.json` exactly:

```text
manifest.json: 1.1.0
        │
        ├── tag v1.1.0  → build allowed
        └── tag v1.2.0  → build rejected
```

The workflow imports Godot resources, creates the Mod Loader package, preserves generated `.import` data, validates ZIP contents, and checks the packaged manifest before publishing.

## Project structure

```text
Yoko-DebugMenu/
├── .github/workflows/release.yml
├── content/
│   └── scenes/
├── extensions/
│   └── debug_service.gd
├── manifest.json
├── mod_main.gd
├── README.md
└── LICENSE
```

## Contributing

Useful contributions add test controls that shorten the feedback loop, fix concrete debugging defects, improve compatibility, or keep the UI and integration boundary clear.

For bug reports, include Brotato, Mod Loader, and Yoko-DebugMenu versions, the debug action involved, reproduction steps, and relevant logs.

## Support

If this toolkit saves you time while developing or testing Brotato mods, development support is available through the deployed payment page:

**https://cyojkoy.github.io/Payment/**

## License

This project is licensed under the [MIT License](LICENSE).

<div align="center">
  <sub>Yoko-DebugMenu · Brotato debugging tools by CYoJkoY</sub>
</div>
