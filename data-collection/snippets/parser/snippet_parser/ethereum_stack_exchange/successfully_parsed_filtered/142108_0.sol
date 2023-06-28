

pragma solidity ^0.8.7;

import "./User.sol";

contract SuperAdmin {
  address[] public users;

  constructor() {}

  modifier restricted() {
    if (msg.sender == address(this)) _;
  }

  function addNewUser(address adminAddress) public restricted returns(address) {
    address newUser = User(adminAddress).getAddress();
    users.push(newUser);
    return newUser;
  }
}
