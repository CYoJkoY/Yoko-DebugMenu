<div align="center">
  <h1>Yoko-DebugMenu</h1>
  <p><strong>An in-game debugging toolkit for Brotato development, testing, and rapid iteration.</strong></p>
  <p>Player state · Equipment · Enemies · Waves · Progression · Input</p>

  <p>
    <a href="https://github.com/CYoJkoY/Yoko-DebugMenu/releases"><img src="https://img.shields.io/github/v/release/CYoJkoY/Yoko-DebugMenu?display_name=tag&sort=semver&style=flat-square&label=release" alt="Latest release"></a>
    <a href="https://github.com/CYoJkoY/Yoko-DebugMenu/actions/workflows/release.yml"><img src="https://img.shields.io/github/actions/workflow/status/CYoJkoY/Yoko-DebugMenu/release.yml?style=flat-square&label=build" alt="Build status"></a>
    <img src="https://img.shields.io/badge/Brotato-1.15.4-478CBF?style=flat-square" alt="Brotato 1.15.4">
    <img src="https://img.shields.io/badge/Mod%20Loader-6.3.0-5965FF?style=flat-square" alt="Mod Loader 6.3.0">
    <a href="LICENSE"><img src="https://img.shields.io/github/license/CYoJkoY/Yoko-DebugMenu?style=flat-square" alt="MIT License"></a>
  </p>

  <p><a href="#what-it-is">Overview</a> · <a href="#tools">Tools</a> · <a href="#usage">Usage</a> · <a href="#architecture">Architecture</a> · <a href="#installation">Install</a></p>
</div>

> **Purpose:** shorten the loop from code or content change to observable in-game behavior without modifying Brotato's base files.

## What it is

Yoko-DebugMenu adds a dedicated debug interface to Brotato. It is intended for mod development and testing: change player state, equipment, enemies, waves, or progression from one panel and continue the test immediately.

The mod extends Brotato's existing debug service rather than creating a parallel gameplay loop.

## Tools

| Area | Capabilities |
| :--- | :--- |
| Player | Give / remove items, weapons, and upgrades; add materials; randomize equipment; toggle invulnerability and invisibility; remove starting weapons |
| Combat | One-shot enemies and enable slow motion for targeted tests |
| Progression | Unlock or relock progression entries for repeatable runs |
| Enemies & waves | Browse registered enemy entities and exercise vanilla or compatible modded encounters |
| Input | Open with `T` or the supported player-1 trigger combination |

Text-entry controls are respected, so the keyboard shortcut does not interfere with `LineEdit` or `TextEdit` input.

## Usage

1. Launch Brotato with Mod Loader enabled.
2. Enter a scene where the debug service is available.
3. Press `T`, or use the supported player-1 trigger combination.
4. Use the tabs to manipulate the state under test.
5. Close the panel and continue the run.

The menu is deliberately intervention-oriented: it exists to remove repetitive setup work from debugging rather than to become another gameplay system.

## Architecture

The integration boundary is small:

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

`mod_main.gd` installs the extension for `res://singletons/debug_service.gd`. UI content remains under `content/`; `extensions/` contains the game-system integration.

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

See the [Godot Mod Loader documentation](https://wiki.godotmodding.com/) for current conventions.

## Compatibility

| Component | Version |
| :--- | :--- |
| Brotato | **1.15.4** |
| Godot | 3.x / GDScript |
| Mod Loader | **6.3.0** |
| DebugMenu | **1.1.0** |
| Dependencies | None |
| License | MIT |

`manifest.json` is the source of truth for the declared compatibility.

## Development

Keep debug UI behavior under `content/` and game-system integration under `extensions/`. New tools should target the narrowest Brotato service that owns the relevant state so the debugging layer remains isolated.

### Release validation

Release tags must match the manifest version exactly:

```text
manifest.json: 1.1.0
        │
        ├── v1.1.0     → build allowed
        └── v1.2.0     → build rejected
```

The workflow imports Godot resources, preserves generated `.import` data, packages the Mod Loader ZIP, validates archive contents, and checks the packaged manifest.

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

Useful changes add test controls that reduce setup time, fix concrete debugging defects, improve compatibility, or keep the UI and integration boundaries clear.

For bug reports, include Brotato, Mod Loader, and Yoko-DebugMenu versions, the debug action involved, reproduction steps, and relevant logs.

## Support

Development support is available through the deployed payment page:

**https://cyojkoy.github.io/Payment/**

## License

This project is licensed under the [MIT License](LICENSE).

<div align="center">
  <sub>Yoko-DebugMenu · Brotato debugging tools by CYoJkoY</sub>
</div>
