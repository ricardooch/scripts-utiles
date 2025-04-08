#!/bin/bash
echo "🔁 Reiniciando servicios de audio..."
systemctl --user restart pipewire pipewire-pulse wireplumber
echo "✅ Audio reiniciado. ¡Que suene la música!"
