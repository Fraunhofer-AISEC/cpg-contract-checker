contract Guarded {
     ...
     bool locked = false; 

     function withdraw() external {             
         require(!locked, "Reentrant call detected!");
         locked = true;

         
         (bool success, ) = msg.sender.call.value(balanceOfPayment1[msg.sender])("");
         require(success, "Transfer failed.");
         balanceOfPayment1[msg.sender] = 0;

         
         (bool success, ) = msg.sender.call.value(balanceOfPayment2[msg.sender])("");
         require(success, "Transfer failed.");
         balanceOfPayment2[msg.sender] = 0;

         locked = false;
    }
}
