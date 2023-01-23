function compareMyStrings(string memory a) public view returns (bool) {
    return (keccak256(abi.encodePacked((a))) == 'mySecretCodeString');
}
