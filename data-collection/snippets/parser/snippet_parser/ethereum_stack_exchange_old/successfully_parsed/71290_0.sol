contract A{


uint bidValue;

   address bidder;

   function bid() public payable{

   bidValue = msg.value;    

   bidder = tx.origin;

   }

}
