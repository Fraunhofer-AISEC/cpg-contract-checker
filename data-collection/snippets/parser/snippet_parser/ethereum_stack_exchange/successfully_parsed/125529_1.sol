function hashSenderAddress() public view returns (bytes32) {
    return(keccak256(abi.encodePacked(msg.sender)));
}
