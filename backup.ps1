# Backup script for ResponderMap with Metro cleanup
Write-Host "🌀 Backing up your ResponderMap project to GitHub..."

# Stop any Metro servers running on port 8081
$metro = Get-Process node -ErrorAction SilentlyContinue | Where-Object { $_.Path -like "*metro*" -or $_.ProcessName -eq "node" }
if ($metro) {
    Write-Host "🧹 Stopping Metro server..."
    $metro | Stop-Process -Force
}

# Navigate to project
Set-Location "C:\Users\dimtu\ResponderMap"

# Pull latest from GitHub
git pull

# Add all changes
git add .

# Commit with timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "Auto backup on $timestamp"

# Push to GitHub
git push

Write-Host "✅ Backup complete! Metro stopped and all changes pushed."
