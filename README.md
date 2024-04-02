# Foundry DeFi Stablecoin

This is a section of the Cyfrin Foundry Solidity Course. I have also added a simple manual proof-of-concept for a Proxy.

# About

Simple proof of concepts for using proxies.

# Getting Started

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

## Quickstart

```
git clone https://github.com/Welith/foundry-proxy.git
cd foundry-proxy
forge build
```


# Usage

## Start a local node

```
make anvil
```

## Deploy

This will default to your local node. You need to have it running in another terminal in order for it to deploy.

```
make deploy-proxy // this will deploy the proxy
```

```
make deploy-implA // deploying the implementation A
```

```
make deploy-implB // this will deploy implementation B
```

## Deploy - Other Network

[See below](#deployment-to-a-testnet-or-mainnet)

## Testing

```
forge test
```

### Test Coverage

```
forge coverage
```

and for coverage based testing:

```
forge coverage --report debug
```

# Deployment to a testnet or mainnet

1. Setup environment variables

You'll want to set your `SEPOLIA_RPC_URL` as environment variable. You can add them to a `.env` file, similar to what you see in `.env.example`.

- ` --account METAMASK_SEPOLIA`: This is a foundry wallet account.

- `SEPOLIA_RPC_URL`: This is url of the sepolia testnet node you're working with. You can get setup with one for free from [Alchemy](https://alchemy.com/?a=673c802981)

Optionally, add your `ETHERSCAN_API_KEY` if you want to verify your contract on [Etherscan](https://etherscan.io/).

1. Get testnet ETH

Head over to [faucets.chain.link](https://faucets.chain.link/) and get some testnet ETH. You should see the ETH show up in your metamask.

2. Deploy

```
make deploy ARGS="--network sepolia"
```

## Scripts

Instead of scripts, we can directly use the `cast` command to interact with the contract. First deploy the proxy, then implementation A and B. You will then set implementation B to be ran through A.

```bash
cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "setImplementation(address)" "0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512" --rpc-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 -- --broadcast
```

```bash
cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "getDataToTransact(uint256)" "777" --rpc-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 -- --broadcast
```

```bash
cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 0x552410770000000000000000000000000000000000000000000000000000000000000309 --rpc-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 -- --broadcast
```

```bash
cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "readStorage()(uint256)" --rpc-url http://localhost:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 -- --broadcast
```

The last call will return the number as seen through implementation A but called from B.

## Estimate gas

You can estimate how much gas things cost by running:

```
forge snapshot
```

And you'll see an output file called `.gas-snapshot`

# Formatting

To run code formatting:

```
forge fmt
```

# Thank you!
