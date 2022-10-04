    mapping (address => uint) favoriteNumber;

function setMyNumber(uint _myNumber) public {
  
  favoriteNumber[msg.sender] = _myNumber;
  
}

function whatIsMyNumber() public view returns (uint) {
  
  
  return favoriteNumber[msg.sender];
}
