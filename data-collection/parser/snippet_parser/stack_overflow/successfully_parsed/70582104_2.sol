function updateStoragePerson(uint256 _index, string memory _name) public {
        PERSON storage newUpdatedPerson = personList[_index];
        newUpdatedPerson.name = _name;
}
