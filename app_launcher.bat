@echo off
cd /d %~dp0
call .\rni_env\Scripts\activate.bat
streamlit run tabla_maestra.py
pause
