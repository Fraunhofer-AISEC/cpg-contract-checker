contract attacker{ 

    constructor(address payable _vulnerableContract) public{
        vulnerable v = vulnerable(_vulnerableContract);
    }

    function deposit(address payable _addr) payable public{
        _addr.transfer(msg.value);
    }

    function() external payable{
       }

}
