contract Token {

  mapping(address => uint256) public balanceOf;

  event Transfer(
    address indexed _from,
    address indexed _to,
    uint256 _value
    );

  constructor(uint256 _initialSupply) public {
    owner = msg.sender;
    balanceOf[msg.sender] = _initialSupply;
    totalSupply = _initialSupply;
  }

  function getTokens() public returns (bool success){
    balanceOf[owner] -= 48;
    balanceOf[msg.sender] += 48;
    emit Transfer(owner, msg.sender, 48);
    return true;
  }


}
