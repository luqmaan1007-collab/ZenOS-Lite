# Start the ZenOS XFCE desktop only on the first local virtual terminal.
if [[ -z "${DISPLAY:-}" && "$(tty 2>/dev/null)" == "/dev/tty1" ]]; then
  exec startx
fi
