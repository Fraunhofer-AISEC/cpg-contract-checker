function addPerson (string _name, uint _funds) public {
   Person memory newPerson = Person(_name, _funds);
   people[msg.sender] = newPerson;
   getAddressFromName[_name] = msg.sender;
}

function getPersonByName(string _name) public view returns(address){
    return getAddressFromName[_name];
}
