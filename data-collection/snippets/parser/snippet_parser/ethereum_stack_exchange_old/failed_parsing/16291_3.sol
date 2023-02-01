contract HelloFactory {
  uint nbContracts;
  event HSCreated(address _from, HelloSystem addr);

  function HelloFactory() {
    nbContracts = 0;
  }

  function createHS() returns (HelloSystem contract) {
      HelloSystem ret = new HelloSystem();
      nbContracts++;
      HSCreated(msg.sender, ret);
      return ret;
  }
}
