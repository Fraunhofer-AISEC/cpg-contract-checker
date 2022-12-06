function isAvailable(
    bytes memory signature, address _firmante
) internal view returns (bool whiteListed) {
    bytes32 result = keccak256(
        abi.encodePacked(msg.sender)
    );
    
    hash= ... 
    return isValidSignatureNow(_firmante, hash, signature);
}
