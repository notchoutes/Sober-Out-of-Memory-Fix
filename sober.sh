#!/usr/bin/env bash
#
# Sober Out of Memory Fix
# Official Installer
#
# Usage:
#   curl -fsSL https://install.choutes.top/sober.sh | bash
#
# Repository:
#   https://github.com/notchoutes/Sober-Out-of-Memory-Fix
#

set -Eeuo pipefail

# =============================================================================
# Configuration
# =============================================================================

readonly APP_NAME="Sober Out of Memory Fix"
readonly APP_VERSION="1.0.0"

readonly SOBER_DIR="${HOME}/.var/app/org.vinegarhq.Sober"
readonly CONFIG_DIR="${SOBER_DIR}/config/sober"
readonly CONFIG_FILE="${CONFIG_DIR}/config.json"

readonly CONFIG_URL="https://raw.githubusercontent.com/notchoutes/Sober-Out-of-Memory-Fix/main/config.json"

readonly TEMP_FILE="${CONFIG_FILE}.tmp.$$"

# =============================================================================
# Terminal Colors
# =============================================================================

if [[ -t 1 ]]; then
    readonly RESET='\033[0m'
    readonly BOLD='\033[1m'
    readonly DIM='\033[2m'

    readonly RED='\033[31m'
    readonly GREEN='\033[32m'
    readonly YELLOW='\033[33m'
    readonly CYAN='\033[36m'
    readonly WHITE='\033[37m'
else
    readonly RESET=''
    readonly BOLD=''
    readonly DIM=''

    readonly RED=''
    readonly GREEN=''
    readonly YELLOW=''
    readonly CYAN=''
    readonly WHITE=''
fi

# =============================================================================
# Output Helpers
# =============================================================================

info() {
    printf "  ${CYAN}●${RESET} %s\n" "$1"
}

success() {
    printf "  ${GREEN}✔${RESET} %s\n" "$1"
}

warning() {
    printf "  ${YELLOW}⚠${RESET} %s\n" "$1" >&2
}

error() {
    printf "  ${RED}✖${RESET} %s\n" "$1" >&2
}

section() {
    printf "\n${BOLD}${WHITE}%s${RESET}\n" "$1"
}

# =============================================================================
# Cleanup
# =============================================================================

cleanup() {
    if [[ -f "${TEMP_FILE}" ]]; then
        rm -f "${TEMP_FILE}"
    fi
}

trap cleanup EXIT

# =============================================================================
# Error Handler
# =============================================================================

handle_error() {
    local exit_code=$?

    cleanup

    printf "\n"
    error "Installation failed."
    printf "  ${DIM}Your existing Sober configuration was not overwritten.${RESET}\n"
    printf "\n"

    exit "${exit_code}"
}

trap handle_error ERR

# =============================================================================
# Banner
# =============================================================================

show_banner() {
    printf "\n"

    printf "  ${BOLD}${CYAN}SOBER${RESET} ${BOLD}${WHITE}Out of Memory Fix${RESET}\n"
    printf "  ${DIM}Memory & VRAM stability configuration${RESET}\n"
    printf "  ${DIM}Installer v${APP_VERSION}${RESET}\n"

    printf "\n"
}

# =============================================================================
# Requirements
# =============================================================================

check_requirements() {
    section "Checking requirements"

    # Operating system
    if [[ "$(uname -s)" != "Linux" ]]; then
        error "This installer is designed for Linux systems."
        exit 1
    fi

    success "Linux detected"

    # Home directory
    if [[ -z "${HOME:-}" || ! -d "${HOME}" ]]; then
        error "Unable to determine the current user's home directory."
        exit 1
    fi

    success "Home directory detected"

    # curl
    if ! command -v curl >/dev/null 2>&1; then
        error "curl is required but was not found."
        printf "\n"
        printf "  Install curl using your distribution's package manager.\n"
        printf "\n"
        exit 1
    fi

    success "curl detected"
}

# =============================================================================
# Sober Detection
# =============================================================================

check_sober() {
    section "Checking Sober"

    if [[ -d "${SOBER_DIR}" ]]; then
        success "Sober data directory detected"
    else
        warning "Sober data directory was not found."
        printf "  ${DIM}The configuration directory will be created automatically.${RESET}\n"
    fi
}

# =============================================================================
# Configuration Directory
# =============================================================================

prepare_directory() {
    section "Preparing configuration directory"

    if ! mkdir -p "${CONFIG_DIR}"; then
        error "Unable to create the Sober configuration directory."
        exit 1
    fi

    success "Configuration directory ready"

    printf "  ${DIM}%s${RESET}\n" "${CONFIG_DIR}"
}

# =============================================================================
# Download Configuration
# =============================================================================

download_config() {
    section "Downloading configuration"

    info "Source:"
    printf "    ${DIM}%s${RESET}\n" "${CONFIG_URL}"

    if ! curl \
        --fail \
        --silent \
        --show-error \
        --location \
        --proto '=https' \
        --tlsv1.2 \
        --retry 3 \
        --connect-timeout 10 \
        --max-time 60 \
        --output "${TEMP_FILE}" \
        "${CONFIG_URL}"; then

        error "Unable to download the Sober configuration."
        exit 1
    fi

    if [[ ! -s "${TEMP_FILE}" ]]; then
        error "Downloaded configuration is empty."
        exit 1
    fi

    success "Configuration downloaded"
}

# =============================================================================
# Install Configuration
# =============================================================================

install_config() {
    section "Installing configuration"

    # Replace the existing Sober configuration with the downloaded file.
    if ! mv -f "${TEMP_FILE}" "${CONFIG_FILE}"; then
        error "Unable to install the Sober configuration."
        exit 1
    fi

    success "Sober configuration installed"
}

# =============================================================================
# Verify Installation
# =============================================================================

verify_installation() {
    section "Verifying installation"

    if [[ ! -f "${CONFIG_FILE}" ]]; then
        error "Configuration file was not created."
        exit 1
    fi

    if [[ ! -s "${CONFIG_FILE}" ]]; then
        error "Configuration file is empty."
        exit 1
    fi

    success "Configuration file installed"

    printf "  ${DIM}%s${RESET}\n" "${CONFIG_FILE}"
}

# =============================================================================
# Completion
# =============================================================================

show_success() {
    printf "\n"

    printf "  ${GREEN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}\n"

    printf "\n"

    printf "  ${GREEN}${BOLD}Installation complete!${RESET}\n"

    printf "\n"

    printf "  ${DIM}Sober Out of Memory Fix has been installed successfully.${RESET}\n"

    printf "\n"

    printf "  ${BOLD}Configuration:${RESET}\n"
    printf "  ${DIM}%s${RESET}\n" "${CONFIG_FILE}"

    printf "\n"

    printf "  ${BOLD}Next step:${RESET}\n"
    printf "  Launch Sober normally to apply the new configuration.\n"

    printf "\n"

    printf "  ${DIM}Project:${RESET}\n"
    printf "  ${DIM}https://github.com/notchoutes/Sober-Out-of-Memory-Fix${RESET}"

    printf "\n"

    printf "  ${DIM}Installer:${RESET}\n"
    printf "  ${DIM}https://install.choutes.top/sober.sh${RESET}"

    printf "\n"

    printf "  ${GREEN}${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}\n"

    printf "\n"
}

# =============================================================================
# Main
# =============================================================================

main() {
    show_banner
    check_requirements
    check_sober
    prepare_directory
    download_config
    install_config
    verify_installation
    show_success
}

main "$@"
