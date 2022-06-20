contract StoreWithSecret {
    
    uint256 private secretNumber; 

    constructor(uint256 num) {
        secretNumber = num;
    }

    function isEqual(uint256 num) public view returns (bool) {
        return secretNumber == num;
    }
}
