contract TokenFactory {
    event MyTokenCreated(address contractAddress);

    function createNewMyToken() public returns (address) {
        MyToken myToken = new MyToken(2000000);
        emit MyTokenCreated(address(myToken));
        return address(myToken);
    }
}