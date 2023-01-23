function deposit(address _seller, uint256 amount) external payable returns(bytes32) {

    require(msg.value > 0.1 ether, "Value of the deposit must be more than 0.1 ether"); 

    bytes32 hash = keccak256(abi.encode(msg.value, block.timestamp, _seller)); 

    Deposit storage _deposit = depositByHash[hash]; 

    _deposit.depositAmount = amount; 

    _deposit.buyer = msg.sender;
    
    _deposit.seller = _seller;  

    emit DepositMade(msg.sender, _seller, amount, hash);

    return hash; 
  }
