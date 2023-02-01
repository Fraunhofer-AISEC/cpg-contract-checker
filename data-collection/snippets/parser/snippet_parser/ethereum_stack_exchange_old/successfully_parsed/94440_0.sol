pragma solidity ^0.5.1; 
contract investorPayment{
   struct st_investors{
      uint invested;
      uint payout;
      address payable Address;
   }
   st_investors[100] investors;
   

   function pay(uint min_investment, address payable addr, st_investors memory newInvestor) public{
      uint payout;
      for (uint i=0; i < investors.length; i++) {
         investors[i].Address = addr;
         if (investors[i].invested == min_investment) {
            payout = investors[i].payout;
            if (!(investors[i].Address.send(payout)))
               revert();
            investors[i] = newInvestor;
         }
      }
   }
}     
