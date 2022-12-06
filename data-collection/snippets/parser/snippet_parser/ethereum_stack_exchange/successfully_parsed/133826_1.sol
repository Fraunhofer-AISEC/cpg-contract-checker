
contract Contract {
    function compareMyStrings(string memory a) public pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked(("mySecretCodeString"))));
    }
}
