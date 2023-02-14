pragma solidity ^0.4.19;

contract Info {
  

  function ageOf(uint256 _tokenId) public view returns (uint256 age) {
        return ages[_tokenId];
  }

  function ownersAddress(uint256 _tokenId) public view returns (address addr);
}
