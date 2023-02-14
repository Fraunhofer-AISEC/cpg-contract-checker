contract StorageFactory {
    SimpleStorage[] public storages;

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        storages.push(simpleStorage);
    }

    function addPersonAt(uint256 index, string memory name, int age) public {
        SimpleStorage(address(storages[index])).addPerson(name, age);
    }

    function getPersonFrom(uint256 index, string memory name) public view returns(SimpleStorage.Person memory ret) {
        ret = SimpleStorage(address(storages[index])).getPerson(name);
    }
}
