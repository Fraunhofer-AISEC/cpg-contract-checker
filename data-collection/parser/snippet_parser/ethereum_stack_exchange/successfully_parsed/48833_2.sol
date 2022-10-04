pragma solidity ^0.4.23;

contract Producer {
  uint8 public SOME_VALUE=12;
}

contract Consumer {
    Producer currentProducer;

    function setProducer(address addr) public { 
        Producer newProducer = Producer(addr);
        require(newProducer.SOME_VALUE() > 0);
        currentProducer =newProducer; 
    }

    function getSome() public view returns (uint8) {
        return currentProducer.SOME_VALUE(); 

    }
}
