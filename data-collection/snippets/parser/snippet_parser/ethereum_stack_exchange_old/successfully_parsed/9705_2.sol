pragma solidity ^0.4.0;

contract PayMain {
  Main main;
  function PayMain(address _m) {
     main = Main(_m);
  }
  function () payable {
    
    
    
    main.handlePayment.value(msg.value)(msg.sender);
  }
}

contract Main {
  function handlePayment(address senderAddress) payable public {
      
  }
}
