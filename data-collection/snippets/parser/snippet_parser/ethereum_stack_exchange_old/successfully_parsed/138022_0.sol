contract StorageFactory {

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function get(uint256 _position) public view returns(uint256) {
        return simpleStorageArray(_position);     
    }
}
