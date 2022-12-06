   
  function migrate(uint256[] calldata tokenIds) external whenNotPaused {
    for (uint i = 0; i < tokenIds.length; i++) {
      (address owner, bool inBarn) = _ownerOf(tokenIds[i]);
      require(owner == _msgSender(), "STOP! THIEF!");
      if (!inBarn) _attemptBurn(_msgSender(), tokenIds[i]);
      _mint(_msgSender(), tokenIds[i]); 
    }
  }
