```


pragma solidity 0.8.13;

contract trade{

    constructor() { owner = msg. sender; }

    address owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;

}





    

    mapping(address => uint32) public consumers;

    

    mapping(address => uint) public producers;

    

    mapping(address => uint) public userEnergyBal;




    modifier onlyRegisteredConsumers {
        require (consumers[msg. sender] > 0);
       _;
    }
    function registerConsumer (address aconsumer, uint32 auserID, uint buserEnergyBal) onlyOwner external {
        consumers [aconsumer] = auserID;
        userEnergyBal [aconsumer] = buserEnergyBal;

    }




    modifier onlyRegisteredProducers {
    require (producers[msg. sender]>0);
    _;
    }
    function registerProducer(address bproducer,uint buserID, uint buserEnergyBal) onlyOwner external {
    require(buserID>0);
    producers [bproducer] = buserID;
    userEnergyBal [bproducer] = buserEnergyBal;
    }




    function buy_energy (address aproducer, uint64 aenergy) onlyRegisteredConsumers external payable {
    sendEthUser(aproducer);
    }

    function sendEthUser(address _user) public payable{
       payable(_user).transfer(2);
    }

}
```
