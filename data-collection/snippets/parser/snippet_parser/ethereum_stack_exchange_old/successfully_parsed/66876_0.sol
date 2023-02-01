pragma solidity 0.5.1;

contract Scope {

    modifier checkScope {
        uint x = 100;
        _;
    }

    function doSomething() public pure checkScope returns(uint) {
        
    }
}
