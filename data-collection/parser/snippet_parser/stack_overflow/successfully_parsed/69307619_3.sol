pragma solidity ^0.8;

contract Parent {
    
    
    uint public number;
}

contract Child is Parent {
    function foo() public {
        number++;
    }
}
