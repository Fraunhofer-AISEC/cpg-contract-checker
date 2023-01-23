mapping(address => mapping (address => uint256)) allowed;
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

  function approve(address delegate, uint256 numTokens) public returns (bool) {
      allowed[msg.sender][delegate] = numTokens;
      emit Approval(msg.sender, delegate, numTokens);
      return true;
  }
