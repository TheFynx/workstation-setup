cat > "${HOME}/.exports" << 'EOF'
# Make vim the default editor
export EDITOR=$(which nvim)
export TERM="xterm-256color"

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=50000000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Prefer US English and use UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Highlight section titles in manual pages
export LESS_TERMCAP_md="${yellow}"

export TODOTXT_DEFAULT_ACTION=ls

# hidpi for gtk apps
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export QT_DEVICE_PIXEL_RATIO=2

# Set docker to allow untrusted images
export DOCKER_CONTENT_TRUST=0

EOF
