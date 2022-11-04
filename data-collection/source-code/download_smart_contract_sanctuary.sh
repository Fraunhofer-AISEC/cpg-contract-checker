#!/usr/bin/env bash

wget https://github.com/tintinweb/smart-contract-sanctuary-ethereum/archive/a85d0d63d4fde843c91f43af2956bca59458080f.zip
unzip a85d0d63d4fde843c91f43af2956bca59458080f.zip "smart-contract-sanctuary-ethereum-a85d0d63d4fde843c91f43af2956bca59458080f/contracts/mainnet/*" -d "."
rm smart-contract-sanctuary-ethereum-a85d0d63d4fde843c91f43af2956bca59458080f/contracts/mainnet/contracts.json
rm a85d0d63d4fde843c91f43af2956bca59458080f.zip
mv smart-contract-sanctuary-ethereum-a85d0d63d4fde843c91f43af2956bca59458080f smart-contract-sanctuary-ethereum
