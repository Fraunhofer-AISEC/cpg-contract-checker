function aOfContractA(uint256 amount):
   uint256 toSend = contractB.calculateAmount(msg.sender, amount); 
   require(toSend <= address(this).balance, "To low contract balance");

   bool success = payable(msg.sender).send(toSend); 

   emit Success(msg.sender, toSend);

   return success;
}
