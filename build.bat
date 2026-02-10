@echo off
echo ========================================
echo Flutter APK Build Script
echo ========================================
echo.

echo Checking Developer Mode...
powershell -Command "$devMode = Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock' -Name 'AllowDevelopmentWithoutDevLicense' -ErrorAction SilentlyContinue; if ($devMode -and $devMode.AllowDevelopmentWithoutDevLicense -eq 1) { Write-Host 'Developer Mode: ENABLED' -ForegroundColor Green; exit 0 } else { Write-Host 'Developer Mode: DISABLED' -ForegroundColor Red; Write-Host 'Please enable Developer Mode:' -ForegroundColor Yellow; Write-Host '1. Press Windows + I' -ForegroundColor Yellow; Write-Host '2. Go to Privacy ^& Security ^> For developers' -ForegroundColor Yellow; Write-Host '3. Enable Developer Mode toggle' -ForegroundColor Yellow; Write-Host ''; Write-Host 'Opening Developer Mode settings...' -ForegroundColor Yellow; Start-Process 'ms-settings:developers'; exit 1 }"
if errorlevel 1 (
    echo.
    echo ========================================
    echo ERROR: Developer Mode is required!
    echo ========================================
    echo Please enable Developer Mode in the settings window that just opened.
    echo After enabling, run this script again.
    echo.
    pause
    exit /b 1
)

echo.
echo Step 1: Cleaning previous build...
call flutter clean
if errorlevel 1 goto error

echo.
echo Step 2: Getting dependencies...
call flutter pub get
if errorlevel 1 goto error

echo.
echo Step 3: Building APK (Debug)...
echo This may take several minutes...
echo.
call flutter build apk --debug
if errorlevel 1 goto error

echo.
echo ========================================
echo BUILD SUCCESSFUL!
echo ========================================
echo APK location: build\app\outputs\flutter-apk\app-debug.apk
echo.
pause
goto end

:error
echo.
echo ========================================
echo BUILD FAILED!
echo ========================================
echo Please check the error messages above.
echo.
pause
exit /b 1

:end

