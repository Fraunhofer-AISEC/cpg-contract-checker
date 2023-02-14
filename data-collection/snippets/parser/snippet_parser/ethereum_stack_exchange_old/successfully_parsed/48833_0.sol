contract Producer {
  uint8 public SOME_VALUE=12;
}
contract Consumer {
  Producter currentProducer;
  function setProducer(address addr) { currentProducer = Producer(addr); }
  function getSome() returns (uint8) { return currentProducer.SOME_VALUE(); }
}
