function getMaxSupply() view public returns(uint256){
  if(whitelistFinished){
    return maxSupply;
  }
    return whitelistMaxSupply;
}

function finishWhitelist() public{
   whitelistFinished = true;
}


