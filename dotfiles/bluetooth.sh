info ">>> Generating Bluetooth Config Files"

mkdir -p ${HOME}/.custom/

cat >"${HOME}/.custom/bluetooth_main.conf" <<EOF
[General]
[GATT]
[Policy]
AutoEnable=true
EOF

if [ -f "/etc/bluetooth/main.conf" ]; then
  info ">>> Bluetooth: File detected - Looking for changes"
  if [ -n "$(diff -y --suppress-common-lines /etc/bluetooth/main.conf ${HOME}/.custom/bluetooth_main.conf)" ]; then
    info ">>> Bluetooth: Changes detected, printing side by side diff"
    diff -y --suppress-common-lines /etc/bluetooth/main.conf ${HOME}/.custom/bluetooth_main.conf
    mv ${HOME}/.custom/bluetooth_main.conf /etc/bluetooth/main.conf
  else
    info ">>> Bluetooth: No changes detected"
    mv ${HOME}/.custom/bluetooth_main.conf /etc/bluetooth/main.conf
  fi
else
  info ">>> Bluetooth: No file detected, creating new file"
  mv ${HOME}/.custom/bluetooth_main.conf /etc/bluetooth/main.conf
fi