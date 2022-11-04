pragma solidity ^0.4.13;

contract TestContract {

    address owner;

    modifier ownerOnly1 {
        if(msg.sender == owner) _;  
    }

    modifier ownerOnly2 {
        if(msg.sender != owner) revert();  
        _;
    }

    function TestContract() {
        owner = msg.sender;
    }

    function foo()
    ownerOnly1    
    returns (uint answer)
    {
        return 42;
    }
}
