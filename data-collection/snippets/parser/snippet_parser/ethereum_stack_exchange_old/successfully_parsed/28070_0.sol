function finalizePresale() external onlyOwner {
    require (!isFinalized); 
    isFinalized = true;                          
    token.transferOwnership(owner);                            
  } 
