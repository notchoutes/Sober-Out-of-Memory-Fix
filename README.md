<div align="center">

# Sober Out of Memory Fix

**A lightweight configuration for reducing memory and VRAM usage in Sober on Linux.**

<br>

[![Linux](https://img.shields.io/badge/Linux-111827?style=for-the-badge\&logo=linux\&logoColor=white)](https://www.linux.org/)
[![Bash](https://img.shields.io/badge/Bash-111827?style=for-the-badge\&logo=gnubash\&logoColor=white)](https://www.gnu.org/software/bash/)
[![License](https://img.shields.io/badge/License-MIT-111827?style=for-the-badge)](LICENSE)

<br>

[Installation](#installation) · [Features](#features) · [Configuration](#configuration) · [Troubleshooting](#troubleshooting)

</div>

---

## About

**Sober Out of Memory Fix** is a community configuration and installer for [Sober](https://sober.vinegarhq.org/) on Linux.

It provides a preconfigured `config.json` focused on reducing graphics-related memory usage, particularly for systems that experience high VRAM usage or `OutOfMemory` crashes.

> This project is **not affiliated with, endorsed by, or maintained by VinegarHQ or Roblox**.

---

## ✨ Features

* 🎮 Memory-focused graphics configuration
* 🧠 Reduced graphics memory pressure
* 🖥️ Balanced graphics optimization
* ⚙️ Ready-to-use Sober configuration
* 🚀 One-command installation
* 🔄 Easy reset to the default Sober configuration
* 🔐 No root access required
* 📦 No additional packages required

---

## 🚀 Installation

### Quick Install

Run the following command in your terminal:

```bash
curl -fsSL https://install.choutes.top/sober.sh | bash
```

The installer will:

1. Check the environment
2. Create the Sober configuration directory
3. Download the project's `config.json`
4. Replace the existing Sober configuration
5. Verify that the configuration was installed

Then simply launch Sober.

---

## 📁 Configuration

Sober stores its configuration at:

```text
~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

This project replaces that file with the configuration provided in this repository.

Sober officially documents this location as its configuration path.

### Configuration focus

| Setting               | Purpose                                         |
| --------------------- | ----------------------------------------------- |
| Graphics optimization | Balances visual quality and performance         |
| Texture settings      | Helps reduce graphics memory usage              |
| Grass distance        | Reduces rendering workload                      |
| CSG / geometry        | Reduces distant geometry detail                 |
| HiDPI                 | Keeps unnecessary high-density scaling disabled |

> FFlag availability can change over time. Sober currently uses an allowlist for supported Fast Flags, so unsupported flags may be ignored.

---

## 🔄 Reset

If you want to remove the custom configuration and return to Sober's defaults:

```bash
rm -f ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

Sober will regenerate the configuration when it starts again.

---

## 🛠️ Troubleshooting

### Sober still crashes

This configuration is intended to reduce memory pressure, but it cannot guarantee that every Roblox experience will run without memory-related crashes.

If you continue experiencing `OutOfMemory` issues, check the official Sober troubleshooting documentation for additional graphics and rendering options.

### Sober does not start after changing the configuration

Reset the configuration:

```bash
rm -f ~/.var/app/org.vinegarhq.Sober/config/sober/config.json
```

Then launch Sober again.

Sober's documentation specifically recommends deleting the configuration to regenerate its default values if the configuration causes problems.

---

## 📦 Repository

```text
sober-out-of-memory/
├── config.json
├── sober.sh
├── README.md
└── LICENSE
```

| File          | Description           |
| ------------- | --------------------- |
| `config.json` | Sober configuration   |
| `sober.sh`    | Automatic installer   |
| `README.md`   | Project documentation |
| `LICENSE`     | MIT License           |

---

## 🔗 Links

* **Sober** — https://sober.vinegarhq.org/
* **VinegarHQ** — https://vinegarhq.org/
* **Project Repository** — https://github.com/notchoutes/sober-out-of-memory
* **Installer** — https://install.choutes.top/sober.sh
* **Choutes Studios** — https://choutes.top

---

## 📄 License

This project is licensed under the **MIT License**.

See [`LICENSE`](LICENSE) for the full license text.

The MIT license applies to the original work contained in this repository. **Sober itself is not licensed by this repository and remains under its own licensing and ownership.**

---

<div align="center">

**Sober Out of Memory Fix**

Created by **Choutes Studios**

[Website](https://choutes.top) · [GitHub](https://github.com/notchoutes/sober-out-of-memory)

</div>
