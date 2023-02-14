pragma solidity ^0.6.7;

import "./S5Implement.sol";

  contract newToken is S5Implement {

      uint256 private price = 1 ether;

      mapping (uint256 => uint256) private priceMapping;

      function getPrice(uint256 _tokenId) public returns(uint256) {

           price = priceMapping[_tokenId];

      }
  }
