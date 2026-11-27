# Start the ZenOS graphical session automatically on the first virtual console.
if [[ -z "${DISPLAY:-}" && "${XDG_VTNR:-}" == "1" ]]; then
  exec startx
fi
