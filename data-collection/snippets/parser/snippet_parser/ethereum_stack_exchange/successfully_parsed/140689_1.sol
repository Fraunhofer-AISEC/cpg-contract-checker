  
  function initialize(address newOwner, string calldata name, string calldata symbol, uint8 decimals) external {
    require(!_isInitialized, "Already Initialized");
    _isInitialized = true;
    minter = _msgSender();  
    emit SetMinter(address(0), minter);
    _name = name;
    _symbol = symbol;
    _decimals = decimals;
    _owner = newOwner;
    emit OwnershipTransferred(address(0), newOwner);
  } 
