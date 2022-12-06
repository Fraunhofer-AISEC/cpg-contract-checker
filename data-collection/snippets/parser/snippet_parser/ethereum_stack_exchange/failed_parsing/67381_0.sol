

contract IErc20 {
  function transferFrom(address, address, uint) public returns (bool);
}

contract MyContract {
  IErc20 public token;

  constructor(address _token) {
    token = IErc20(_token);
  }

  function deposit(uint _amount) public {
    require(token.transferFrom(msg.sender, address(this), _amount);
  }
}
