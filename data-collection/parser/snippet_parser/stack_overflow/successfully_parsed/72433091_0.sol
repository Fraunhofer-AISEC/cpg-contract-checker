 function sendGift(uint256 _mintAmount,address recipient) public payable {
    uint256 supply = totalSupply();
    require(!paused);
    require(_mintAmount > 0);
    require(_mintAmount <= maxMintAmount);
    require(supply + _mintAmount<= availableSupplyForSale);
    
    require(coinToken.allowance(msg.sender,address(this))>=cost * _mintAmount);
      coinToken.transferFrom(msg.sender, address(this),cost * _mintAmount);
    if(supply<currentSupply){
    for (uint256 i = 1; i <= _mintAmount; i++) {
      _safeMint(recipient, supply + i);
    }
    }
    else{
         uint256[] memory tokenIds = walletOfOwner(address(this));
         for(uint256 i=1;i<=_mintAmount;i++)
        transferFrom(address(this),recipient,tokenIds[i]);
    }
  }
