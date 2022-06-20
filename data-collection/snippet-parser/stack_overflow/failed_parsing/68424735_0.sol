CONTRACTS = {
    "CAKE": "0x0E09FaBB73Bd3Ade0a17ECC321fD13a19e81cE82",
}

PANCAKE_SWAP_FACTORY = "0xcA143Ce32Fe78f1f7019d7d551a6402fC5350c73"
PANCAKE_SWAP_ROUTER  = "0x10ED43C718714eb63d5aA57B78B54704E256024E"

WBNB_ADDRESS = "0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c"

hexadem_ ='0x00fb7f630766e6a796048ea87d01acd3068e8ff67d078148a3fa3f4a84f69bd5'
factory = PANCAKE_SWAP_FACTORY
abiEncoded_1 = encode_abi_packed(['address', 'address'], (CONTRACTS['CAKE'], WBNB_ADDRESS))
salt_ = pancakeswap.w3.solidityKeccak(['bytes'], ['0x' +abiEncoded_1.hex()])
abiEncoded_2 = encode_abi_packed([ 'address', 'bytes32'], ( factory, salt_))

resPair = pancakeswap.w3.solidityKeccak(['bytes','bytes'], ['0xff' + abiEncoded_2.hex(), hexadem_])[12:]

# resPair is the address for the pancakeswap CAKE/WBNB pair
print(resPair.hex())
print('0xA527a61703D82139F8a06Bc30097cC9CAA2df5A6')
print(resPair.hex() == '0xA527a61703D82139F8a06Bc30097cC9CAA2df5A6')
print()
