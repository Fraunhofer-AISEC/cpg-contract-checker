pragma solidity ^0.4.22;

contract exampleContract {

    event Debug(bool destroyed); 

    constructor () public {

    
    
    function _destroyContract() internal {
        emit Debug(true); 
        
        selfdestruct(this); 
    }
}
