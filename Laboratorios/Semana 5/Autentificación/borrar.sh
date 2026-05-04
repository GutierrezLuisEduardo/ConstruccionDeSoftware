#!/usr/bin/env bash
set -euo pipefail

# Define blacklist con rutas absolutas (archivos o directorios)
BLACKLIST=(
  "/home/distrobulk/Documentos/Construcción de software/Laboratorios/Semana 5/Autentificación/MVC/node_modules"
  "/home/distrobulk/Documentos/Construcción de software/Laboratorios/Semana 5/Autentificación/MVC/package.json"
  "/home/distrobulk/Documentos/Construcción de software/Laboratorios/Semana 5/Autentificación/MVC/package-lock.json"
  "/home/distrobulk/Documentos/Construcción de software/Laboratorios/Semana 5/Autentificación/MVC/.env"
  "/home/distrobulk/Documentos/Construcción de software/Laboratorios/Semana 5/Autentificación/MVC/borrar.sh"
)

# Obtiene ruta absoluta del directorio actual
ROOT="$(pwd -P)"

is_blacklisted() {
  local path="$1"
  for b in "${BLACKLIST[@]}"; do
    if [[ "$path" == "$b" ]]; then
      return 0
    fi
  done
  return 1
}

# Recorre directorios recursivamente (evita seguir enlaces simbólicos a directorios)
while IFS= read -r -d '' dir; do
  # chequea blacklist para el directorio
  if is_blacklisted "$dir"; then
    continue
  fi

  # lista contenido del directorio (como se pidió, hacer ls en cada dir)
  echo "== ls: $dir =="
  ls -la -- "$dir" || true

  # procesa archivos regulares (no directorios) en este directorio
  while IFS= read -r -d '' file; do
    # obtener ruta absoluta normalizada
    file_path="$(readlink -f -- "$file")"
    if is_blacklisted "$file_path"; then
      continue
    fi
    echo "---- cat: $file_path ----"
    cat -- "$file_path"
  done < <(find "$dir" -maxdepth 1 -mindepth 1 -type f -print0)

done < <(find "$ROOT" -type d -print0)
