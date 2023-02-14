pragma solidity ^0.8.7;

contract expire {

    uint deployedOn;
    uint duration;

    
    
    
    constructor(){
        deployedOn = block.timestamp;
        duration = 1 minutes;
    }

    
    event expired();
   
    event notExpired();


    
    function checkExpiry()public {
        if(block.timestamp < deployedOn+duration){
            emit notExpired();
        }
        else emit expired();
    }  
}
