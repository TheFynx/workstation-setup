if [ "${PKG}" == "apt" ]; then
  if [ -z "$(dpkg -l | awk '{print $2}' | grep -w "zoom")" ]; then
    cd /tmp
    curl -sO https://zoom.us/client/latest/zoom_amd64.deb
    apt install -y zoom_amd64.deb || warning "Failed to install zoom"
    rm -rf zoom_amd64.deb
  else
    info ">>> Zoom already installed"
  fi
else
  if [ ! -d "/opt/zoom" ]; then
    cd /tmp
    curl -sL https://zoom.us/client/latest/zoom_x86_64.tar.xz -o zoom.tar.xz
    tar -xzf zoom.tar.xz > /dev/null 2>&1 || warning "Failed to un-tar Zoom"
    sudo mkdir /opt
    sudo mv zoom /opt/zoom
    sudo chmod -R 755 /opt

    cat << EOF | sudo tee /usr/share/applications/Zoom.desktop
    [Desktop Entry]
    Name=Zoom
    Icon=/opt/zoom/application-x-zoom.png
    Comment=Zoom Video Conference
    Exec=/opt/zoom/ZoomLauncher %U
    Path=/opt/zoom/
    Terminal=false
    Type=Application
    Encoding=UTF-8
    Categories=Network;Application;
    MimeType=x-scheme-handler/zoommtg;application/x-zoom;
    X-KDE-Protocols=zoommtg
    Name[en_US]=Zoom
EOF

    sudo update-desktop-database > /dev/null 2>&1

    rm -rf /tmp/zoom.tar.xz
    info ">>> Zoom succesfully installed"
  else
    info ">>> Zoom already installed"
  fi
fi

