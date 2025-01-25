@echo off

:: 確保 alert.ps1 存在
if not exist "alert.ps1" (
    echo [錯誤] 無法找到 alert.ps1。
    pause
    exit /b 1
)

:: 執行 PowerShell 腳本
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0alert.ps1"

pause
