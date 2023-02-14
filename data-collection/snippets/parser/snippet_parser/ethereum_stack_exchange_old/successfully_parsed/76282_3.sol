function registerDriver(string memory _name, uint _phno, uint _licenceno) public{
  driverStructs[msg.sender] = Driver(_name, _phno, _licenceno, isDriverRegistered, cartypes[x], index);
}
