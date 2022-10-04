contract HelloFactory {
  uint nbContracts;

  function HelloFactory() {
    nbContracts = 0;
  }

  function createHS() returns (HelloSystem contract) {
      HelloSystem ret = new HelloSystem();
      nbContracts++;
      return ret;
  }
}
