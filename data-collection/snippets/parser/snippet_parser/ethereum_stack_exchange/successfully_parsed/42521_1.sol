contract Mutex {
  bool locked;
modifier noReentrancy() {
    require(!locked);
    locked = true;
    _;
    locked = false;
}

  function canBeAttacked() public returns (uint) {
    require(msg.sender.call.value(1 ether)());
   return 7;
  }


  function f() public noReentrancy returns (uint) {
    require(msg.sender.call());
   return 7;
  }
}
