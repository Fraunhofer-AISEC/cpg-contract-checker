pragma solidity ^0.8.7;

contract expire {

    uint deployedOn;
    uint duration;

    
    
    
    constructor(){
        deployedOn = block.timestamp;
        duration = 1 minutes;
    }

    
    event expired();

    
    
    function checkExpiry()public {
        if(block.timestamp > deployedOn+duration){
            emit expired();
        }
    }  

}
