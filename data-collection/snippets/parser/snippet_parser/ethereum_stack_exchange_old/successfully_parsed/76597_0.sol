pragma solidity ^0.5.10;

contract A {
    function foo() external view returns(address payable) {return msg.sender;}
}

contract B is A {
    address payable public msgSender;

    function bar() external {
        
        msgSender = A.foo();  
        msgSender = this.foo();  
        msgSender = super.foo();  
    }
}
