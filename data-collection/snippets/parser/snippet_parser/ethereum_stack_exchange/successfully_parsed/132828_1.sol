  function mint(uint256 _mintAmount) public payable mintCompliance(_mintAmount){
    if(msg.sender != owner()){
      require(!paused, 'The contract is paused!');
      require(_freeWalletMints[_msgSender()] + _mintAmount <= 2, 'You have already minted');
      
      _freeWalletMints[_msgSender()] += _mintAmount;
      if (totalSupply()+_mintAmount > maxFreeMint){
          require(msg.value >= cost * _mintAmount, "Insufficient funds!");
        }
      }
      _safeMint(_msgSender(), _mintAmount);
    }
