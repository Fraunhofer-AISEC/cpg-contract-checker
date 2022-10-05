    pragma solidity ^0.5.1;
      contract NaiveBank { 
      struct Account { 
         address addr ;
        uint balance ; 
      } 
      Account accounts []; 
      function applyInterest () returns ( uint ) { 
         for ( uint i = 0; i < accounts . length ; i++) { 
            
            accounts [i]. balance = accounts [i]. balance* 105 / 100; 
         } 
         return accounts . length ; 
      } 
   }
