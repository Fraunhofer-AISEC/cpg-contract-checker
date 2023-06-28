function whitelistMint(
    uint256 amount,
    bytes32[] calldata merkleProof
  ) public payable nonReentrant {
    address sender = _msgSender();

    require(isActive, "Whitelist sale is not open");
    require(_verify(merkleProof, sender, maxWhitelistMint), "You are not whitelisted");
    require(amount <= maxWhitelistMint - _alreadyMinted[sender], "Insufficient mints left");
    require(msg.value == mintPrice * amount, "Incorrect payable amount");

    _alreadyMinted[sender] += amount;
    _internalMint(sender, amount);
  }

  function ownerMint(address to, uint256 amount) public onlyOwner {
    _internalMint(to, amount);
  }
