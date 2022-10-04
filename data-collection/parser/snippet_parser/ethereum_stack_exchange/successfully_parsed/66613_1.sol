pragma solidity 0.5.1;

contract A {
     function() external payable {
          
     }
}

contract B {

    constructor() payable public {
        A a = new A();
        address payable receiver = address(a); 
        receiver.transfer(msg.value);
     }
}
