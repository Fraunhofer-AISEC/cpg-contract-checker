contract FactoryTInterface {
  function newT() returns(address newTContract);
}

contract MegaFactory is FactoryTInterface {

  address factoryTaddress;

  function MegaFactory(address factoryT) {
      factoryTaddress = factoryT;
  }

  function newT() returns(address newContract) {
    FactoryTInterface factory = FactoryTInterface(factoryTaddress);
    return factory.newT();
  }
}

contract FactoryT {

  function newT() returns(address newT) {
    T t = new T();
    return t;
  }
}

contract T {
  
}
