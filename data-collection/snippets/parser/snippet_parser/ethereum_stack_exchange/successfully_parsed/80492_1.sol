pragma solidity ^0.5.12;
contract sample {
 mapping(address => uint256[12]) fruits;
 function getfruit(address addr) public view returns (uint256[] storage fr) { 
  uint256[] memory veggies = new uint256[] (12);
  veggies = fruits[addr];
  return (veggies);
 }
}
