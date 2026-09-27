<div align="center">

# Sober Out of Memory Fix

**A community configuration for reducing memory and VRAM usage in Sober on Linux.**

<br>

[![Linux](https://img.shields.io/badge/Linux-111827?style=for-the-badge\&logo=linux\&logoColor=white)](https://www.linux.org/)
[![Bash](https://img.shields.io/badge/Bash-111827?style=for-the-badge\&logo=gnubash\&logoColor=white)](https://www.gnu.org/software/bash/)
[![Sober](https://img.shields.io/badge/Sober-VinegarHQ-7C3AED?style=for-the-badge)](https://sober.vinegarhq.org/)
[![License](https://img.shields.io/badge/License-MIT-111827?style=for-the-badge)](LICENSE)

<br>

[Installation](#installation) · [Features](#features) · [Tested Hardware](#tested-hardware) · [Configuration](#configuration) · [Troubleshooting](#troubleshooting) · [Repository](#repository)

</div>

---

## About

**Sober Out of Memory Fix** is a community configuration and installer for [Sober](https://sober.vinegarhq.org/) on Linux.

The project provides a preconfigured `config.json` focused on reducing graphics-related memory usage and lowering rendering workload on systems that experience high memory usage or `OutOfMemory` crashes.

The configuration is distributed together with an automated installer, allowing the configuration to be installed without manually editing Sober's configuration file.

> **This project is not affiliated with, endorsed by, or maintained by VinegarHQ or Roblox.**

---

## Installation

The easiest way to install the configuration is through the official installer.

### Recommended Installer

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

### Installer Fallback

If the official installer at `install.choutes.top/sober.sh` is unavailable or does not work, the same installer is available directly from the GitHub repository.

**[View `sober.sh` on GitHub](https://github.com/notchoutes/Sober-Out-of-Memory-Fix/blob/main/sober.sh)**

You can run the GitHub version directly:

```bash
curl -fsSL https://raw.githubusercontent.com/notchoutes/Sober-Out-of-Memory-Fix/main/sober.sh | bash
```

This uses the `sober.sh` installer from the `main` branch.

### Requirements

* Linux
* Sober installed
* `curl`
* An active internet connection

**Root access is not required.**

---

## Features

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

## Tested Hardware

The configuration has been tested on a low-end system using integrated Intel graphics.

| Component     | Test System                   |
| ------------- | ----------------------------- |
| CPU           | Intel Core i5, 4th Generation |
| RAM           | 8 GB DDR3                     |
| Dedicated GPU | None                          |
| Graphics      | Intel integrated graphics     |

### Before Installation

With Sober's **default configuration**, Roblox frequently crashed on this system.

Observed behavior during testing:

* Crash after approximately **5 minutes** of gameplay
* In some sessions, crash after approximately **1 minute**
* Repeated instability during gameplay

### After Installation

After installing the **Sober Out of Memory Fix** configuration, the same system was tested again.

**No crashes were encountered during the testing session.**

This is a real-world test result from the system listed above.

> **Important:** This result is based on one specific test system and does not guarantee that the configuration will eliminate crashes on every computer, GPU, or Roblox experience.

---

## Configuration

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
| HiDPI                 | Controls high-density display scaling     |
| GameMode              | Enables GameMode integration              |
| OpenGL                | Uses the configured OpenGL rendering path |

The configuration also includes selected Fast Flags intended to control graphics-related behavior.

Sober maintains an allowlist for supported Fast Flags, so unsupported flags may not be applied.

### Configuration Location

```text
~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

This is the configuration location documented by Sober.

---

## Why This Configuration Exists

Roblox experiences can place significant pressure on system memory and graphics memory.

This can be particularly noticeable on older integrated graphics systems where the GPU uses shared system RAM instead of dedicated VRAM.

The configuration focuses on reducing unnecessary graphics workload rather than simply lowering every setting to the minimum.

The goal is to provide a balanced configuration that can reduce memory pressure while keeping the game reasonably playable.

Sober's own troubleshooting documentation specifically discusses texture-quality overrides in relation to `OutOfMemory` crashes.

---

## What Gets Installed

The installer downloads the configuration directly from this repository:

```text
https://raw.githubusercontent.com/notchoutes/Sober-Out-of-Memory-Fix/main/config.json
```

The downloaded file replaces:

```text
~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

The installer uses a temporary file during the download and only replaces the existing configuration after the download succeeds.

The installer:

* Does not require root access
* Does not install additional system packages
* Only modifies Sober's user configuration
* Downloads the configuration over HTTPS

---

## Reset to Default

If you want to return to Sober's default configuration, remove the configuration file:

```bash
rm -f ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

Then launch Sober again.

Sober will recreate the configuration with its default values. This reset method is documented by Sober.

---

## Troubleshooting

### Sober Still Crashes

This configuration is designed to reduce memory and graphics workload, but it cannot guarantee that every Roblox experience will run without crashes.

If crashes continue:

1. Make sure Sober is updated.
2. Reset the configuration.
3. Launch Sober again.
4. Check whether the issue occurs only in a specific Roblox experience.

Sober's official troubleshooting documentation should also be consulted for other causes of crashes and memory-related problems.

### Sober Does Not Start

Reset the configuration:

```bash
rm -f ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

Then launch Sober again.

Sober should regenerate its configuration automatically.

### Reinstall the Custom Configuration

Run the official installer:

```bash
curl -fsSL https://install.choutes.top/sober.sh | bash
```

If the official installer is unavailable, use the GitHub fallback:

```bash
curl -fsSL https://raw.githubusercontent.com/notchoutes/Sober-Out-of-Memory-Fix/main/sober.sh | bash
```

---

## Repository

```text
Sober-Out-of-Memory-Fix/
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

## Safety

The installer:

* Does not require root privileges
* Only targets Sober's configuration directory
* Downloads the configuration over HTTPS
* Uses a temporary file during installation
* Does not install additional system packages
* Does not modify system-wide configuration

The existing Sober configuration is replaced by the project's configuration only after the download succeeds.

> **Always review software before running remote installation commands.**

---

## Development

Sober Out of Memory Fix is an independent community project developed by **Choutes Studios**.

The project contains an independently maintained configuration and installer for Sober.

It does **not** modify or redistribute the Sober application itself.

Sober remains a project of **VinegarHQ**.

> **This project is not affiliated with, endorsed by, or maintained by VinegarHQ or Roblox.**

---

## License

This project's original work is released under the **MIT License**.

The license applies to the original work contained in this repository, including:

* `config.json`
* `sober.sh`
* Documentation
* Other original project files

Sober itself is **not** licensed by this repository and remains under its own licensing, copyright, and ownership.

See [`LICENSE`](LICENSE) for the complete license text.

---

## Links

* **Sober:** https://sober.vinegarhq.org/
* **VinegarHQ:** https://vinegarhq.org/
* **Project Repository:** https://github.com/notchoutes/Sober-Out-of-Memory-Fix
* **Installer:** https://install.choutes.top/sober.sh
* **GitHub Installer:** https://github.com/notchoutes/Sober-Out-of-Memory-Fix/blob/main/sober.sh
* **Choutes Studios:** https://choutes.top

---

<div align="center">

### Sober Out of Memory Fix

A community configuration for Sober on Linux.

**Developed by Choutes Studios**

<br>

[GitHub](https://github.com/notchoutes/Sober-Out-of-Memory-Fix) · [Website](https://choutes.top)

</div>
