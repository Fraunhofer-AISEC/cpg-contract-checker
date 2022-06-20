

pragma solidity >=0.6.0 <0.8.0;

import "./ezeynftFactory.sol";

contract ezeNFT {
    uint256 public tokenCounter;
     constructor(){
    tokenCounter = 201;
}

  function _mintNewNFT( string memory name, string memory symbol, string memory tokenUri)public{
     uint256 newTokenId = tokenCounter;
     ezeynftFactory nfts = new ezeynftFactory(name,symbol,tokenUri,newTokenId);
     tokenCounter += 1;
  }
 }