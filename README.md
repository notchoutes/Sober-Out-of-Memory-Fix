<div align="center">

# Sober Out of Memory Fix

**A community configuration for reducing memory and VRAM usage in Sober on Linux.**

<br>

[![Linux](https://img.shields.io/badge/Linux-111827?style=for-the-badge\&logo=linux\&logoColor=white)](https://www.linux.org/)
[![Bash](https://img.shields.io/badge/Bash-111827?style=for-the-badge\&logo=gnubash\&logoColor=white)](https://www.gnu.org/software/bash/)
[![Sober](https://img.shields.io/badge/Sober-VinegarHQ-7C3AED?style=for-the-badge)](https://sober.vinegarhq.org/)
[![License](https://img.shields.io/badge/License-MIT-111827?style=for-the-badge)](LICENSE)

<br>

[Installation](#installation) · [Features](#features) · [Tested Hardware](#tested-hardware) · [Configuration](#configuration) · [Troubleshooting](#troubleshooting)

</div>

---

## About

**Sober Out of Memory Fix** is a community configuration and installer for [Sober](https://sober.vinegarhq.org/) on Linux.

The project provides a preconfigured `config.json` focused on reducing graphics-related memory usage and lowering rendering workload on systems that experience high memory usage or `OutOfMemory` crashes.

The configuration is distributed together with an automated installer, allowing the configuration to be installed without manually editing Sober's configuration file.

> This project is **not affiliated with, endorsed by, or maintained by VinegarHQ or Roblox**.

---

## 🚀 Installation

The easiest way to install the configuration is through the official installer.

Run:

```bash
curl -fsSL https://install.choutes.top/sober.sh | bash
```

The installer will:

1. Check the environment
2. Detect the Sober configuration directory
3. Create the required configuration directory if necessary
4. Download the project's `config.json`
5. Replace the existing Sober configuration
6. Verify the installation

After installation, launch Sober normally.

### Requirements

* Linux
* Sober installed
* `curl`
* An active internet connection

**Root access is not required.**

---

## 🧪 Tested Hardware

The configuration has been tested on a low-end system with integrated graphics:

| Component     | Test System                   |
| ------------- | ----------------------------- |
| CPU           | Intel Core i5, 4th Generation |
| RAM           | 8 GB DDR3                     |
| Dedicated GPU | None                          |
| Graphics      | Intel integrated graphics     |

### Before

With Sober's **default configuration**, Roblox frequently crashed on this system.

Observed behavior during testing:

* Crash after approximately **5 minutes** of gameplay
* In some sessions, crash after approximately **1 minute**
* Repeated instability during gameplay

### After

After installing the **Sober Out of Memory Fix** configuration, the same system was tested again.

**Result: no crashes were encountered during the testing session.**

The configuration successfully resolved the crash problem on the tested Intel 4th-generation i5 system with 8 GB DDR3 RAM and integrated graphics.

> **Important:** This is a real-world test result from one specific system. It does not guarantee that the configuration will eliminate crashes on every computer, GPU, or Roblox experience.

Sober's official troubleshooting documentation also discusses `OutOfMemory` issues involving Intel Haswell and earlier integrated GPUs, making this hardware test particularly relevant.

---

## ✨ Features

* Memory-focused Sober configuration
* Reduced graphics memory pressure
* Reduced rendering workload
* Balanced graphics optimization
* Texture quality control
* Reduced distant geometry detail
* Reduced grass rendering distance
* GameMode support
* Ready-to-use configuration
* Automated installation
* Automatic configuration replacement
* No root access required
* Easy configuration reset

---

## ⚙️ Configuration

Sober stores its configuration at:

```text
~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

This project provides a custom configuration designed around memory usage and graphics workload.

### Main Configuration

| Setting               | Purpose                                   |
| --------------------- | ----------------------------------------- |
| Graphics optimization | Balances performance and visual quality   |
| Texture quality       | Controls texture memory usage             |
| Grass distance        | Reduces grass rendering workload          |
| CSG distance          | Reduces distant geometry workload         |
| HiDPI                 | Prevents unnecessary high-density scaling |
| GameMode              | Enables GameMode integration              |
| OpenGL                | Uses the configured OpenGL rendering path |

The configuration also includes selected Fast Flags intended to control graphics-related behavior.

Sober uses an allowlist for Fast Flags, meaning unsupported flags may be ignored rather than applied.

---

## 🧠 Why This Configuration Exists

Roblox experiences can place significant pressure on system memory and graphics memory.

This can be particularly noticeable on older integrated graphics systems where the GPU uses shared system RAM instead of having dedicated VRAM.

The configuration focuses on reducing unnecessary graphics workload rather than simply lowering everything to the minimum.

The goal is to provide a more balanced configuration that can reduce memory pressure while keeping the game reasonably playable.

---

## 📦 What Gets Installed

The installer downloads the configuration directly from this repository:

```text
https://raw.githubusercontent.com/notchoutes/sober-out-of-memory/main/config.json
```

The downloaded file replaces:

```text
~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

The installer uses a temporary file during the download and only replaces the existing configuration after the download succeeds.

---

## 🔄 Reset to Default

If you want to return to Sober's default configuration, remove the configuration file:

```bash
rm -f ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

Sober will recreate the configuration when it starts again.

This is also the recommended recovery method if the custom configuration causes Sober to behave unexpectedly.

---

## 🛠️ Troubleshooting

### Sober still crashes

This configuration is designed to reduce memory and graphics workload, but it cannot guarantee that every Roblox experience will run without crashes.

If crashes continue:

1. Make sure Sober is updated.
2. Reset the configuration.
3. Launch Sober again.
4. Check whether the issue occurs only in a specific Roblox experience.

### Sober does not start

Reset the configuration:

```bash
rm -f ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

Then launch Sober again.

Sober will regenerate its configuration automatically.

### Want to restore the custom configuration?

Simply run the installer again:

```bash
curl -fsSL https://install.choutes.top/sober.sh | bash
```

---

## 📁 Repository

```text
sober-out-of-memory/
├── config.json
├── sober.sh
├── README.md
└── LICENSE
```

| File          | Description                |
| ------------- | -------------------------- |
| `config.json` | Custom Sober configuration |
| `sober.sh`    | Automated installer        |
| `README.md`   | Project documentation      |
| `LICENSE`     | Project license            |

---

## 🔐 Safety

The installer:

* Does not require root privileges
* Only targets Sober's configur
