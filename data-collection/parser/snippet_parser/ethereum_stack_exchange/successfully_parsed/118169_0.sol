function assembleToken() public {
        otherTokens.burn(msg.sender, assemblePrice);
        uint256 id = maxTokens + newTokensAssembled + 1;
        _mint(msg.sender, id);
    newTokensAssembled += 1;
  }
