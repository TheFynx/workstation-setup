#!/usr/bin/env bash
# This file:
#
#  - Sets up a Solus system to my liking
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
set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

# Define the environment variables (and their defaults) that this script depends on
LOG_LEVEL="${LOG_LEVEL:-6}" # 7 = debug -> 0 = emergency
NO_COLOR="${NO_COLOR:-}"    # true = disable color. otherwise autodetected


### Functions
##############################################################################

function __b3bp_log () {
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

  if [[ "${NO_COLOR:-}" = "true" ]] || ( [[ "${TERM:-}" != "xterm"* ]] && [[ "${TERM:-}" != "screen"* ]] ) || [[ ! -t 2 ]]; then
    if [[ "${NO_COLOR:-}" != "false" ]]; then
      # Don't use colors on pipes or non-recognized terminals
      color=""; color_reset=""
    fi
  fi

  # all remaining arguments are to be printed
  local log_line=""

  while IFS=$'\n' read -r log_line; do
    echo -e "$(date -u +"%Y-%m-%d %H:%M:%S UTC") ${color}$(printf "[%9s]" "${log_level}")${color_reset} ${log_line}" 1>&2
  done <<< "${@:-}"
}

function emergency () {                                __b3bp_log emergency "${@}"; exit 1; }
function alert ()     { [[ "${LOG_LEVEL:-0}" -ge 1 ]] && __b3bp_log alert "${@}"; true; }
function critical ()  { [[ "${LOG_LEVEL:-0}" -ge 2 ]] && __b3bp_log critical "${@}"; true; }
function error ()     { [[ "${LOG_LEVEL:-0}" -ge 3 ]] && __b3bp_log error "${@}"; true; }
function warning ()   { [[ "${LOG_LEVEL:-0}" -ge 4 ]] && __b3bp_log warning "${@}"; true; }
function notice ()    { [[ "${LOG_LEVEL:-0}" -ge 5 ]] && __b3bp_log notice "${@}"; true; }
function info ()      { [[ "${LOG_LEVEL:-0}" -ge 6 ]] && __b3bp_log info "${@}"; true; }
function debug ()     { [[ "${LOG_LEVEL:-0}" -ge 7 ]] && __b3bp_log debug "${@}"; true; }

USER='levi'
GROUP='levi'
PACKER_VERSION='1.2.4'
TERRAFORM_VERSION='0.11.7'

print_help() {
  echo ">>> Usage:"
  echo "-u | Pass Customer User - install.sh -u USER - Default: ${USER}"
  echo "-g | Pass Customer Group - install.sh -g GROUP - Default: ${GROUP}"
  echo "-p | Pass Packer Version to Install - install.sh -p 1.2.2 - Default: ${PACKER_VERSION}"
  echo "-t | Pass Terraform Version to Install - install.sh -t 0.11.6 - Default: ${TERRAFORM_VERSION}"
  echo "-? | List this help menu"
}

while getopts u:g:p:t:? option
do
 case "${option}"
 in
 u) USER=${OPTARG};;
 g) GROUP=${OPTARG};;
 p) PACKER_VERSION=${OPTARG};;
 t) TERRAFORM_VERSION=${OPTARG};;
 ?) print_help; exit 2;;
 esac
done


function setos () {
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
    export PKG_INSTALL="sudo pacman -Sy "
    export PACKAGE_SCRIPT="bash ${INIT_HOME}/workstation-setup/packages/arch.sh"
  elif [ -n "$(command -v dnf)" ]; then
    export OS="fedora"
    export PKG="dnf"
    export PKG_INSTALL="sudo dnf install -y "
    export PACKAGE_SCRIPT="bash ${INIT_HOME}/workstation-setup/packages/fedora.sh"
  fi
}

info ">>> Workstation Setup: Initiating"

########################
# Setup Config
########################

setup_git="https://github.com/TheFynx/workstation-setup.git"

USER_HOME="/home/${USER}"
HOSTNAME=$(hostname)
export INIT_HOME=${USER_HOME}/init

########################
# Get PreReqs
########################

setos
if [ -z "$(command -v git)" ]; then
  $PKG_INSTALL git
fi

########################
# Clone Setup Repo
########################

mkdir -p ${INIT_HOME}

if [ -d "${INIT_HOME}/workstation-setup" ]; then
    cd ${INIT_HOME}/workstation-setup
    git pull
    info ">>> Workstation Setup Files Updated"
else
    cd ${INIT_HOME}
    git clone ${setup_git}
    info ">>> Workstation Setup Files Cloned"
fi

########################
# Package Install
########################

info ">>> Installing packages"

debug ">>> Running ${OS} OS"
${PACKAGE_SCRIPT}

info ">>> Installing Snaps"
${INIT_HOME}/workstation-setup/packages/snap.sh

#info ">>> Installing Flatpaks"
#${INIT_HOME}/workstation-setup/packages/flat.sh

########################
# Setup SSH Keys
########################

# READ and Ask for GIT keys
# curl -H "Authorization: token OAUTH-TOKEN" --data '{"title":"test-key","key":"'"$(cat ~/.ssh/id_rsa.pub)"'"}' https://api.github.com/user/keys

read -p ">>> Client Install: Do you have a secrets file? y/n (default n) " secretAnswer

if [ "${secretAnswer}" == 'y' ]; then
  read -p ">>> Client Install: Please enter path to secret file to source (i.e. /path/to/creds.sh) " secretPath
  . ${secretPath}

  if [ ! -f "${USER_HOME}/.ssh/git" ]; then
    info ">>> Client Install: Generating Git SSH Keys"
    ssh-keygen -t rsa -N "" -f ${USER_HOME}/.ssh/git
  fi

  info ">>> Client Install: Uploading Git SSH Keys"
  if [ -z "$(curl -s -H "Authorization: token ${GH_TOKEN}" https://api.github.com/user/keys | grep "${HOSTNAME}")" ]; then
    curl -H "Authorization: token ${GH_TOKEN}" --data '{"title":"'"${HOSTNAME}"'","key":"'"$(cat ~/.ssh/git.pub)"'"}' https://api.github.com/user/keys
  else
    info ">>> Client Install: Git Key Already Exists"
  fi

  info ">>> Client Install: Adding SSH Config for Git SSH Key"
  touch ${USER_HOME}/.ssh/config
  if [ -z "$(grep 'github' ~/.ssh/config)" ]; then
    cat > "${USER_HOME}/.ssh/config" << EOF
Host github.com
  User git
  Hostname github.com
  PreferredAuthentications publickey
  IdentityFile /home/${USER}/.ssh/git
EOF
  fi
fi

if [ ! -f "${USER_HOME}/.ssh/id_rsa" ]; then
  info ">>> Generating SSH Keys"
  ssh-keygen -t rsa -N "" -f ${USER_HOME}/.ssh/id_rsa
fi

########################
# Install Hashi Tools
########################

info ">>> Installing Hashicorp Tools"

cd /tmp

install_packer () {
  curl https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip -o packer.zip &&\
  sudo unzip -o packer.zip -d /usr/bin/ &&\
  sudo chmod +x /usr/bin/packer
}

install_terraform () {
  curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip &&\
  sudo unzip -o terraform.zip -d /usr/bin/ &&\
  sudo chmod +x /usr/bin/terraform
}

if [ -z "$(command -v packer)" ]; then
  install_packer
elif [ "$(packer -version)" != "${PACKER_VERSION}" ]; then
  sudo rm -f /usr/bin/packer
  install_packer
else
  info ">>> Packer Already Installed and at wanted version"
fi

if [ -z "$(command -v terraform)" ]; then
  install_terraform
elif [ "$(terraform -version)" != "${TERRAFORM_VERSION}" ]; then
  sudo rm -f /usr/bin/terraform
  install_terraform
else
  info ">>> Terraform Already Installed and at wanted version"
fi

########################
# Install Fonts
########################

info ">>> Installing Custom Fonts"

if [ ! -d "${USER_HOME}/.local/share/fonts" ]; then
  cd /tmp

  git clone https://github.com/powerline/fonts.git --depth=1 &&\
  cd fonts &&\
  sh ./install.sh &&\
  cd .. &&\
  rm -rf fonts
else
  info ">>> Fonts already installed"
fi

########################
# Install Oh-My-ZSH
########################

info ">>> Installing Oh-My-ZSH"

cd ${HOME}

if [ ! -d "${USER_HOME}/.oh-my-zsh" ]; then
  git clone https://github.com/robbyrussell/oh-my-zsh.git ${USER_HOME}/.oh-my-zsh
  curl http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme -o ~/.oh-my-zsh/custom/themes/bullet-train.zsh-theme
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
  info ">>> Oh-My-ZSH Already Installed"
fi

########################
# Install dotfiles
########################

info ">>> Configuring dotFiles"

cd ${INIT_HOME}/workstation-setup/dotfiles

for dot in *.sh; do
  info ">>> Running ${dot}"
  bash $dot || warning "${dot} failed to run"
done

########################
# Cleanup
########################

info ">>> Perfoming Cleanup"
sudo eopkg rmo -y

echo 'please run `chsh -s /bin/zsh` to run oh-my-zsh'