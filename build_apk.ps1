# Flutter APK Build Script
# This script will build the APK and handle common issues

Write-Host "=== Flutter APK Build Script ===" -ForegroundColor Cyan
Write-Host ""

# Check Developer Mode
Write-Host "Checking Developer Mode..." -ForegroundColor Yellow
$devMode = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" -Name "AllowDevelopmentWithoutDevLicense" -ErrorAction SilentlyContinue
if ($devMode -and $devMode.AllowDevelopmentWithoutDevLicense -eq 1) {
    Write-Host "✓ Developer Mode is ENABLED" -ForegroundColor Green
} else {
    Write-Host "✗ Developer Mode is DISABLED" -ForegroundColor Red
    Write-Host "Please enable Developer Mode:" -ForegroundColor Yellow
    Write-Host "1. Press Windows + I" -ForegroundColor Yellow
    Write-Host "2. Go to Privacy & Security > For developers" -ForegroundColor Yellow
    Write-Host "3. Enable Developer Mode toggle" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Opening Developer Mode settings..." -ForegroundColor Yellow
    start ms-settings:developers
    Read-Host "Press Enter after enabling Developer Mode to continue"
}

# Clean build
Write-Host ""
Write-Host "Cleaning previous build..." -ForegroundColor Yellow
flutter clean

# Get dependencies
Write-Host ""
Write-Host "Getting Flutter dependencies..." -ForegroundColor Yellow
flutter pub get

# Check for Android SDK 36
Write-Host ""
Write-Host "Checking Android SDK..." -ForegroundColor Yellow
$androidHome = $env:ANDROID_HOME
if (-not $androidHome) {
    $androidHome = "$env:LOCALAPPDATA\Android\Sdk"
}

$sdk36Path = "$androidHome\platforms\android-36"
if (Test-Path $sdk36Path) {
    Write-Host "✓ Android SDK 36 found" -ForegroundColor Green
} else {
    Write-Host "✗ Android SDK 36 not found" -ForegroundColor Red
    Write-Host "Please install Android SDK 36:" -ForegroundColor Yellow
    Write-Host "1. Open Android Studio" -ForegroundColor Yellow
    Write-Host "2. Tools > SDK Manager" -ForegroundColor Yellow
    Write-Host "3. SDK Platforms > Check 'Android 15.0 (API 36)'" -ForegroundColor Yellow
    Write-Host "4. Click Apply" -ForegroundColor Yellow
    Read-Host "Press Enter after installing SDK 36 to continue"
}

# Check for NDK
Write-Host ""
Write-Host "Checking Android NDK..." -ForegroundColor Yellow
$ndkPath = "$androidHome\ndk\27.0.12077973"
if (Test-Path $ndkPath) {
    Write-Host "✓ Android NDK 27.0.12077973 found" -ForegroundColor Green
} else {
    Write-Host "✗ Android NDK 27.0.12077973 not found" -ForegroundColor Red
    Write-Host "Please install Android NDK:" -ForegroundColor Yellow
    Write-Host "1. Open Android Studio" -ForegroundColor Yellow
    Write-Host "2. Tools > SDK Manager" -ForegroundColor Yellow
    Write-Host "3. SDK Tools > Check 'NDK (Side by side)'" -ForegroundColor Yellow
    Write-Host "4. Click Apply" -ForegroundColor Yellow
    Read-Host "Press Enter after installing NDK to continue"
}

# Build APK
Write-Host ""
Write-Host "Building APK (Debug)..." -ForegroundColor Yellow
Write-Host "This may take several minutes..." -ForegroundColor Yellow
Write-Host ""

flutter build apk --debug

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "=== BUILD SUCCESSFUL ===" -ForegroundColor Green
    Write-Host "APK location: build\app\outputs\flutter-apk\app-debug.apk" -ForegroundColor Cyan
} else {
    Write-Host ""
    Write-Host "=== BUILD FAILED ===" -ForegroundColor Red
    Write-Host "Please check the error messages above." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

