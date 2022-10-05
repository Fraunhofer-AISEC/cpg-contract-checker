contract StatelessUserRegisty {

    Storage dataStore;

    constructor() public {
        dataStore = new Storage();
    }

    function userKey(address userAddr) public pure returns(bytes32 userID) {
        return keccak256(abi.encodePacked(userAddr));
    }

    function isUser(address userAddr) public view returns(bool isIndeed) {
        return dataStore.getBool(userKey(userAddr));
    }

    function createUser(address userAddr) public returns(bool success) {
        require(!isUser(userAddr));
        dataStore.setBool(userKey(userAddr),true);
        return true;
    }

    function updateUserPoints(address userAddr, uint userPoints) public returns(bool success) {
        require(!isUser(userAddr));
        dataStore.setUint(userKey(userAddr),userPoints);
        return true;
    }

}
