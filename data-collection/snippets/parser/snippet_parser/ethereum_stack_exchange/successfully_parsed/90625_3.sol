function verifySig(address owner, uint256 aCustomId, bytes32 r, bytes32 s, uint8 v) public view {
bytes memory prefix = "\x19Ethereum Signed Message:\n32";
bytes32 hash = keccak256(abi.encodePacked(address(this), aCustomId));
bytes32 prefixedHash = keccak256(abi.encodePacked(prefix, hash));
require(ecrecover(prefixedHash, v, r, s) == owner);
}
