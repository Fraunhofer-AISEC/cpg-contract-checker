contract Owned {
  address owner;

  function Owned() {
    owner = msg.sender;
  }

  modifier owner_only() {
    if (msg.sender == owner) {
      _;
    }
  }

  function terminate(address tokens[]) owner_only {
    
    for(uint i = 0; i < tokens.length; i++)) {
      address addr = tokens[i];
      ERC20Token token = ERC20Token(addr);
      uint256 balance = token.balanceOf(this);
      token.transfer(owner, balance);
    }

    
    selfdestruct(owner);
  }
}
