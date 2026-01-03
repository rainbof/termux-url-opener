#!/data/data/com.termux/files/usr/bin/bash

# Installation script for Termux URL Opener

echo "╔════════════════════════════════════════╗"
echo "║   Termux URL Opener - Installation    ║"
echo "╚════════════════════════════════════════╝"
echo ""

# Check if running in Termux
if [ ! -d "/data/data/com.termux" ]; then
    echo "❌ Error: This script must be run in Termux!"
    exit 1
fi

echo "📋 Creating necessary directories..."
mkdir -p ~/.termux/bin || { echo "❌ Failed to create ~/.termux/bin"; exit 1; }
mkdir -p ~/repositories || { echo "❌ Failed to create ~/repositories"; exit 1; }
mkdir -p ~/storage/downloads 2>/dev/null || true
mkdir -p ~/storage/pictures 2>/dev/null || true

echo "📦 Copying termux-url-opener script..."
if [ -f "termux-url-opener" ]; then
    cp termux-url-opener ~/.termux/bin/termux-url-opener
    chmod +x ~/.termux/bin/termux-url-opener
    echo "✅ Script installed successfully!"
else
    echo "❌ Error: termux-url-opener script not found!"
    echo "Please run this script from the repository directory."
    exit 1
fi

echo ""
echo "🔧 Checking for storage access..."
if [ ! -d "$HOME/storage" ]; then
    echo "⚠️  Storage access not configured."
    echo "Run: termux-setup-storage"
    echo "Then restart this installation."
else
    echo "✅ Storage access configured"
fi

echo ""
echo "📦 Checking core dependencies..."

# Check for essential tools
if ! command -v wget &> /dev/null; then
    echo "Installing wget..."
    pkg install -y wget
fi

if ! command -v curl &> /dev/null; then
    echo "Installing curl..."
    pkg install -y curl
fi

echo "✅ Core dependencies installed"

echo ""
echo "📦 Optional dependencies (recommended):"
echo ""
echo "For YouTube downloads:"
echo "  pkg install yt-dlp"
echo ""
echo "For Git repositories:"
echo "  pkg install git"
echo ""
echo "For torrent downloads:"
echo "  pkg install aria2"
echo ""
echo "For archive extraction:"
echo "  pkg install unzip p7zip"
echo ""
echo "For notifications and dialogs (requires Termux:API app):"
echo "  pkg install termux-api"
echo ""

read -p "Install all optional dependencies now? (y/n): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing optional packages..."
    pkg install -y yt-dlp git aria2 unzip p7zip termux-api
    echo "✅ Optional dependencies installed"
fi

echo ""
echo "🔄 Reloading Termux settings..."
termux-reload-settings 2>/dev/null || echo "⚠️  Please restart Termux manually"

echo ""
echo "╔════════════════════════════════════════╗"
echo "║        Installation Complete! 🎉       ║"
echo "╚════════════════════════════════════════╝"
echo ""
echo "Next steps:"
echo "1. Restart Termux app completely"
echo "2. Share any URL to Termux to test"
echo "3. The script will automatically handle the URL"
echo ""
echo "For manual usage:"
echo "  termux-url-opener <URL>"
echo ""
echo "Enjoy your smart URL handler! 🚀"
