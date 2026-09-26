# Sober Out of Memory Fix

A `config.json` for [Sober](https://vinegarhq.org/) (the Roblox client for Linux) tweaked to prevent/reduce **crashes caused by running out of memory** while playing.

Sober's default settings can push RAM/VRAM usage high over long play sessions, especially on mid-range or lower-spec machines. This config tweaks several `fflags` and graphics settings so the game runs more stably and doesn't crash from running out of memory.

## What's changed

- `graphics_optimization_mode`: `balanced`
- `enable_hidpi`: `false`
- Several `fflags` to reduce texture/grass/CSG level-of-detail load (`DFIntTextureQualityOverride`, `FIntFRMMaxGrassDistance`, and others)
- `discord_rpc`, `gamemode`, and other settings left at sensible defaults for desktop use

See the full details in [`config.json`](./config.json).

## Usage

### Automatic (script)

```bash
curl -fsSL https://raw.githubusercontent.com/notchoutes/sober-out-of-memory/main/reset-sober-config.sh | bash
```

Or download the script first, then run it:

```bash
chmod +x reset-sober-config.sh
./reset-sober-config.sh
```

The script will:
1. Remove the existing `config.json` at `~/.var/app/org.vinegarhq.Sober/config/sober/config.json`
2. Download the new `config.json` from this repo straight into that location

### Manual

```bash
rm -f ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
curl -fsSL https://raw.githubusercontent.com/notchoutes/sober-out-of-memory/main/config.json \
  -o ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

Then just launch Sober as usual — the new config will be applied automatically.

## Warning

- Don't hand-edit `config.json` unless you understand each flag — malformed JSON can stop Sober from launching entirely.
- If you run into issues after using this config, you can just delete `config.json` and Sober will regenerate the default on next launch.
- This repo's settings are specifically aimed at **out-of-memory crashes**, not maximizing FPS.

## Reference

- [Sober Configuration Docs](https://vinegarhq.org/Sober/Configuration/index.html)
