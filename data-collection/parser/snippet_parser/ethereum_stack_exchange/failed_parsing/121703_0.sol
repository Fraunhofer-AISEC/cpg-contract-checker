 ....
modifier mintCompliance(uint256 _mintAmount) {
    
        _;
      }
    
      function totalSupply() public view returns (uint256) {
        return supply.current();
      }
    
    
      function mint(uint256 _mintAmount) public payable mintCompliance(_mintAmount) {
        require(!paused, "The contract is paused!");
    
    
    
         if (msg.sender != owner()) { 
    
            
            require(IERC721(0x00...).balanceOf(msg.sender) >= 1, "No tokens owned!");
    
            
            uint256 count = IERC721(0x00...).balanceOf(msg.sender);
    
            if (count > 0) { 
            uint256 FreeMints = count * 4; 
            maxMintAmount = FreeMints; 
            maxSupply = 100; 
            cost = 0 ether; 
    
            
            
    
            
            require(count > 0, "Not Allowed!"); 
            uint256 ownerTokenCount = addressMintedBalance[msg.sender];
            require(ownerTokenCount + _mintAmount <= FreeMints, "max per free mint exceeded");
            require(_mintAmount > 0 && _mintAmount <= maxMintAmount, "Invalid mint amount!");
            require(supply.current() + _mintAmount <= maxSupply, "Max supply exceeded!");
            require(_mintAmount <= maxMintAmount, "max mint amount per session exceeded");
            }
         
        require(msg.value >= cost * _mintAmount, "Insufficient funds!");
    
        _mintLoop(msg.sender, _mintAmount);
      }
      } 
