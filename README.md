# Media Content Downloader

A PowerShell script to download media content from various platforms using yt-dlp. This tool reads URLs from a text file and downloads them to your Desktop.

## Features

- Batch download multiple media files from supported platforms
- Downloads directly to your Desktop
- Progress tracking with colored output
- Error handling and validation
- Cross-platform support (Windows, macOS, Linux)
- Supports all yt-dlp compatible platforms (Instagram, TikTok, YouTube, Twitter, etc.)

## Prerequisites

- [yt-dlp](https://github.com/yt-dlp/yt-dlp) - A youtube-dl fork with additional features
- PowerShell (Windows) or PowerShell Core (macOS/Linux)

### Installing PowerShell on Linux

```bash
# Ubuntu/Debian
sudo apt update
sudo apt install -y wget apt-transport-https software-properties-common
wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt update
sudo apt install -y powershell

# CentOS/RHEL/Fedora
sudo dnf install -y powershell

# Arch Linux
yay -S powershell-bin

# Or use snap (universal)
sudo snap install powershell --classic
```

### Installing yt-dlp

#### Windows
```powershell
# Using winget
winget install yt-dlp

# Using chocolatey
choco install yt-dlp

# Using pip
pip install yt-dlp
```

#### macOS
```bash
# Using Homebrew
brew install yt-dlp

# Using pip
pip install yt-dlp
```

#### Linux
```bash
# Using pip
pip install yt-dlp

# Or download binary from releases
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
```

## Installation

1. Clone this repository:
```bash
git clone https://github.com/silrenan/0xbitdrain.git
cd 0xbitdrain
```

2. Ensure yt-dlp is installed and available in your PATH

## Usage

1. Create an `input.txt` file in the same directory as the script (see `input.example` for the correct format)
2. Add media URLs to the file, one per line:
   ```
   https://www.instagram.com/reel/example1/
   https://www.tiktok.com/@user/video/example2
   https://www.youtube.com/watch?v=example3
   ```
3. Run the script:
   ```powershell
   # Show help
   .\download_media.ps1 -h
   
   # Basic usage (download video/audio)
   .\download_media.ps1
   
   # Extract audio only
   .\download_media.ps1 -x
   
   # Use browser cookies (for private/restricted content)
   .\download_media.ps1 -c chrome
   .\download_media.ps1 -c firefox
   .\download_media.ps1 -c edge
   
   # Combine options (extract audio with cookies)
   .\download_media.ps1 -x -c chrome
   
   # Linux/macOS
   pwsh ./download_media.ps1 -x -c firefox
   ```

## Command Line Options

### Audio Extraction (`-x`)
Use the `-x` flag to extract audio only:
```powershell
.\download_media.ps1 -x
```
This passes the `-x` flag to yt-dlp, which extracts the best quality audio from the media.

### Browser Cookies (`-c`)
Use the `-c` parameter to pass cookies from your browser:
```powershell
.\download_media.ps1 -c chrome     # Use Chrome cookies
.\download_media.ps1 -c firefox    # Use Firefox cookies
.\download_media.ps1 -c edge       # Use Edge cookies
```

This is useful for:
- Private or restricted content that requires login
- Content that's only available in certain regions
- Bypassing some download restrictions

**Supported browsers:** chrome, firefox, edge, safari, opera, and more (any browser supported by yt-dlp)

### Input File Format

The `input.txt` file should contain:
- One media URL per line
- URLs should be complete (starting with https://)
- Empty lines are ignored
- Comments (lines starting with #) are ignored
- Supports all yt-dlp compatible platforms

**Note:** The script looks for a file named `input.txt` - see `input.example` for the correct format.

Example `input.txt`:
```
# Instagram reels
https://www.instagram.com/reel/CxXxXxXxXxX/
https://www.instagram.com/reel/CyYyYyYyYyY/

# TikTok videos
https://www.tiktok.com/@user/video/1234567890

# YouTube videos/shorts
https://www.youtube.com/watch?v=dQw4w9WgXcQ
https://www.youtube.com/shorts/abc123

# Twitter videos
https://twitter.com/user/status/1234567890
```

## Output

- Downloaded files are saved to your Desktop
- Files are named using the format: `{title}.{extension}`
- Progress is displayed in the console with colored output
- Success/failure status is shown for each download

## Error Handling

The script includes comprehensive error handling:
- Checks if `input.txt` exists
- Verifies yt-dlp is installed and accessible
- Handles download failures gracefully
- Provides clear error messages with color coding

## Troubleshooting

### Common Issues

1. **"yt-dlp not found in PATH"**
   - Ensure yt-dlp is properly installed
   - Restart your terminal/PowerShell session
   - Check if yt-dlp is in your system PATH

2. **"input.txt not found"**
   - Ensure the file exists in the same directory as the script
   - Check file name spelling and extension

3. **Download failures**
   - Verify the media URLs are correct and accessible
   - Check your internet connection
   - Some content may be restricted or private

### Getting Help

If you encounter issues:
1. Check the [yt-dlp documentation](https://github.com/yt-dlp/yt-dlp)
2. Verify your URLs are valid and supported by yt-dlp
3. Ensure you have proper internet connectivity

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Setup

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the Unlicense - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [yt-dlp](https://github.com/yt-dlp/yt-dlp) - The powerful download tool that makes this script possible
- All supported media platforms for providing content

## Disclaimer

This tool is for educational and personal use only. Please respect the Terms of Service of each platform and copyright laws. Only download content you have permission to download.
