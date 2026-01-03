#!/bin/bash

# Test script for termux-url-opener
# This script tests various URL patterns to ensure proper detection

echo "╔════════════════════════════════════════╗"
echo "║   Termux URL Opener - Test Suite      ║"
echo "╚════════════════════════════════════════╝"
echo ""

TEST_SCRIPT="./termux-url-opener"

if [ ! -f "$TEST_SCRIPT" ]; then
    echo "❌ Error: termux-url-opener script not found!"
    exit 1
fi

# Counter for tests
TOTAL=0
PASSED=0

# Test function
test_url() {
    local description="$1"
    local url="$2"
    local expected_pattern="$3"
    
    TOTAL=$((TOTAL + 1))
    echo "Test $TOTAL: $description"
    echo "  URL: $url"
    
    # Only capture the first few lines to avoid hanging on actual downloads
    OUTPUT=$(timeout 2 bash "$TEST_SCRIPT" "$url" 2>&1 | head -3)
    
    if echo "$OUTPUT" | grep -q "$expected_pattern"; then
        echo "  ✅ PASSED - Detected: $expected_pattern"
        PASSED=$((PASSED + 1))
    else
        echo "  ❌ FAILED - Expected to find: $expected_pattern"
        echo "  Output: $OUTPUT"
    fi
    echo ""
}

# Run tests
echo "Testing URL Pattern Detection..."
echo ""

test_url "YouTube video" \
    "https://www.youtube.com/watch?v=dQw4w9WgXcQ" \
    "YouTube video detected"

test_url "YouTube short URL" \
    "https://youtu.be/dQw4w9WgXcQ" \
    "YouTube video detected"

test_url "YouTube shorts" \
    "https://www.youtube.com/shorts/abc123" \
    "YouTube video detected"

test_url "GitHub repository" \
    "https://github.com/username/repo" \
    "Git repository detected"

test_url "GitLab repository" \
    "https://gitlab.com/username/repo" \
    "Git repository detected"

test_url "Image - JPG" \
    "https://example.com/image.jpg" \
    "Image detected"

test_url "Image - PNG" \
    "https://example.com/photo.png" \
    "Image detected"

test_url "Magnet link" \
    "magnet:?xt=urn:btih:abc123" \
    "Torrent/Magnet link detected"

test_url "Torrent file" \
    "https://example.com/file.torrent" \
    "Torrent/Magnet link detected"

test_url "PDF file" \
    "https://example.com/document.pdf" \
    "PDF file detected"

test_url "ZIP archive" \
    "https://example.com/archive.zip" \
    "Archive file detected"

test_url "TAR.GZ archive" \
    "https://example.com/archive.tar.gz" \
    "Archive file detected"

test_url "Twitter URL" \
    "https://twitter.com/user/status/123" \
    "Social media link detected"

test_url "Reddit URL" \
    "https://www.reddit.com/r/programming" \
    "Social media link detected"

test_url "Generic HTTPS URL" \
    "https://example.com/page" \
    "Generic URL detected"

test_url "No URL provided" \
    "" \
    "Error: No URL provided"

# Summary
echo "═══════════════════════════════════════"
echo "Test Results: $PASSED/$TOTAL passed"
echo "═══════════════════════════════════════"

if [ $PASSED -eq $TOTAL ]; then
    echo "✅ All tests passed!"
    exit 0
else
    echo "❌ Some tests failed"
    exit 1
fi
