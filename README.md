# TON NFT DAPP

New version of [ton_nft_dapp](https://github.com/gradoally/ton_nft_dapp) that can be used as a Scalable NFT Airdrop System with White & Black lists implemented. We consider it a strong foundation for the further development of NFT technology. It provides for deploying NFT Collection through The NFT Factory smart-contract with additional functionality of data-storage and processing with-in dictionaries. We are convinced that this technology is quite universal and is suitable for further development of the idea of decentralized tokenized applications. It reveals new possibilities for blockchain parsing from frontend and data processing on the side of NFT Collection and NFT Factory. This is a real next step in crypto and can be scaled to multiple decentralized apps, such as on-chain order books, factoring, lines of credit, events managing systems, [mysterious databases](https://github.com/gradoally/ton_nft_dapp), [freelance-exchanges](https://github.com/gradoally/a-careers-smc) and moreover! We are glad to open this code for community, pull/partnership/investment/relations requests are [welcome](http://t.me/sraibaby).

## How to use

### Quick Setup

```bash
git clone https://github.com/gradoally/ton-nft-dapp.git
cd ton-nft-dapp
./setup.sh
```

Or manually:

```bash
git clone https://github.com/gradoally/ton-nft-dapp.git
cd ton-nft-dapp
yarn install  # Automatically applies Blueprint patches
```

📖 **For detailed setup instructions, see [SETUP.md](./SETUP.md)**

### TON Connect Configuration

This project uses a custom TON Connect manifest URL:

```
https://dev1line.github.io/nft-factory/tonconnect-manifest.json
```

To use a different manifest URL:

```bash
TONCONNECT_MANIFEST_URL=https://your-url.com/manifest.json yarn run start
```

### Deploy through script:

```bash
yarn run start
# or
npx blueprint run
```

### Deploy through Scaffold:

```bash
cd dapp && yarn && yarn dev
```
