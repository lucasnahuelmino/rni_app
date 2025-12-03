@echo off
title BASE DE DATOS RADIACIONES NO IONIZANTES - ENACOM - Inicio

REM Ir a la carpeta donde está este BAT
cd /d "%~dp0"

REM Verificar que exista el entorno virtual
IF NOT EXIST ".venv" (
    echo ❌ No se encontro el entorno virtual .venv
    echo    Primero ejecuta "1_Instalar.bat"
    pause
    exit /b
)

REM Activar entorno virtual
call .venv\Scripts\activate.bat

REM Levantar Streamlit en puerto fijo (ej: 8501)
python -m streamlit run rni_app_v3.2.py --server.port 8501

REM Mantener consola abierta por si hay errores
pause
