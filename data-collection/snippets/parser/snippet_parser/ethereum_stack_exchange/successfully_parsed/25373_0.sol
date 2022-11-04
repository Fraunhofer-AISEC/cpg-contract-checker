contract HoneyPot {

  mapping (address => uint) public balances;

  function HoneyPot() payable {
    balances[msg.sender] = msg.value;
  }

}
