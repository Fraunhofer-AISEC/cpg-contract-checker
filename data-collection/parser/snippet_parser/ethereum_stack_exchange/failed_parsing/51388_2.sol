mapping (address => bool) public blacklist;




 if (msg.value < 0.005 ether) {
       require(firstPurchaceTierAllowed);
       require(!blaclist[msg.sender]);
       balances[msg.sender] += 4000;
       blacklist[msg.sender] = true;
 } 
