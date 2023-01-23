string DOMAIN_TYPEHASH = keccak256("EIP712Domain(string name,uint256 chainId,address verifyingContract)");
abi.encode(DOMAIN_TYPEHASH, keccak256(bytes(name)), getChainId(), address(this))
