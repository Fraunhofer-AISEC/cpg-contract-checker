function sfGetPerson(uint256 contractAddressIndex) public view returns (SimpleStorage.People[] memory){
        SimpleStorage simpleStorage = simpleStorageArray[contractAddressIndex];
        return simpleStorage.getPerson();
}
