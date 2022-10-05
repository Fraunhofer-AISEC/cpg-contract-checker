pragma solidity ^0.8;

contract Parent {
    bool internal internalProperty;
    bool private privateProperty;
}

contract Child is Parent {
    function foo() external {
        
        internalProperty = true;
        
        
        privateProperty = true;
    }
}
