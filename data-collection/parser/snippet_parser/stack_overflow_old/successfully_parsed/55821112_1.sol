contract HoneyPot {
  mapping (address => uint) public balances;
  constructor() public payable {
    put();
  }
  function put() public payable {
    balances[msg.sender] = msg.value;
  }
  function get() public payable returns (bool success) {
      (bool succ, ) = msg.sender.call.value(balances[msg.sender])("");
      require(succ);
      balances[msg.sender] = 0;
      return true;
  }

}
