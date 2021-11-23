#!/usr/bin/env bash

# Exit on error inside any functions or subshells.
# set -o errtrace
# Do not allow use of undefined vars. Use ${VAR:-} to use an undefined VAR
set -o nounset
# Catch the error in case mysqldump fails (but gzip succeeds) in `mysqldump |gzip`
set -o pipefail
# Turn on traces, useful while debugging but commented out by default
# set -o xtrace

source .env

cd /tmp

install_packer() {
  curl https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip -o packer.zip
  sudo unzip -o packer.zip -d /usr/bin/
  sudo chmod +x /usr/bin/packer
}

install_terraform() {
  curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip
  sudo unzip -o terraform.zip -d /usr/bin/
  sudo chmod +x /usr/bin/terraform
}

install_terraform11() {
  curl https://releases.hashicorp.com/terraform/${TERRAFORM11_VERSION}/terraform_${TERRAFORM11_VERSION}_linux_amd64.zip -o terraform11.zip
  sudo unzip -o terraform11.zip -d /tmp
  sudo mv /tmp/terraform /usb/bin/terraform11
  sudo chmod +x /usr/bin/terraform11
}

install_terraform12() {
  curl https://releases.hashicorp.com/terraform/${TERRAFORM12_VERSION}/terraform_${TERRAFORM12_VERSION}_linux_amd64.zip -o terraform12.zip
  sudo unzip -o terraform12.zip -d /tmp
  sudo mv /tmp/terraform /usb/bin/terraform12
  sudo chmod +x /usr/bin/terraform12
}

if [ -n "$(command -v packer)" ]; then
  info ">>> Installing Packer"
  install_packer >/dev/null 2>&1
elif [ "$(packer -version)" != "${PACKER_VERSION}" ]; then
  info ">>> Upgrading Packer"
  sudo rm -f /usr/bin/packer
  install_packer >/dev/null 2>&1
else
  info ">>> Packer Already Installed and at wanted version"
fi

if [ -n "$(command -v terraform)" ]; then
  info ">>> Installing Terraform"
  install_terraform >/dev/null 2>&1
elif [ "$(terraform version --json | jq .terraform_version)" != "${TERRAFORM_VERSION}" ]; then
  info ">>> Upgrading Terraform"
  sudo rm -f /usr/bin/terraform
  install_terraform >/dev/null 2>&1
else
  info ">>> Terraform Already Installed and at wanted version"
fi

if [ -n "$(command -v terraform11)" ]; then
  info ">>> Installing Terraform v11"
  install_terraform11 >/dev/null 2>&1
elif [ "$(terraform11 version --json | jq .terraform_version)" != "${TERRAFORM11_VERSION}" ]; then
  info ">>> Upgrading Terraform11"
  sudo rm -f /usr/bin/terraform11
  install_terraform11 >/dev/null 2>&1
else
  info ">>> Terraform Already Installed and at wanted version"
fi

if [ -n "$(command -v terraform12)" ]; then
  info ">>> Installing Terraform v12"
  install_terraform12 >/dev/null 2>&1
elif [ "$(terraform12 version --json | jq .terraform_version)" != "${TERRAFORM12_VERSION}" ]; then
  info ">>> Upgrading Terraform12"
  sudo rm -f /usr/bin/terraform12
  install_terraform12 >/dev/null 2>&1
else
  info ">>> Terraform12 Already Installed and at wanted version"
fi
