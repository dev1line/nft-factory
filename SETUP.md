# TON NFT DApp - Setup Guide

## Quick Start

### Prerequisites

-   Node.js (v18 or higher)
-   Yarn package manager

### Installation

1. Clone the repository:

```bash
git clone <your-repo-url>
cd ton-nft-dapp
```

2. Run the setup script:

```bash
chmod +x setup.sh
./setup.sh
```

Or manually install:

```bash
yarn install
```

The `postinstall` script will automatically apply the Blueprint patches.

## TON Connect Configuration

### Default Manifest URL

This project is configured to use a custom TON Connect manifest URL:

```
https://dev1line.github.io/nft-factory/tonconnect-manifest.json
```

### Customizing the Manifest URL

#### Method 1: Environment Variable

Set the `TONCONNECT_MANIFEST_URL` before running scripts:

```bash
# On macOS/Linux
export TONCONNECT_MANIFEST_URL=https://your-custom-url.com/manifest.json
yarn run start

# Or inline
TONCONNECT_MANIFEST_URL=https://your-custom-url.com/manifest.json yarn run start
```

```powershell
# On Windows (PowerShell)
$env:TONCONNECT_MANIFEST_URL="https://your-custom-url.com/manifest.json"
yarn run start
```

#### Method 2: Update package.json

Edit the `start` script in `package.json`:

```json
{
    "scripts": {
        "start": "TONCONNECT_MANIFEST_URL=https://your-url.com/manifest.json blueprint run"
    }
}
```

#### Method 3: Update Blueprint Config

Edit `blueprint.config.ts`:

```typescript
process.env.TONCONNECT_MANIFEST_URL = 'https://your-url.com/manifest.json';
```

## How It Works

This project uses `patch-package` to modify the `@ton/blueprint` package's TON Connect provider. The patch allows using a custom manifest URL instead of the hardcoded default.

### Patch Details

-   **Patch file**: `patches/@ton+blueprint+0.16.0.patch`
-   **Modified file**: `node_modules/@ton/blueprint/dist/network/send/TonConnectProvider.js`
-   **Change**: Replaced hardcoded manifest URL with environment variable support

### When Dependencies Change

If you update `@ton/blueprint` or run `yarn install` on a fresh clone, the patch will be automatically applied via the `postinstall` script.

## Running Scripts

### Build contracts:

```bash
yarn build
```

### Run deployment scripts:

```bash
yarn run start
```

### Run tests:

```bash
yarn test
```

## Troubleshooting

### Patch not applied

If the patch isn't working, manually apply it:

```bash
yarn patch-package @ton/blueprint
```

### Wrong manifest URL showing

1. Check environment variable:

```bash
echo $TONCONNECT_MANIFEST_URL
```

2. Verify patch is applied:

```bash
cat node_modules/@ton/blueprint/dist/network/send/TonConnectProvider.js | grep manifestUrl
```

Should show:

```javascript
manifestUrl: process.env.TONCONNECT_MANIFEST_URL || 'https://dev1line.github.io/nft-factory/tonconnect-manifest.json',
```

### Reinstalling dependencies

If you need to completely reinstall:

```bash
# Remove node_modules and lockfiles
rm -rf node_modules yarn.lock package-lock.json

# Reinstall
yarn install
```

The patch will be automatically reapplied.

## For Contributors

### Creating/Updating Patches

If you need to modify the Blueprint package:

1. Make changes to files in `node_modules/@ton/blueprint/`
2. Run:

```bash
yarn patch-package @ton/blueprint
```

3. Commit the updated patch file in `patches/` directory

## Additional Resources

-   [Blueprint Documentation](https://github.com/ton-org/blueprint)
-   [TON Connect Documentation](https://docs.ton.org/develop/dapps/ton-connect/overview)
-   [patch-package Documentation](https://github.com/ds300/patch-package)
