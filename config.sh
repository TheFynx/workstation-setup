#!/usr/bin/env bash
# This file:
#
#  - Sets up a OS I prefer to my liking
#
# Usage:
#
#  ./config.sh -?
#
# Based on a template by BASH3 Boilerplate v2.3.0
# http://bash3boilerplate.sh/#authors
#
# The MIT License (MIT)
# Copyright (c) 2013 Kevin van Zonneveld and contributors
# You are not obligated to bundle the LICENSE file with your b3bp projects as long
# as you leave these references intact in the header comments of your source files.

# Exit on error. Append "|| true" if you expect an error.
set -o errexit
# Exit on error inside any functions or subshells.
# set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

# Define the environment variables (and their defaults) that this script depends on
export LOG_LEVEL="${LOG_LEVEL:-6}" # 7 = debug -> 0 = emergency
export NO_COLOR="${NO_COLOR:-}"    # true = disable color. otherwise autodetected
export RESET="\\x1b[0m"
export RED="\\x1b[1;5;33m"

##############################################################################
# Functions
##############################################################################

function _workstation_log() {
  local log_level="${1}"
  shift

  # shellcheck disable=SC2034
  local color_debug="\\x1b[35m"
  # shellcheck disable=SC2034
  local color_info="\\x1b[32m"
  # shellcheck disable=SC2034
  local color_notice="\\x1b[34m"
  # shellcheck disable=SC2034
  local color_warning="\\x1b[33m"
  # shellcheck disable=SC2034
  local color_error="\\x1b[31m"
  # shellcheck disable=SC2034
  local color_critical="\\x1b[1;31m"
  # shellcheck disable=SC2034
  local color_alert="\\x1b[1;33;41m"
  # shellcheck disable=SC2034
  local color_emergency="\\x1b[1;4;5;33;41m"

  local colorvar="color_${log_level}"

  local color="${!colorvar:-${color_error}}"
  local color_reset="\\x1b[0m"

  if [[ "${NO_COLOR:-}" == "true" ]] || ([[ "${TERM:-}" != "xterm"* ]] && [[ "${TERM:-}" != "screen"* ]]) || [[ ! -t 2 ]]; then
    if [[ "${NO_COLOR:-}" != "false" ]]; then
      # Don't use colors on pipes or non-recognized terminals
      color=""
      color_reset=""
    fi
  fi

  # all remaining arguments are to be printed
  local log_line=""

  while IFS=$'\n' read -r log_line; do
    echo -e "$(date -u +"%Y-%m-%d %H:%M:%S UTC") ${color}$(printf "[%9s]" "${log_level}")${color_reset} ${log_line}" 1>&2
  done <<<"${@:-}"
}

function emergency() {
  _workstation_log emergency "${@}"
  exit 1
}
function alert() {
  [[ "${LOG_LEVEL:-0}" -ge 1 ]] && _workstation_log alert "${@}"
  true
}
function critical() {
  [[ "${LOG_LEVEL:-0}" -ge 2 ]] && _workstation_log critical "${@}"
  true
}
function error() {
  [[ "${LOG_LEVEL:-0}" -ge 3 ]] && _workstation_log error "${@}"
  true
}
function warning() {
  [[ "${LOG_LEVEL:-0}" -ge 4 ]] && _workstation_log warning "${@}"
  true
}
function notice() {
  [[ "${LOG_LEVEL:-0}" -ge 5 ]] && _workstation_log notice "${@}"
  true
}
function info() {
  [[ "${LOG_LEVEL:-0}" -ge 6 ]] && _workstation_log info "${@}"
  true
}
function debug() {
  [[ "${LOG_LEVEL:-0}" -ge 7 ]] && _workstation_log debug "${@}"
  true
}
function query() { echo -e "$(date -u +"%Y-%m-%d %H:%M:%S UTC") ${RED}$(printf "[%9s]" query)${RESET} ${1} "; }

export -f emergency
export -f alert
export -f critical
export -f error
export -f warning
export -f notice
export -f info
export -f debug
export -f query
export -f _workstation_log

: ${RUN_CONFIG:='no'}
: ${NO_PACKAGES:='no'}
: ${NO_SYSTEM:='no'}
: ${USER:='levi'}
: ${GROUP:='levi'}
: ${PACKER_VERSION:='1.7.6'}
: ${TERRAFORM_VERSION:='0.13.7'}
: ${RB_VERSION:='2.6.4'}
: ${NODE_VERSION:='14.16.1'}
: ${PY_VERSION:='3.7.4'}
: ${GO_VERSION:='1.14'}
: ${CINNAMON_DESKTOP:=''}
: ${SKIP:=''}

print_help() {
  echo ">>> Usage:"
  echo "-c | Run Dot File Config - config.sh -c - Default: ${RUN_CONFIG}"
  echo "-n | Don't Run Package Installs - config.sh -n - Default: ${NO_PACKAGES}"
  echo "-i | Don't Setup System Level Files - config.sh -c - Default: ${NO_SYSTEM}"
  echo "-u | Pass Customer User - config.sh -u USER - Default: ${USER}"
  echo "-g | Pass Customer Group - config.sh -g GROUP - Default: ${GROUP}"
  echo "-p | Pass Packer Version to Install - config.sh -p 1.2.2 - Default: ${PACKER_VERSION}"
  echo "-t | Pass Terraform Version to Install - config.sh -t 0.11.6 - Default: ${TERRAFORM_VERSION}"
  echo "-z | Enable the installation/setup of the Cinnamon Desktop Environment (True/False) - config.sh -c - Default: null"
  echo "-s | Skip a specific section of setup/install - config.sh -s dconf"
  echo "-d | Enable Debug"
  echo "-h | List this help menu"
}

while getopts u:g:p:t:z:s:cndih option; do
  case "${option}" in

  c) export RUN_CONFIG='yes' ;;
  n) export NO_PACKAGES='yes' ;;
  i) export NO_SYTEM='yes' ;;
  u) export USER=${OPTARG} ;;
  g) export GROUP=${OPTARG} ;;
  p) export PACKER_VERSION=${OPTARG} ;;
  t) export TERRAFORM_VERSION=${OPTARG} ;;
  z) export CINNAMON_DESKTOP=${OPTARG} ;;
  s) export SKIP=${OPTARG} ;;
  d) export LOG_LEVEL="7" ;;
  h)
    print_help
    exit 2
    ;;
  esac
done

function setos() {
  if [ -n "$(command -v eopkg)" ]; then
    export OS="solus"
    export PKG="eopkg"
    export PKG_INSTALL="sudo eopkg it -y "
    export PACKAGE_SCRIPT="bash ${INIT_HOME}/workstation-setup/packages/solus.sh"
  elif [ -n "$(command -v apt)" ]; then
    export OS="debian"
    export PKG="apt"
    export PKG_INSTALL="sudo apt install -y "
    export PACKAGE_SCRIPT="bash ${INIT_HOME}/workstation-setup/packages/deb.sh"
  elif [ -n "$(command -v pacman)" ]; then
    export OS="arch"
    export PKG="pacman"
    export PKG_INSTALL="sudo pacman -Sy --noconfirm "
    export PACKAGE_SCRIPT="bash ${INIT_HOME}/workstation-setup/packages/pacman.sh"
  elif [ -n "$(command -v dnf)" ]; then
    export OS="fedora"
    export PKG="dnf"
    export PKG_INSTALL="sudo dnf install -y "
    export PACKAGE_SCRIPT="bash ${INIT_HOME}/workstation-setup/packages/fedora.sh"
  fi
}

info ">>> Workstation Setup: Initiating"

###############################################################################
# Setup Config
###############################################################################

setup_git="https://github.com/TheFynx/workstation-setup.git"

export USER_HOME="/home/${USER}"
export HOSTNAME=$(hostname)
export INIT_HOME=${USER_HOME}/init

###############################################################################
# Get PreReqs
###############################################################################

setos
if [ -z "$(command -v git)" ]; then
  info ">>> Git not installed, installing"
  ${PKG_INSTALL} git >/dev/null 2>&1
fi

###############################################################################
# Clone Setup Repo
###############################################################################

mkdir -p ${INIT_HOME}

if [ -d "${INIT_HOME}/workstation-setup" ]; then
  debug ">>> Updating existing setup files"
  cd ${INIT_HOME}/workstation-setup
  git pull >/dev/null 2>&1
  info ">>> Workstation Setup Files Updated"
else
  debug ">>> Pulling new setup files"
  cd ${INIT_HOME}
  git clone ${setup_git} >/dev/null 2>&1
  info ">>> Workstation Setup Files Cloned"
fi

###############################################################################
# Package Install
###############################################################################

if [ "${NO_PACKAGES}" == "no" ]; then
  debug ">>> Running ${OS} OS"
  if [[ "${SKIP,,}" =~ "package" ]]; then
    info ">>> Skipping Package Installs"
  else
    info ">>> Installing ${PKG} packages"
    ${PACKAGE_SCRIPT}
  fi
else
  info ">>> Skipping Package Installs"
fi

###############################################################################
# Setup SSH Keys
###############################################################################

if [ ! -f "${USER_HOME}/.ssh/priv_keys/git" ]; then
  info ">>> Workstation Setup: Generating Git SSH Keys"
  ssh-keygen -t rsa -N "" -f ${USER_HOME}/.ssh/git >/dev/null 2>&1
  mkdir -p ${USER_HOME}/.ssh/priv_keys ${USER_HOME}/.ssh/pub_keys
  mv ${USER_HOME}/.ssh/git ${USER_HOME}/.ssh/priv_keys
  mv ${USER_HOME}/.ssh/git.pub ${USER_HOME}/.ssh/pub_keys
fi

info ">>> Workstation Setup: Adding SSH Config for Git SSH Key"
touch ${USER_HOME}/.ssh/config

if [ -z "$(grep 'github' ~/.ssh/config)" ]; then
  debug "Creating ssh config"
  cat >"${USER_HOME}/.ssh/config" <<EOF
Host github.com
  User git
  Hostname github.com
  PreferredAuthentications publickey
  IdentityFile /home/${USER}/.ssh/priv_keys/git
EOF
fi

if [ ! -f "${USER_HOME}/.ssh/priv_keys/id_rsa" ]; then
  info ">>> Generating SSH Keys"
  mkdir -p ${USER_HOME}/.ssh/priv_keys ${USER_HOME}/.ssh/pub_keys
  ssh-keygen -t rsa -N "" -f ${USER_HOME}/.ssh/id_rsa >/dev/null 2>&1
  mv ${USER_HOME}/.ssh/id_rsa ${USER_HOME}/.ssh/priv_keys
  mv ${USER_HOME}/.ssh/id_rsa.pub ${USER_HOME}/.ssh/pub_keys
fi

###############################################################################
# Install Hashi Tools
###############################################################################

if [ "${NO_PACKAGES}" == "no" ]; then
  info ">>> Installing Hashicorp Tools"
  ${INIT_HOME}/workstation-setup/packages/hashi.sh ${PACKER_VERSION} ${TERRAFORM_VERSION} || warning "Hashi install failed to run"
fi

###############################################################################
# Install Fonts
###############################################################################

if [ "${NO_PACKAGES}" == "no" ]; then
  info ">>> Installing Custom Fonts"
  ${INIT_HOME}/workstation-setup/packages/fonts.sh || warning "Fonts install failed to run"
fi

###############################################################################
# Install Zoom
###############################################################################
if [ "${NO_PACKAGES}" == "no" ]; then
  info ">>> Installing Zoom"
  if [ "${PKG}" != "pacman" ]; then
    ${INIT_HOME}/workstation-setup/packages/zoom.sh || warning "Zoom install failed to run"
  else
    info ">>> Zoom installed via Pacman"
  fi
fi
###############################################################################
# Copy Theming
###############################################################################

info ">>> Copying Wallpapers"
mkdir -p ${USER_HOME}/Wallpapers
/bin/cp -r ${INIT_HOME}/workstation-setup/files/wallpapers/* ${USER_HOME}/Wallpapers/

info ">>> Installing Custom Themes"
/bin/cp -r ${INIT_HOME}/workstation-setup/files/themes/.icons ${USER_HOME}/
/bin/cp -r ${INIT_HOME}/workstation-setup/files/themes/.themes ${USER_HOME}/

read -p "$(query ">>> Workstation Setup: Setup Openbox Themes? y/n (default n)")" openboxAnswer

if [ "${openboxAnswer}" == 'y' ]; then
  info ">>> Installing Openbox Themes"
  /bin/cp -r ${INIT_HOME}/workstation-setup/files/themes/openbox/* ${USER_HOME}/.config/openbox/
  ${USER_HOME}/.config/openbox/scripts/Adaptive-Fynx.sh
fi

###############################################################################
# Install Languages and Specific Packages
###############################################################################
if [ "${NO_PACKAGES}" == "no" ]; then
  info ">>> Installing Python Packages"
  ${INIT_HOME}/workstation-setup/packages/python.sh

  info ">>> Installing Ruby Packages"
  ${INIT_HOME}/workstation-setup/packages/ruby.sh

  info ">>> Installing NodeJS Packages"
  ${INIT_HOME}/workstation-setup/packages/node.sh
fi

###############################################################################
# Install System Files
###############################################################################
if [ "${NO_SYSTEM}" == "no" ]; then
  # info ">>> Installing Pam Login Settings"
  # ${INIT_HOME}/workstation-setup/system_files/pam_login.sh

  read -p "$(query ">>> Workstation Setup: Setup SSH Agent Service? y/n (default n)")" sshAnswer

  if [ "${sshAnswer}" == 'y' ]; then
    info ">>> Installing SSH Agent Service"
    ${INIT_HOME}/workstation-setup/system_files/ssh-agent-service.sh
  fi
fi

###############################################################################
# Terminal Bling Install
###############################################################################
info ">>> Installing Bash It Framework"
if [ -d "${USER_HOME}/.bash_it" ]; then
  info "Bash IT already installed, updating"
  cd ~/.bash_it
  git pull
  cd -
else
  git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
fi

###############################################################################
# Install dotfiles
###############################################################################

if [ "${RUN_CONFIG}" == "yes" ]; then
  info ">>> Configuring dotFiles"

  cd ${INIT_HOME}/workstation-setup/dotfiles

  for dot in *.sh; do
    if [[ "${SKIP,,}" =~ "${dot}" ]]; then
      info ">>> Skipping ${dot}"
    else
      info ">>> Running ${dot}"
      bash $dot || warning "${dot} failed to run"
    fi
  done
fi

###############################################################################
# Cleanup
###############################################################################

info ">>> Perfoming Cleanup"
if [ "${PKG}" == 'eopkg' ]; then
  sudo eopkg rmo -y >/dev/null 2>&1
elif [ "${PKG}" == 'apt' ]; then
  sudo apt-get clean -y >/dev/null 2>&1
elif [ "${PKG}" == 'pacman' ]; then
  sudo pacman -Sc --noconfirm >/dev/null 2>&1
fi

info ">>> Setup Complete"
