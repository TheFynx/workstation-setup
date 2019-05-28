if [ "${PKG}" == 'eopkg' ]; then
  echo "No support yet"
elif [ "${PKG}" == 'apt' ]; then
  curl -O https://prerelease.keybase.io/keybase_amd64.deb
  sudo dpkg -i keybase_amd64.deb
  sudo apt-get install -f || warning ">>> Keybase failed to install"
fi

info ">>> Keybase Installed"
