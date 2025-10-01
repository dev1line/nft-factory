import { ScaffoldPlugin } from 'blueprint-scaffold';

// Set TON Connect manifest URL for deployment scripts
process.env.TONCONNECT_MANIFEST_URL =
    process.env.TONCONNECT_MANIFEST_URL || 'https://dev1line.github.io/nft-factory/tonconnect-manifest.json';

export const config = {
    plugins: [new ScaffoldPlugin()],
    // network: {
    //     mainnet: {
    //         url: 'https://mainnet.toncenter.com/api/v2/jsonRPC',
    //         apiKey: process.env.TONCENTER_API_KEY_MAINNET,
    //     },
    //     testnet: {
    //         url: 'https://testnet.toncenter.com/api/v2/jsonRPC',
    //         apiKey: process.env.TONCENTER_API_KEY_TESTNET,
    //     },
    // },
};
