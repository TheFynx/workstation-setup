#!/usr/bin/env bash

set -o nounset

cd /tmp

install_packer() {
  curl https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip -o packer.zip &&
    sudo unzip -o packer.zip -d /usr/bin/ &&
    sudo chmod +x /usr/bin/packer
}

install_terraform() {
  curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform.zip &&
    sudo unzip -o terraform.zip -d /usr/bin/ &&
    sudo chmod +x /usr/bin/terraform
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
elif [ "$(terraform -version)" != "Terraform v${TERRAFORM_VERSION}" ]; then
  info ">>> Upgrading Terraform"
  sudo rm -f /usr/bin/terraform
  install_terraform >/dev/null 2>&1
else
  info ">>> Terraform Already Installed and at wanted version"
fi
