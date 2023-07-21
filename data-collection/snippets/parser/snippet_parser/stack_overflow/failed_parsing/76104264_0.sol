function _hash(string memory name) internal view returns (bytes32) {
    return
        _hashTypedDataV4(
            keccak256(
                abi.encode(
                    keccak256("Web3Struct(string name)"),
                    keccak256(bytes(name))
                )
            )
        );
}

__EIP712_init(SIGNING_DOMAIN, SIGNATURE_VERSION);

