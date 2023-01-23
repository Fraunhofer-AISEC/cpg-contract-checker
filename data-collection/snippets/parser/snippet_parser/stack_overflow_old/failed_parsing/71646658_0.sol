function askForSecretCode(uint time) external payable returns (bytes32) {
    require(msg.value == 42, 'Need to pay 42 wei.');
    secretCodes[secretCodesNum] = keccak256(abi.encodePacked(msg.sender, time);
    return keccak256(abi.encodePacked(msg.sender, time);
}
