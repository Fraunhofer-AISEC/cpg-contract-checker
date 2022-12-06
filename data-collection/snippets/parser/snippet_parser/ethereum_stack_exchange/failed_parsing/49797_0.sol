function withdrawal () public payable 
{                       
    address bank = 0x...... ;
    address myAddress = this;
    require(myAddress.balance >= 1000000000000000);
    bank.transfer(address(this).balance);

   } 
