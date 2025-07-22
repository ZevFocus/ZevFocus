# ZevFocus CLI Installer Script for Windows
$exeUrl = "https://2003aditya.github.io/ZevFocus-website/zevfocus.exe"
$installDir = "$env:USERPROFILE\.zevfocus"
$exePath = "$installDir\zevfocus.exe"

Write-Host "`n📦 Installing ZevFocus CLI..."
Write-Host "⬇️  Downloading from: $exeUrl"
Write-Host "📁 Installing to: $installDir"

# Create install directory if it doesn't exist
if (-not (Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir | Out-Null
}

# Download the binary
try {
    Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing
} catch {
    Write-Error "❌ Failed to download zevfocus.exe. Check your internet connection or the URL."
    exit 1
}

# Add to PATH if not already present
$envPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($envPath -notlike "*$installDir*") {
    $newPath = "$envPath;$installDir"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    Write-Host "✅ PATH updated successfully (user-level)."
    Write-Host "🔁 Please restart your terminal to use 'zevfocus' globally."
} else {
    Write-Host "ℹ️ ZevFocus install path already exists in PATH."
}

# Verify installation
if (Test-Path $exePath) {
    Write-Host "`n🎉 ZevFocus CLI installed successfully!"
    Write-Host "📍 Location: $exePath"
    Write-Host "👉 Try running: zevfocus summary (after restarting your terminal)"
} else {
    Write-Error "❌ Installation failed. File not found at expected location: $exePath"
}
