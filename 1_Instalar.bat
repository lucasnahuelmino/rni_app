@echo off
title Instalación APP RNI ENACOM

REM Ir a la carpeta donde está este BAT
cd /d "%~dp0"

echo ===========================================
echo  INSTALANDO ENTORNO PARA APP RNI - ENACOM
echo ===========================================
echo.

REM Verificar que haya Python
python --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo ❌ No se encontro Python en esta PC.
    echo    Por favor instalar Python 3.x y volver a ejecutar este archivo.
    pause
    exit /b
)

REM Crear entorno virtual .venv (si no existe)
IF NOT EXIST ".venv" (
    echo Creando entorno virtual .venv ...
    python -m venv .venv
) ELSE (
    echo Entorno virtual .venv ya existe. Continuando...
)

REM Activar entorno virtual
call .venv\Scripts\activate.bat

REM Actualizar pip (opcional pero recomendable)
echo Actualizando pip...
python -m pip install --upgrade pip

REM Instalar dependencias
echo Instalando dependencias desde requirements.txt ...
pip install -r requirements.txt

echo.
echo ✅ Instalación completada.
echo Ahora podes usar "2_Iniciar_RNI.bat" para abrir la app.
echo.
pause
