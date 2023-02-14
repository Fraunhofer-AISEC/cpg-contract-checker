pragma solidity ^0.5.6;

contract SimpleBank {
 uint256 storedData;
 function set(uint256 data) public{
  storedData = data;
 }
function get() public view returns (uint256){
    return storedData;
  }
}
