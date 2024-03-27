#!/usr/bin/env bash
#  Copyright (c) 2024 Greg Rynkowski. All rights reserved.
#  License: MIT License

# Path Initialization
if [ -n "${SHELL_GR_DIR}" ]; then
  _SHELL_GR_DIR="${SHELL_GR_DIR}"
else
  _SCRIPT_PATH_1="${BASH_SOURCE[0]:-$0}"
  _SCRIPT_PATH="$([[ ! "${_SCRIPT_PATH_1}" =~ /bash$ ]] && readlink -f "${_SCRIPT_PATH_1}" || exit 1)"
  _SCRIPT_DIR="$(cd "$(dirname "${_SCRIPT_PATH}")" && pwd -P || exit 1)"
  _ROOT_DIR="$(cd "${_SCRIPT_DIR}/.." && pwd -P || exit 1)"
  _SHELL_GR_DIR="${_ROOT_DIR}"
fi
# Library Sourcing
source "${_SHELL_GR_DIR}/lib/color.bash" # NC, RED, YELLOW, is_color
source "${_SHELL_GR_DIR}/lib/debug.bash" # is_debug

# shellcheck disable=SC2059
log_error_f() {
  if is_color; then
    printf "${RED}${1}${NC}" "${@:2}"
  else
    printf "$@"
  fi
}

log_error() {
  log_error_f "%s\n" "$@"
}

# shellcheck disable=SC2059
log_warning_f() {
  if is_color; then
    printf "${YELLOW}${1}${NC}" "${@:2}"
  else
    printf "$@"
  fi
}

log_warning() {
  log_warning_f "%s\n" "$@"
}

log_info_f() {
  # shellcheck disable=SC2059
  printf "$@"
}

log_info() {
  log_info_f "%s\n" "$@"
}

log_debug_f() {
  if is_debug; then
    # shellcheck disable=SC2059
    printf "$@"
  fi
}

log_debug() {
  log_debug_f "%s\n" "$@"
}
