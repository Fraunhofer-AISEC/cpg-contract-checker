function canMint(address _address, bytes memory _signature) public view returns (bool, string memory) {
    if (!whitelist[_address]) {
        bytes32 hash = keccak256(abi.encodePacked(whitelistSigner, _address));
        bytes32 messageHash = hash.toEthSignedMessageHash();

        address signer = messageHash.recover(_signature);

        if (signer != whitelistSigner) {
            return (false, "Invalid signature");
        }
    }
}