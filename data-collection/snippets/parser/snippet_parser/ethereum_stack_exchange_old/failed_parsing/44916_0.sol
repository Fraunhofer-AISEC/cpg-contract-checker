 event TokenPurchase(address indexed purchaser, address indexed beneficiary, uint256 value, uint256 amount);

function SimpleCrowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, address _wallet, address _wallet2) public {
    require(_startTime >= now);
    require(_endTime >= _startTime);
    require(_rate > 0);
    require(_wallet != address(0));
    require(_wallet2!= address(0));

    startTime = _startTime;
    endTime = _endTime;
    rate = _rate;
    wallet = _wallet;
    token = new SimpleToken(TOKEN_SUPPLY);
    wallet= _wallet2;

    token.mint(_wallet2, DEPOSIT_TOKENS);
    deposit();
  }

  function deposit() public payable {
    TokenPurchase(msg.sender, wallet, msg.value, DEPOSIT_TOKENS);
  }
