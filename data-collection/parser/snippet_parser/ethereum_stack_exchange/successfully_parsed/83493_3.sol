    function createToken(bytes32 name) public returns (OwnedToken tokenAddress) {
        return new OwnedToken(name);
    }
