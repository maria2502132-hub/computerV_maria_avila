#!/bin/bash

# start.sh - Script de inicialización de MoodMeter
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR"

echo "=========================================================="
echo "          INICIANDO PIPELINE DE MOODMETER"
echo "=========================================================="
echo ""

# Crear el entorno virtual e instalar dependencias si no existe
if [ ! -d "venv" ]; then
    echo "[!] Creando entorno virtual e instalando dependencias..."
    python3 -m venv venv
    source venv/bin/activate
    python -m pip install --upgrade pip
    pip install -r requirements.txt
else
    echo "[x] Activando entorno virtual existente..."
    source venv/bin/activate
fi

echo ""
echo "[*] Servidor local: http://127.0.0.1:8000"
echo "[*] Abre esa dirección en tu navegador."
echo "[!] La primera ejecución de DeepFace puede descargar modelos."
echo ""
echo "Presiona Ctrl+C para detener el servidor."
echo "----------------------------------------------------------"

# Iniciar servidor local
python -m uvicorn app.main:app --reload --host 127.0.0.1 --port 8000