# Termux URL Opener - Smart URL Handler

A smart and intelligent URL handler for Termux that automatically detects and processes different types of URLs with appropriate actions.

## Features

🎥 **YouTube Support**: Download videos or audio with quality selection
- Supports videos, shorts, and playlists
- Audio-only download option (MP3)
- Quality selection (Best, 720p, 480p, 360p)

📦 **Git Repository Support**: Clone or update repositories
- GitHub, GitLab, and Bitbucket support
- Automatic pull for existing repositories

🖼️ **Image Downloads**: Download and optionally view images
- Supports JPG, PNG, GIF, WebP, BMP, SVG

🧲 **Torrent/Magnet Links**: Download torrents with aria2c

📄 **Document Support**: Download PDFs and other documents

🗜️ **Archive Handling**: Download and optionally extract archives
- ZIP, TAR, TAR.GZ, 7Z, RAR support

🌐 **Social Media**: Open links in browser or specialized apps

🔗 **Generic URLs**: Smart detection and appropriate handling

## Installation

### 1. Install Termux

Download Termux from [F-Droid](https://f-droid.org/en/packages/com.termux/) (recommended) or GitHub releases.

### 2. Setup Termux Storage

```bash
termux-setup-storage
```

Allow storage permissions when prompted.

### 3. Install Required Packages

```bash
pkg update && pkg upgrade
pkg install git wget curl
```

### 4. Install Optional Packages (for enhanced features)

```bash
# For YouTube downloads
pkg install yt-dlp

# For Git repositories
pkg install git

# For torrent downloads
pkg install aria2

# For archive extraction
pkg install unzip p7zip

# For notifications and dialogs
pkg install termux-api
```

Note: Install the [Termux:API app](https://f-droid.org/en/packages/com.termux.api/) from F-Droid for notifications and dialogs.

### 5. Install the URL Opener Script

```bash
# Clone this repository
git clone https://github.com/rainbof/termux-url-opener.git
cd termux-url-opener

# Create the bin directory if it doesn't exist
mkdir -p ~/.termux/bin

# Copy the script to the Termux bin directory
cp termux-url-opener ~/.termux/bin/

# Make it executable
chmod +x ~/.termux/bin/termux-url-opener

# Reload Termux settings
termux-reload-settings
```

Alternatively, you can manually download and install:

```bash
# Create the bin directory
mkdir -p ~/.termux/bin

# Download the script
curl -o ~/.termux/bin/termux-url-opener https://raw.githubusercontent.com/rainbof/termux-url-opener/main/termux-url-opener

# Make it executable
chmod +x ~/.termux/bin/termux-url-opener

# Reload Termux settings
termux-reload-settings
```

## Usage

Once installed, the script will automatically handle URLs shared to Termux:

1. Open any app with a URL (browser, social media, etc.)
2. Share the URL
3. Select "Termux" from the share menu
4. The script will automatically detect the URL type and handle it appropriately

### Manual Usage

You can also run the script manually:

```bash
termux-url-opener "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
```

## Supported URL Types

### YouTube
- `https://www.youtube.com/watch?v=...`
- `https://youtu.be/...`
- `https://www.youtube.com/shorts/...`
- `https://www.youtube.com/playlist?list=...`

**Action**: Downloads video with quality selection (if termux-api is installed) or best quality by default

### Git Repositories
- `https://github.com/username/repo`
- `https://gitlab.com/username/repo`
- `https://bitbucket.org/username/repo`
- Any URL ending with `.git`

**Action**: Clones to `~/repositories/` or pulls updates if already exists

### Images
- URLs ending with: `.jpg`, `.jpeg`, `.png`, `.gif`, `.webp`, `.bmp`, `.svg`

**Action**: Downloads to `~/storage/pictures/` and opens with default viewer

### Torrents
- `magnet:?xt=...`
- URLs ending with `.torrent`

**Action**: Downloads using aria2c to `~/storage/downloads/`

### Documents
- URLs ending with `.pdf`

**Action**: Downloads to `~/storage/downloads/` and opens with default viewer

### Archives
- URLs ending with: `.zip`, `.tar`, `.tar.gz`, `.tgz`, `.tar.bz2`, `.rar`, `.7z`

**Action**: Downloads to `~/storage/downloads/` with optional extraction

### Social Media
- Twitter/X, Instagram, Facebook, Reddit links

**Action**: Opens in browser or appropriate app

### Generic URLs
- Any other `http://` or `https://` URL

**Action**: Smart detection - downloads files or opens in browser

## Auto-Installation of Dependencies

The script automatically installs missing dependencies when needed. For example:
- If you share a YouTube URL and `yt-dlp` is not installed, it will be installed automatically
- If you share a Git repository and `git` is not installed, it will be installed automatically

## File Locations

- **Downloads**: `~/storage/downloads/`
- **Images**: `~/storage/pictures/`
- **Git Repositories**: `~/repositories/`

## Troubleshooting

### Script not working when sharing URLs

1. Make sure the script is in `~/.termux/bin/termux-url-opener`
2. Verify it's executable: `ls -l ~/.termux/bin/termux-url-opener`
3. Reload Termux: `termux-reload-settings`
4. Restart Termux app completely

### Notifications not showing

Install Termux:API:
```bash
pkg install termux-api
```

Also install the Termux:API app from F-Droid.

### Downloads failing

Check storage permissions:
```bash
termux-setup-storage
```

Make sure you granted storage access to Termux.

### Quality selection not working for YouTube

Install termux-api:
```bash
pkg install termux-api
```

And install the Termux:API app from F-Droid.

## Customization

You can customize the script by editing `~/.termux/bin/termux-url-opener`:

- Change download directories
- Modify default quality settings
- Add support for additional URL types
- Customize notifications

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

This project is open source and available under the MIT License.

## Credits

Created for the Termux community to make URL handling smarter and more convenient.

## Related Projects

- [Termux](https://termux.com/)
- [Termux:API](https://wiki.termux.com/wiki/Termux:API)
- [yt-dlp](https://github.com/yt-dlp/yt-dlp)

## Support

If you find this script useful, please star the repository! ⭐