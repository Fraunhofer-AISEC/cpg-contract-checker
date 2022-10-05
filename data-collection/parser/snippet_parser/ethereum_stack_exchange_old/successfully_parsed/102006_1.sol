pragma solidity ^0.8.4;

contract Counter {
 
    uint public count = 1;

    function incrementPrefixCount() public returns (uint) {
        return (++count); 
    }
    
    function incrementPostfixCount() public returns (uint) {
        return (count++); 
    }
}
