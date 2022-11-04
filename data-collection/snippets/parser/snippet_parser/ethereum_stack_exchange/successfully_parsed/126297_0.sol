function mint(uint256 _mintAmount) public payable {
    require(!paused, "the contract is paused"); 
    uint256 supply = totalSupply();
    require(_mintAmount > 0, "need to mint at least 1 NFT");
    require(_mintAmount <= maxMintAmount, "max mint amount per session exceeded");
    require(supply + _mintAmount <= maxSupply, "max NFT limit exceeded");

    if (msg.sender != owner()) {            
        if(onlyWhitelisted == true) {         
            require(isWhitelisted(msg.sender), "user is not whitelisted");
            uint256 ownerMintedCount = addressMintedBalance[msg.sender];
            require(ownerMintedCount + _mintAmount <= nftPerAddressLimit, "max NFT per address exceeded");
        }

        if(_mintAmount==1&&balancesGoldenTicket[msg.sender]>=1&&freeMint[msg.sender]==0){
            freeMint[msg.sender]+=1;
        }else{
             
             require(msg.value >= cost * _mintAmount, "insufficient funds");
        }
    }
    
    for (uint256 i = 1; i <= _mintAmount; i++) {
        addressMintedBalance[msg.sender]++;
      _safeMint(msg.sender, supply + i);
    }
  }
