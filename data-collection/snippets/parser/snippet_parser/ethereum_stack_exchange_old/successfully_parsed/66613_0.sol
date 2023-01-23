contract A {
     function() payable {
          
     }
}

contract B {

    constructor() payable public {
        A a = new A();
        address payable receiver = address(a); 
        receiver.transfer(msg.value);
     }
}
