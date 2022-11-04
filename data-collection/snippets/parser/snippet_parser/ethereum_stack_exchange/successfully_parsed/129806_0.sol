function mintreward(uint256 tokenId,string memory link) public  {
        require(block.timestamp>=rewardInterval ,"Tokens are only available after correct time period has elapsed");
        MyNFT obj = MyNFT(_MyNFTContractAddress);
        require(stakes[msg.sender] >= minimumStakes, "You Dont have enough balances");
        require(!isMinted[msg.sender], "You claimed your NFT already");
        isMinted[msg.sender] = true;
        obj.safeMint(msg.sender,tokenId,link);   
        
    }
