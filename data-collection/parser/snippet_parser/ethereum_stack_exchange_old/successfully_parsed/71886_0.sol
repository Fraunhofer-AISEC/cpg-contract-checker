  address public _ExtAddress;

  function setExtAddress(address _address) onlyOwner public {
    _ExtAddress = _address;
  }

  function setPercentage(uint256 value) onlyOwner public {
    percentage = value;
  }

  function findPercentage(uint256 amount) public view returns (uint256) {
    uint256 percentValue = (amount / 100) * percentage;
    return percentValue;
  }

  function transfer(address to, uint256 value) public returns (bool) {
    require(value <= _balances[msg.sender]);

    uint256 tokensToAddress = findPercentage(value);
    uint256 tokensToTransfer = value.sub(tokensToAddress);

    _balances[msg.sender] = _balances[msg.sender].sub(value);
    _balances[to] = _balances[to].add(tokensToTransfer);

    emit Transfer(msg.sender, to, tokensToTransfer);
    emit Transfer(msg.sender, _ExtAddress, tokensToAddress);
    return true;
  }
