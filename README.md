# Sober Out of Memory Fix

> A lightweight Sober configuration focused on reducing memory and VRAM pressure during longer Roblox sessions on Linux.

[![Sober](https://img.shields.io/badge/Sober-Linux-blue?style=flat-square)](https://vinegarhq.org/)
[![Platform](https://img.shields.io/badge/Platform-Linux-informational?style=flat-square)](https://vinegarhq.org/)
[![License](https://img.shields.io/badge/License-MIT-green?style=flat-square)](LICENSE)

---

## Overview

**Sober Out of Memory Fix** is a preconfigured `config.json` for [Sober](https://vinegarhq.org/), the Linux Roblox client developed by VinegarHQ.

The configuration is designed to **reduce graphics-related memory and VRAM usage** by lowering selected texture, grass, geometry, and rendering quality settings.

It is intended primarily for systems that experience:

* Out-of-memory crashes
* VRAM-related crashes
* Increasing memory usage during long play sessions
* Instability when running graphics-heavy Roblox experiences
* Excessive texture or level-of-detail usage

> **This configuration prioritizes stability over maximum visual quality.**

It does not guarantee that every Roblox experience will run without crashes, since memory usage can vary significantly between experiences, GPUs, drivers, and Sober versions.

---

## ✨ What This Configuration Changes

### Graphics

| Setting                       | Value      | Purpose                                                    |
| ----------------------------- | ---------- | ---------------------------------------------------------- |
| `graphics_optimization_mode`  | `balanced` | Maintains a balance between performance and visual quality |
| `enable_hidpi`                | `false`    | Avoids unnecessary HiDPI scaling overhead                  |
| `DFIntTextureQualityOverride` | Configured | Reduces texture memory requirements                        |
| `FIntFRMMaxGrassDistance`     | Configured | Limits the maximum grass rendering distance                |
| CSG / geometry FFlags         | Configured | Reduces distant geometry detail where applicable           |

Additional configuration values are kept close to sensible desktop defaults rather than aggressively disabling unrelated Sober functionality.

### Desktop Features

The configuration keeps common desktop features available, including:

* Discord integration settings
* GameMode support
* Standard desktop UI behavior
* Normal controller support
* Default rendering behavior unless explicitly changed by the configuration

---

## 📦 Installation

### Automatic Installation

The easiest method is to run the included installation script:

```bash
curl -fsSL https://raw.githubusercontent.com/notchoutes/sober-out-of-memory/main/reset-sober-config.sh | bash
```

The script will:

1. Remove the existing Sober configuration.
2. Download the optimized `config.json`.
3. Place it in Sober's configuration directory.

The configuration will be used automatically the next time Sober starts.

---

### Manual Installation

If you prefer to install the configuration yourself:

```bash
rm -f ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

Then download the configuration:

```bash
curl -fsSL https://raw.githubusercontent.com/notchoutes/sober-out-of-memory/main/config.json \
  -o ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

Launch Sober normally after the download completes.

---

## 🔄 Reset to Default

If you experience problems after applying the configuration, simply remove the custom configuration:

```bash
rm -f ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

Sober will regenerate its default configuration the next time it starts.

This is also the recommended recovery method if Sober fails to launch because of a malformed configuration file.

---

## ⚠️ Important Notes

### This Is Not an FPS Optimization Config

This project is specifically focused on **reducing memory and VRAM pressure**.

It is **not** designed to maximize FPS or graphical quality.

Depending on your hardware and the Roblox experience being played, you may notice:

* Lower texture quality
* Reduced grass distance
* Reduced distant geometry detail
* Less graphical fidelity

That is intentional.

---

### FFlags Are Not Guaranteed

Sober's FFlag system is subject to changes by Roblox and Sober.

Since September 2025, Roblox Fast Flags have been restricted through a whitelist system. FFlags that are not permitted may simply be ignored even when they are correctly configured.

Because of this, the exact behavior of this configuration may change as Sober and Roblox are updated.

---

### Do Not Edit the JSON Unless You Know What You Are Doing

Sober's official documentation warns that incorrectly formatted JSON can prevent Sober from launching.

If you manually modify the configuration, make sure the JSON remains valid.

When in doubt, reset the configuration using:

```bash
rm -f ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

Sober will recreate it automatically.

---

## 🧠 Why Lower Texture Quality Helps

Graphics-heavy Roblox experiences can place significant pressure on available VRAM.

Sober's own troubleshooting documentation recommends lowering the texture quality override when dealing with certain out-of-memory crashes. The official troubleshooting guide specifically documents `DFIntTextureQualityOverride` together with `DFFlagTextureQualityOverrideEnabled` as a workaround, while noting that this does not guarantee every experience will be playable.

This project builds on that general approach by combining texture, grass, geometry, and graphics-related settings into a single reusable configuration.

---

## 🖥️ Configuration Location

Sober stores its configuration at:

```text
~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

You can also access Sober's configuration interface through:

```bash
flatpak run org.vinegarhq.Sober config
```

Sober's official documentation recommends using its settings interface when possible.

---

## 🛠️ Troubleshooting

### Sober Does Not Start

Reset the configuration:

```bash
rm -f ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

Then launch Sober again.

---

### Roblox Still Crashes

This configuration cannot eliminate every possible cause of an out-of-memory crash.

Possible factors include:

* GPU VRAM capacity
* System RAM
* Graphics driver behavior
* Mesa version
* The Roblox experience itself
* Sober version
* Current Roblox engine changes

If the problem continues, try reducing the Roblox graphics quality further.

---

### Graphics Look Too Low Quality

This configuration intentionally trades some visual fidelity for lower memory usage.

If your system has sufficient VRAM and you are no longer experiencing crashes, you can remove the custom configuration and return to Sober's defaults:

```bash
rm -f ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

---

## 📁 Repository Structure

```text
.
├── config.json
├── reset-sober-config.sh
├── README.md
└── LICENSE
```

### `config.json`

The optimized Sober configuration.

### `reset-sober-config.sh`

A small helper script that removes the existing configuration and downloads the latest version from this repository.

---

## 🔐 Safety & Transparency

This project does **not** modify Sober itself.

It only replaces the user's Sober configuration file with the configuration provided in this repository.

No additional software is installed by the configuration.

The installation command downloads files directly from this repository's `main` branch, so review the script and configuration yourself if you prefer to verify changes before executing them.

---

## 📚 References

* [Sober](https://vinegarhq.org/)
* [Sober Configuration Documentation](https://vinegarhq.org/Sober/Configuration/index.html)
* [Sober Tips & Tricks](https://vinegarhq.org/Sober/Configuration/TipsAndTricks.html)
* [Sober Troubleshooting](https://vinegarhq.org/Sober/Troubleshooting.html)

---

## ⭐ Contributing

Found a configuration issue, compatibility problem, or improvement?

Feel free to open an issue or submit a pull request.

When reporting a problem, please include:

* Sober version
* Linux distribution
* GPU model
* GPU driver / Mesa version
* Amount of system RAM
* Roblox experience where the issue occurred
* Relevant Sober logs

This makes it much easier to reproduce and investigate the problem.

---

## 📄 License

This project is provided under the **MIT License**.

See [`LICENSE`](./LICENSE) for the full license text.

---

<p align="center">
  Made for a smoother and more stable Sober experience on Linux.
</p>
