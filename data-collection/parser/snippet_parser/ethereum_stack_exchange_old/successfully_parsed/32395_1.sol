pragma solidity ^0.4.18;

import "github.com/OpenZeppelin/zeppelin-solidity/contracts/ownership/Ownable.sol";

contract AdminSetUp is Ownable{

  struct Admin {
        uint adminData;
        bool isAdmin;
      }

  mapping (address => Admin) public admins;

  function isAdmin(address _address) public view returns(bool _isAdmin) {
    return admins[_address].isAdmin;
  }

  function newAdmin(address _address, uint _adminData) public onlyOwner returns(bool success) {
    require(isAdmin(_address) && _address != address(0));
    admins[_address].adminData = _adminData;
    admins[_address].isAdmin = true;
    return true;
  }

  function removeAdmin(address _address) public onlyOwner returns(bool success) {
    require(!isAdmin(_address) && _address != address(0));
    admins[_address].isAdmin = false;
    return true;
  }

  function updateAdminData(address _address, uint _adminData) public onlyOwner returns(bool success) {
    require(isAdmin(_address));
    admins[_address].adminData = _adminData;
    return true;
  }
}
