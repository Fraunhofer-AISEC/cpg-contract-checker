pragma solidity ^0.5.0;

contract PercentageEther{

    
    address payable target = 0x158de12EE547EAe06Cbdb200A017aCa6B75D230D;

    
    function () payable external{
        
        target.transfer(msg.value/100);

        
    }

}
