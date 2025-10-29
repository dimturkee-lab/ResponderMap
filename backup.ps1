# Backup script for ResponderMap
Write-Host "🌀 Backing up your ResponderMap project to GitHub..."

# Navigate to your project folder
Set-Location "C:\Users\dimtu\ResponderMap"

# Pull latest from GitHub (in case of changes)
git pull

# Add all changes
git add .

# Create a commit with current timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
git commit -m "Auto backup on $timestamp"

# Push to GitHub
git push

Write-Host "✅ Backup complete! Your changes are safely pushed to GitHub."
