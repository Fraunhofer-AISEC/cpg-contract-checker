pragma solidity ^0.5.1;

contract MyContract{
    
    struct Center{
        uint id;
        uint balance;
    }
    mapping(uint => Center) public center;
    uint count;
    
    address[100] public sender;
    uint countDown;
    
    uint public bonus;
    uint checkAddress;
    uint public a;
    
    constructor() public{
        addCenter(1,0);
        addCenter(2,0);
    }
    
    function addCenter(uint _id,uint amount) private{
        count++;
        center[count] = Center(_id, amount);
    }
    
    function sendMoney(uint centerId, uint _amount) payable public{
        require(centerId >0 && centerId <= count);
        
        countDown++;
        bonus+=10;
        
        sender[countDown] = msg.sender;
        
        if(centerId == 1){
            center[centerId].balance += _amount;
        }
        if(centerId == 2){
            center[centerId].balance += _amount;
        }
        

    }
    
    
}
