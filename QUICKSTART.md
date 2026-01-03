# Quick Start Guide

## Installation (One-liner)

```bash
curl -fsSL https://raw.githubusercontent.com/rainbof/termux-url-opener/main/install.sh | bash
```

Or with git:

```bash
git clone https://github.com/rainbof/termux-url-opener.git
cd termux-url-opener
bash install.sh
```

## First Time Setup

1. **Setup storage** (if not already done):
   ```bash
   termux-setup-storage
   ```

2. **Install core tools**:
   ```bash
   pkg update
   pkg install wget curl
   ```

3. **Restart Termux** completely (swipe away from recent apps)

## Usage

Simply share any URL to Termux and it will automatically:
- 🎥 Download YouTube videos with quality selection
- 📦 Clone Git repositories
- 🖼️ Download images
- 📄 Download PDFs
- 🗜️ Download and extract archives
- 🌐 Open social media in browser
- And more!

## Examples

### YouTube Download
1. Open YouTube app
2. Tap Share → Termux
3. Select quality when prompted
4. Video downloads to `~/storage/downloads/`

### Git Clone
1. Share a GitHub repository URL to Termux
2. Repository clones to `~/repositories/`

### Image Download
1. Share an image URL to Termux
2. Image saves to `~/storage/pictures/`
3. Opens automatically in gallery

## Optional Enhancements

Install these for full functionality:

```bash
# YouTube downloads
pkg install yt-dlp

# Git repositories
pkg install git

# Torrents
pkg install aria2

# Archives
pkg install unzip p7zip

# Notifications (requires Termux:API app from F-Droid)
pkg install termux-api
```

## Troubleshooting

**Not working?**
1. Verify installation: `ls -l ~/.termux/bin/termux-url-opener`
2. Run: `termux-reload-settings`
3. Restart Termux app completely

**Storage errors?**
```bash
termux-setup-storage
```
Grant storage permission when prompted.

## More Info

See [README.md](README.md) for complete documentation.
