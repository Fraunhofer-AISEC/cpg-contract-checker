  struct Order {    
    address investor;    
    uint amount;    
    uint timestamp;    
   }
   
   Order[] public orders;
   function issueNFTs() public onlyOwner {
       for (uint i = 0; i <  orders.length; i++) {
           _mint(orders[i].investor, 0, orders[i].amount/totalAmountRaised(), "");
       }
   }
