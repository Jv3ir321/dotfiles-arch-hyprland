#!/bin/bash

# Opciones visibles para el usuario
options=(
  "⏻  Apagar"
  "  Reiniciar"
  "  Cerrar sesión"
  "  Bloquear"
  "🔃  Suspender"
)

# Mostrar menú con Wofi
chosen=$(printf "%s\n" "${options[@]}" | \
  wofi --dmenu --style ~/.config/wofi/style.css --width 300 --height 240 --location 0 --cache-file /dev/null)

# Ejecutar acción según opción seleccionada
case "$chosen" in
  "⏻  Apagar") systemctl poweroff ;;
  "  Reiniciar") systemctl reboot ;;
  "  Cerrar sesión") hyprctl dispatch exit ;;
  "  Bloquear") hyprlock ;;
  "🔃  Suspender") hyprlock && systemctl suspend ;;
  *) exit 0 ;;
esac

