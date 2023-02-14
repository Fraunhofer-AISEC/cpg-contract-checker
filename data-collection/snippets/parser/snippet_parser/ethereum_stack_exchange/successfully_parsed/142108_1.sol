

pragma solidity ^0.8.7;


contract User {
  address private partner;
  address private admin;

  constructor(address _admin) {
    partner = msg.sender;
    admin = _admin;
  }

  modifier restricted() {
    if (msg.sender == address(this)) _;
  }

  function getAddress() external view returns(address){
      return address(this);
  }

  function interact() restricted view{
    
  }
}
