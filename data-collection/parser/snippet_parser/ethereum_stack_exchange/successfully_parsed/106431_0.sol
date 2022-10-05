contract MappingsC {
    mapping(string => uint) public person;
    
    function addPerson() external {
        person["Jhon"] = 34;
        person["Doe"] = 11;
    }
    
    function getPersonAge(string calldata name) view external returns(uint) {
        return person[name];
    }
    
    function getAllPerson()  view external returns(uint[] memory) {
        uint[] memory entries = new uint[](2);
        for (uint i = 0; i < 2; i++) {
            entries[i] = person[i];
        }
    }
    
}
