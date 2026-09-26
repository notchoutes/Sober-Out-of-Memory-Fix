#!/usr/bin/env bash
#
# reset-sober-config.sh
#
# Resets the Sober (Roblox client for Linux) configuration to the
# out-of-memory-fix config.json provided by this repository.
#
# Repository: https://github.com/notchoutes/sober-out-of-memory
#
# Usage:
#   ./reset-sober-config.sh
#

set -euo pipefail

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
readonly CONFIG_DIR="${HOME}/.var/app/org.vinegarhq.Sober/config/sober"
readonly CONFIG_FILE="${CONFIG_DIR}/config.json"
readonly RAW_URL="https://raw.githubusercontent.com/notchoutes/sober-out-of-memory/main/config.json"
readonly BACKUP_FILE="${CONFIG_FILE}.bak"

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
log_info()  { printf '[INFO]  %s\n' "$1"; }
log_warn()  { printf '[WARN]  %s\n' "$1" >&2; }
log_error() { printf '[ERROR] %s\n' "$1" >&2; }

fail() {
    log_error "$1"
    exit 1
}

check_dependencies() {
    if command -v curl >/dev/null 2>&1; then
        DOWNLOAD_CMD="curl"
    elif command -v wget >/dev/null 2>&1; then
        DOWNLOAD_CMD="wget"
    else
        fail "Neither 'curl' nor 'wget' is installed. Please install one and try again."
    fi
}

download_file() {
    local url="$1"
    local dest="$2"

    case "${DOWNLOAD_CMD}" in
        curl)
            curl --fail --silent --show-error --location "${url}" --output "${dest}"
            ;;
        wget)
            wget --quiet "${url}" --output-document="${dest}"
            ;;
    esac
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
main() {
    log_info "Checking dependencies..."
    check_dependencies

    log_info "Ensuring config directory exists at: ${CONFIG_DIR}"
    mkdir -p "${CONFIG_DIR}"

    if [[ -f "${CONFIG_FILE}" ]]; then
        log_info "Backing up existing config to: ${BACKUP_FILE}"
        mv "${CONFIG_FILE}" "${BACKUP_FILE}"
    else
        log_info "No existing config.json found, nothing to back up."
    fi

    log_info "Downloading updated config.json..."
    if download_file "${RAW_URL}" "${CONFIG_FILE}"; then
        log_info "Successfully installed new config.json."
    else
        log_error "Download failed. Restoring previous configuration."
        if [[ -f "${BACKUP_FILE}" ]]; then
            mv "${BACKUP_FILE}" "${CONFIG_FILE}"
        fi
        fail "Could not download config.json from ${RAW_URL}"
    fi

    log_info "Done. Config installed at: ${CONFIG_FILE}"
    log_info "A backup of your previous config (if any) is at: ${BACKUP_FILE}"
    log_info "Launch Sober to apply the new settings."
}

main "$@"
