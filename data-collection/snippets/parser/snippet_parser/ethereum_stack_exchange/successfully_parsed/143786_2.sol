function storeToArray(uint _index, uint _customerId, string memory _name) public { 
  ssfpArray[_index].addToPeopleArray(_customerId, _name); 
}
