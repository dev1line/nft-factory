import { ScaffoldPlugin } from 'blueprint-scaffold';

// Set TON Connect manifest URL for deployment scripts
process.env.TONCONNECT_MANIFEST_URL = process.env.TONCONNECT_MANIFEST_URL || 'https://dev1line.github.io/nft-factory/tonconnect-manifest.json';

export const config = {
  plugins: [
    new ScaffoldPlugin(),
  ]
};