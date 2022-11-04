address public usdt;
  mapping(address => uint) public bankBalance;
  constructor() public {
      usdt = 0x77c24f0Af71257C0ee26e0E0a108F940D1698d53;
  }
usdt = 0x77c24f0Af71257C0ee26e0E0a108F940D1698d53;
  function depositTokens(uint _amount) public {
      IER20(usdt).approve.address(this), uint _amount;
      
      IERC20(usdt).transferFrom(msg.sender, address(this), _amount);
      
      bankBalance[msg.sender] = bankBalance[msg.sender] + _amount;
  }


  function approve(address delegate, uint256 numTokens) public override returns (bool) {
      allowed[msg.sender][delegate] = numTokens;
      emit Approval(msg.sender, delegate, numTokens);
      return true;
