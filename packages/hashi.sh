PACKER_VERSION=$1
TERRAFORM_VERSION=$2
CONSUL_VERSION=$3

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

install_consul () {
  curl https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -o consul.zip &&\
  sudo unzip -o consul.zip -d /usr/bin/ &&\
  sudo chmod +x /usr/bin/consul
}

if [ -z "$(command -v packer)" ]; then
  info ">>> Installing Packer"
  install_packer > /dev/null 2>&1
elif [ "$(packer -version)" != "${PACKER_VERSION}" ]; then
  info ">>> Upgrading Packer"
  sudo rm -f /usr/bin/packer
  install_packer > /dev/null 2>&1
else
  info ">>> Packer Already Installed and at wanted version"
fi

if [ -z "$(command -v terraform)" ]; then
  info ">>> Installing Terraform"
  install_terraform > /dev/null 2>&1
elif [ "$(terraform -version)" != "Terraform v${TERRAFORM_VERSION}" ]; then
  info ">>> Upgrading Terraform"
  sudo rm -f /usr/bin/terraform
  install_terraform > /dev/null 2>&1
else
  info ">>> Terraform Already Installed and at wanted version"
fi

if [ -z "$(command -v consul)" ]; then
  info ">>> Installing Consul"
  install_consul > /dev/null 2>&1
elif [ "$(consul -version)" != "consul v${CONSUL_VERSION}" ]; then
  info ">>> Upgrading Consul"
  sudo rm -f /usr/bin/consul
  install_consul > /dev/null 2>&1
else
  info ">>> Consul Already Installed and at wanted version"
fi