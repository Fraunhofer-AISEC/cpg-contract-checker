pragma solidity ^0.8.0;

contract MyContract {
    function foo() external {
        this.bar();
    }
    
    function bar() public {
    }
}
