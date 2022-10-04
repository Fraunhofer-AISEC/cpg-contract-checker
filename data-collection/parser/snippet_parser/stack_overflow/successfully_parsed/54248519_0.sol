pragma solidity >=0.4.21 <0.6.0;

import './MyToken.sol';

contract SimpleStorage {

  
  MyToken public myToken;
  uint256 public tokenId;

  constructor (MyToken _myToken) public {
    myToken = _myToken;
    tokenId=0;
  }

  function buyOneToken() public payable {
    myToken.addMinter(msg.sender);
    require(myToken.mint(msg.sender, tokenId));
    tokenId++;
  }
}
