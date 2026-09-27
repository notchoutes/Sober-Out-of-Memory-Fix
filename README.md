<div align="center">

# Sober Out of Memory Fix

### A lightweight configuration for reducing memory pressure in Sober on Linux.

[![Platform](https://img.shields.io/badge/Platform-Linux-111827?style=for-the-badge\&logo=linux\&logoColor=white)](https://www.linux.org/)
[![Sober](https://img.shields.io/badge/Sober-VinegarHQ-111827?style=for-the-badge)](https://sober.vinegarhq.org/)
[![Shell](https://img.shields.io/badge/Installer-Bash-111827?style=for-the-badge\&logo=gnubash\&logoColor=white)](https://www.gnu.org/software/bash/)

<br>

**Reduce memory pressure. Keep playing.**

[Quick Install](#-quick-install) · [How It Works](#-how-it-works) · [Configuration](#-configuration) · [Troubleshooting](#-troubleshooting)

</div>

---

## ✨ Overview

**Sober Out of Memory Fix** is a community-made configuration for [Sober](https://sober.vinegarhq.org/) that focuses on reducing graphics-related memory usage.

It is designed for Linux users who experience issues such as:

* `OutOfMemory` crashes
* High VRAM usage
* Instability during longer sessions
* Problems in graphics-heavy Roblox experiences

The project provides a ready-to-use configuration together with a simple installer.

> **This project is independent from Sober, VinegarHQ, and Roblox.**

---

## 🚀 Quick Install

Open a terminal and run:

```bash
curl -fsSL https://install.choutes.top/sober.sh | bash
```

That's it.

The installer automatically:

1. Checks the environment
2. Creates the required configuration directory
3. Downloads the configuration
4. Validates the JSON
5. Installs the configuration
6. Verifies the result

No system-wide files are modified.

---

## 🧩 How It Works

Sober stores its configuration at:

```text
~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

This project provides a preconfigured version of that file with graphics-related settings intended to reduce memory usage.

Sober's documentation confirms this as its configuration location and notes that deleting the file allows Sober to regenerate its defaults.

### Configuration focus

| Area            | Purpose                           |
| --------------- | --------------------------------- |
| Texture quality | Reduce texture memory usage       |
| Grass distance  | Reduce rendering workload         |
| CSG / geometry  | Reduce distant geometry detail    |
| Graphics mode   | Balance quality and performance   |
| HiDPI           | Keep unnecessary scaling disabled |

---

## 📦 What's Included

```text
sober-out-of-memory/
│
├── config.json     # Sober configuration
├── sober.sh        # Automatic installer
├── README.md       # Documentation
└── LICENSE
```

The installer itself does not require `sudo` and does not modify system configuration.

---

## ⚙️ Configuration

The default configuration uses:

```json
"graphics_optimization_mode": "balanced"
```

Sober provides `quality`, `balanced`, and `performance` graphics optimization modes, with `balanced` being its default mode.

The configuration also contains selected graphics-related FFlags.

Sober currently restricts which FFlags are accepted through an allowlist, so unsupported flags may simply be ignored.

---

## 🔄 Reset

If you want to return to Sober's default configuration:

```bash
rm -f ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

Start Sober again and it will recreate the configuration.

---

## 🛠️ Troubleshooting

### Sober still crashes with `OutOfMemory`

This configuration cannot guarantee that every game will run without memory-related crashes.

Sober's own troubleshooting documentation identifies texture usage as one cause of `OutOfMemory` errors and recommends lowering the texture quality override when necessary.

### Sober does not start

Try resetting the configuration:

```bash
rm -f ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

Then launch Sober again.

If you need to investigate further, Sober stores logs in:

```text
~/.var/app/org.vinegarhq.Sober/data/sober/sober_logs/
```

---

## 🔐 Safety & Transparency

The installer:

* Uses HTTPS
* Downloads only the project configuration
* Validates the downloaded JSON when Python 3 is available
* Uses a temporary file before replacing the configuration
* Does not require root access
* Does not install additional software

You can inspect the installer and configuration directly in the repository before running them.

---

## 🔗 Links

| Resource                | Link                                                                                           |
| ----------------------- | ---------------------------------------------------------------------------------------------- |
| Sober                   | [sober.vinegarhq.org](https://sober.vinegarhq.org/)                                            |
| VinegarHQ Documentation | [vinegarhq.org](https://vinegarhq.org/)                                                        |
| Project Repository      | [github.com/notchoutes/sober-out-of-memory](https://github.com/notchoutes/sober-out-of-memory) |
| Installer               | [install.choutes.top/sober.sh](https://install.choutes.top/sober.sh)                           |
| Choutes Studios         | [choutes.top](https://choutes.top)                                                             |

---

<div align="center">

### Sober Out of Memory Fix

A small configuration project for Sober on Linux.

<br>

**Created by Choutes Studios**

[Website](https://choutes.top) · [GitHub](https://github.com/notchoutes/sober-out-of-memory)

</div>
