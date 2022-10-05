pragma solidity ^0.4.17;

contract SimpleStorage {
  mapping(address => uint256) public favoriteNumbers;

  function setFavorite(uint x) public {
    favoriteNumbers[msg.sender] = x;
  }
}
