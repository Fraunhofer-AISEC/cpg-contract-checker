pragma solidity ^0.5.1; 
contract Governmental{
   function lendGovernmentMoney ( address buddy ) public  returns ( bool ) {
      address owner;
      uint[] memory creditorAddresses;
      uint lastTimeOfNewCredit =0;
      uint amount = msg. value ;
      uint creditorAmounts = 0;
      uint profitFromCrash = 0;
      uint round = 0;
      uint lastCreditorPayedOut = 0;
      uint constant TWELVE_HOURS = 12; 
      
      if ( lastTimeOfNewCredit + TWELVE_HOURS > block . timestamp ) {
         msg. sender . send ( amount );
         
         creditorAddresses [ creditorAddresses . length - 1] . send ( profitFromCrash );
         owner . send ( this . balance );
         
         lastCreditorPayedOut = 0;
         lastTimeOfNewCredit = block . timestamp ;
         profitFromCrash = 0;
         creditorAddresses = new address [](0);
         creditorAmounts = new uint [](0);
         round += 1;
         return false ;
      }
   }
}
