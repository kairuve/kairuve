#!/usr/bin/env bash
# Valida que toda mención a DEC-00X o a otro doc .md sea un link clickeable.
# Excluye DECISIONS.md (es la fuente de los anchors) y docs/GRAPHIFY.md /
# graphify-out/ (snapshots generados, fuera de alcance del sistema de refs).

set -euo pipefail
cd "$(dirname "$0")/.."

FILES=(
  STATUS.md
  ROADMAP.md
  SESSIONS.md
  CONTRIBUTING.md
  README.md
  docs/ARCHITECTURE.md
  docs/BOM.md
  docs/ASSEMBLY.md
  docs/REFERENCES.md
  firmware/pico/README.md
  firmware/arduino/README.md
  ros/kairuve_control/README.md
  ros/kairuve_vision/README.md
)

WARNINGS=0

strip_fences() {
  awk '/^```/{f=!f; next} !f'
}

for file in "${FILES[@]}"; do
  [[ -f "$file" ]] || continue
  while IFS=: read -r lineno content; do
    if [[ -z "$content" ]]; then
      continue
    fi
    if echo "$content" | grep -qE 'DEC-00[1-3]' && ! echo "$content" | grep -qE '\[DEC-00[1-3]\]\([^)]+\)'; then
      echo "⚠️  $file:$lineno referencia suelta a DEC-00X: $content"
      WARNINGS=$((WARNINGS + 1))
    fi
  done < <(strip_fences < "$file" | grep -nE 'DEC-00[1-3]' || true)
done

if [[ $WARNINGS -eq 0 ]]; then
  echo "✅ Sin referencias sueltas detectadas."
  exit 0
else
  echo "❌ $WARNINGS referencias sueltas encontradas."
  exit 1
fi
