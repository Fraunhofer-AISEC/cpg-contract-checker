pragma solidity ^0.6.0;

function withdraw(){
    
    require(block.timestamp > timeHasCome);
    
    require(msg.sender == beneficiary);
    
    
    beneficiary = address(0);
    
    (bool success, ) = msg.sender.call.value(predefinedAmount)(""); 
    require(success, "Transfer failed."); 
}
