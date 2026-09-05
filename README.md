# BallenFux

BallenFux is a lightweight script mod for Farming Simulator 25 that disables
the consumption of bale net wrap, twine, and wrapping film.

The mod was created for players who want balers and wrappers to keep working
without repeatedly buying and loading consumable pallets. It works globally
instead of modifying individual vehicle XML files.

## Features

- Disables net-wrap consumption in round balers
- Disables twine consumption in square balers
- Disables film consumption in bale wrappers and inline wrappers
- Allows supported machines to continue working when their consumable stock is empty
- Keeps ordinary fill levels such as diesel, seed, fertilizer, and silage additive unchanged
- Supports single-player and multiplayer
- Works with AI helpers and is designed to remain available to Courseplay and AutoDrive

The Vermeer ZR5 has been tested successfully. Modded machines are supported when
they use the standard GIANTS `Baler`, `BaleWrapper`, `InlineWrapper`, and
`Consumable` specializations.

## Installation

1. Download `FS25_BallenFux.zip` from the latest GitHub release.
2. Do not extract the ZIP archive.
3. Copy it to:
   `Documents/My Games/FarmingSimulator2025/mods`
4. Enable **BallenFux - No Bale Consumables** when loading the savegame.

There is no key binding or in-game setting. Enabling the mod disables bale
consumable usage; disabling the mod restores the normal game behavior.

You can still load net wrap, twine, or film once if you want to select a
particular variation or color. The selected material will no longer be consumed.

## Deutsche Kurzbeschreibung

BallenFux schaltet den Verbrauch von Netz, Garn und Wickelfolie bei unterstützten
Ballenpressen und Wicklern aus. Auch leere Maschinen können weiterarbeiten.
Diesel, Saatgut, Dünger, Siliermittel und andere Füllstände bleiben unverändert.

Die fertige `FS25_BallenFux.zip` wird nicht entpackt, sondern direkt nach
`Dokumente/My Games/FarmingSimulator2025/mods` kopiert und anschließend beim
Laden des Spielstands aktiviert.

## Compatibility

- Farming Simulator 25
- PC and Mac only, because script mods are not supported on consoles
- Multiplayer supported

## Development

The repository root is also the mod root: `modDesc.xml` must remain directly at
the top level. GitHub Actions validates the XML and Lua files and builds the
installable ZIP after every push and pull request.

Creating a tag such as `v1.0.0.0` builds the ZIP and publishes a GitHub release.

## License

Released under the [MIT License](LICENSE).
