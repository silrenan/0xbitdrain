# Media Content Downloader
# PowerShell script to download media content from various platforms using yt-dlp
# Downloads all links from input.txt to the user's Desktop
# 
# Author: silrenan
# License: Unlicensed
# Repository: https://github.com/silrenan/0xbitdrain
# 
# Prerequisites:
# - yt-dlp must be installed and available in PATH
# - input.txt file with media URLs (one per line)
#
# Supported platforms: Instagram, TikTok, YouTube, Twitter, and many more
# (any platform supported by yt-dlp)
#
# Usage: 
#   .\download_media.ps1                              # Download video/audio
#   .\download_media.ps1 -x                           # Extract audio only
#   .\download_media.ps1 -c chrome                    # Use Chrome cookies
#   .\download_media.ps1 -x -c firefox                # Extract audio with Firefox cookies

param(
    [switch]$x,                    # Extract audio only
    [string]$c = $null,           # Browser for cookies (chrome, firefox, edge, etc.)
    [switch]$h,                   # Show help
    [switch]$help                 # Show help (alternative)
)

# Show help if requested
if ($h -or $help) {
    Write-Host "Media Content Downloader - Download media from various platforms using yt-dlp" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "Usage:" -ForegroundColor Yellow
    Write-Host "  .\download_media.ps1                    # Basic download"
    Write-Host "  .\download_media.ps1 -x                 # Extract audio only"
    Write-Host "  .\download_media.ps1 -c chrome          # Use Chrome cookies"
    Write-Host "  .\download_media.ps1 -x -c firefox      # Extract audio with Firefox cookies"
    Write-Host "  .\download_media.ps1 -h                 # Show this help"
    Write-Host ""
    Write-Host "Parameters:" -ForegroundColor Yellow
    Write-Host "  -x              Extract audio only (passes -x to yt-dlp)"
    Write-Host "  -c <browser>    Use cookies from browser (chrome, firefox, edge, safari, etc.)"
    Write-Host "  -h, -help       Show this help message"
    Write-Host ""
    Write-Host "Examples:" -ForegroundColor Yellow
    Write-Host "  .\download_media.ps1 -x -c chrome       # Extract audio using Chrome cookies"
    Write-Host "  .\download_media.ps1 -c firefox         # Download video using Firefox cookies"
    Write-Host ""
    Write-Host "Requirements:" -ForegroundColor Yellow
    Write-Host "  - yt-dlp must be installed and in PATH"
    Write-Host "  - input.txt file with media URLs (one per line)"
    Write-Host ""
    Write-Host "Author: silrenan | Repository: https://github.com/silrenan/0xbitdrain" -ForegroundColor Green
    exit 0
}

# Get the current directory and Desktop path
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$inputFile = Join-Path $scriptDir "input.txt"
$desktopPath = [Environment]::GetFolderPath("Desktop")

# Check if input.txt exists
if (-not (Test-Path $inputFile)) {
    Write-Host "Error: input.txt not found in $scriptDir" -ForegroundColor Red
    exit 1
}

# Check if yt-dlp is available in PATH
try {
    $null = Get-Command "yt-dlp" -ErrorAction Stop
    Write-Host "yt-dlp found in PATH" -ForegroundColor Green
}
catch {
    Write-Host "Error: yt-dlp not found in PATH" -ForegroundColor Red
    Write-Host "Please install yt-dlp or add it to your PATH" -ForegroundColor Yellow
    exit 1
}

# Read all lines from input.txt and filter out comments and empty lines
$links = Get-Content $inputFile | Where-Object { 
    $line = $_.Trim()
    $line -ne "" -and -not $line.StartsWith("#")
}

Write-Host "Found $($links.Count) media links to download" -ForegroundColor Green
Write-Host "Download destination: $desktopPath" -ForegroundColor Cyan

# Display configuration
if ($x) {
    Write-Host "Mode: Audio extraction only" -ForegroundColor Yellow
}
if ($c) {
    Write-Host "Using cookies from browser: $c" -ForegroundColor Yellow
}

# Build yt-dlp command arguments
$ytdlpArgs = @()
$ytdlpArgs += "--output"
$ytdlpArgs += "$desktopPath\%(title)s.%(ext)s"

if ($x) {
    $ytdlpArgs += "-x"
}

if ($c) {
    $ytdlpArgs += "--cookies-from-browser"
    $ytdlpArgs += $c
}

# Create a counter for progress
$counter = 0

# Process each link
foreach ($link in $links) {
    $counter++
    Write-Host ""
    Write-Host "[$counter/$($links.Count)] Downloading: $link" -ForegroundColor Yellow
    
    # Run yt-dlp with the configured arguments
    try {
        $allArgs = $ytdlpArgs + @($link)
        & "yt-dlp" $allArgs
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host "Successfully downloaded" -ForegroundColor Green
        } else {
            Write-Host "Failed to download (exit code: $LASTEXITCODE)" -ForegroundColor Red
        }
    }
    catch {
        Write-Host "Error occurred: $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "Download process completed!" -ForegroundColor Green
Write-Host "Files saved to: $desktopPath" -ForegroundColor Cyan
