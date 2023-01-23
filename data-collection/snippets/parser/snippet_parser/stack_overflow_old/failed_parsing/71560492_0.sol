function PostDelivery(string memory pseudo) public {
   require(isFinish);
   require(msg.sender == Database[pseudo].data_address);  
   require(Database[pseudo].payed == false;);   
   
   transferFrom(accountwithtoken,Database[pseudo].data_address,Database[pseudo].data_balance ) 
   Database[pseudo].payed = true;
   
}

function finish() public {
    require(msg.sender == admin);
    isFinish = true; 
}
