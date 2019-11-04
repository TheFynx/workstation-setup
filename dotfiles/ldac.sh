#!/usr/bin/env bash

info ">>> Setting up LDAC Support"
# Set -E on bluetooth
cat <<'EOF' | sudo tee /usr/lib/systemd/system/bluetooth.service
[Unit]
Description=Bluetooth service
Documentation=man:bluetoothd(8)
ConditionPathIsDirectory=/sys/class/bluetooth

[Service]
Type=dbus
BusName=org.bluez
ExecStart=/usr/lib/bluetooth/bluetoothd -E
NotifyAccess=main
#WatchdogSec=10
#Restart=on-failure
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
LimitNPROC=1
ProtectHome=true
ProtectSystem=full

[Install]
WantedBy=bluetooth.target
Alias=dbus-org.bluez.service
EOF

# Enabled LDAC HiDef in Pulse
if [ -z "$(grep "ldac_eqmid=hq ldac_fmt=f32" /etc/pulse/default.pa)" ]; then
  sudo sed -i 's/load-module module-bluetooth-discover/load-module module-bluetooth-discover a2dp_config="ldac_eqmid=hq ldac_fmt=f32"/' /etc/pulse/default.pa
fi

# Sometimes it needs to be reinstalled
yay -Sy --noconfirm --noeditmenu --nodiffmenu --noprovides --needed libldac >/dev/null 2>&1
