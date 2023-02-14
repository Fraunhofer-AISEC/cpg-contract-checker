
pragma solidity ^0.8.4;

contract C {
    event testEvent(address msgSenderAddress, address _from);
    function f() public payable {
        emit testEvent(msg.sender, address(this));
    }
}

library LibB {
    function doSomething(address c) public {
        C(c).f();
    }
}

contract A {
   using LibB for address;
   address c = 0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99; 
   constructor() {
       c.doSomething();
   }
}
