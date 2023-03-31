#!/usr/bin/env bash

rm -rf smart-contract-sanctuary-ethereum

git clone https://github.com/tintinweb/smart-contract-sanctuary-ethereum.git

rm smart-contract-sanctuary-ethereum/README.md
rm -rf smart-contract-sanctuary-ethereum/.git
rm -rf smart-contract-sanctuary-ethereum/docs
rm -rf smart-contract-sanctuary-ethereum/utils
rm smart-contract-sanctuary-ethereum/contracts/function_signatures.json
rm -rf smart-contract-sanctuary-ethereum/contracts/goerli
rm -rf smart-contract-sanctuary-ethereum/contracts/kovan
rm -rf smart-contract-sanctuary-ethereum/contracts/rinkeby
rm -rf smart-contract-sanctuary-ethereum/contracts/ropsten
rm smart-contract-sanctuary-ethereum/contracts/mainnet/contracts.json
