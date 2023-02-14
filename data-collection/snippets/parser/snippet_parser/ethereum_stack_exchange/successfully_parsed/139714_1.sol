pragma solidity 0.8.16 ;
 contract arr
 {
      uint i = 0 ;
     people[] public person ;

     struct people
     {
         uint256 num ;
         string name ;
     }

     function plus(string memory naam , uint256 nu) public
     {
       people memory olivier = people(nu, naam);
       person.push(olivier);
        i++ ;

     }
 }
