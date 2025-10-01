#!/bin/bash

# Setup script for TON NFT DApp
# This script will install dependencies and apply necessary patches

echo "🚀 Setting up TON NFT DApp..."

# Check if yarn is installed
if ! command -v yarn &> /dev/null; then
    echo "❌ Yarn is not installed. Please install Yarn first."
    echo "Visit: https://yarnpkg.com/getting-started/install"
    exit 1
fi

echo "📦 Installing dependencies..."
yarn install

echo "✅ Setup completed successfully!"
echo ""
echo "📝 Note: The TON Connect manifest URL has been configured to:"
echo "   https://dev1line.github.io/nft-factory/tonconnect-manifest.json"
echo ""
echo "🔧 You can override this by setting the TONCONNECT_MANIFEST_URL environment variable:"
echo "   export TONCONNECT_MANIFEST_URL=your-custom-url"
echo ""
echo "🎯 To run deployment scripts:"
echo "   yarn run start"
echo ""

