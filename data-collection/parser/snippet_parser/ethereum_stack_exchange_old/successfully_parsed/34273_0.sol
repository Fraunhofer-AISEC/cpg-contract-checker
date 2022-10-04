  pragma solidity ^ 0.4.8 ; 

  contract lastPrice {
     uint price ; 
     uint lprice ;

     function lastPrice (uint _price) {
        lprice = (_price * 1 ether);
       }

     function showPrice () constant returns (uint) {
        return lprice ;
     }
   }
