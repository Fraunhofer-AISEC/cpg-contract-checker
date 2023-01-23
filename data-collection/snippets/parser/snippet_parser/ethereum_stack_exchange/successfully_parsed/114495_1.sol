contract StoreWithSecret {
    
    bytes32 private secretNumber; 

    constructor(uint256 num) {
        secretNumber = keccak256(abi.encode(num));
    }

    function isEqual(uint256 num) public view returns (bool) {
        return secretNumber == keccak256(abi.encode(num));
    }
}
