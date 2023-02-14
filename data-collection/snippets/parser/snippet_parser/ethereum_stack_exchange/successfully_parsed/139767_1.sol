
pragma solidity 0.8.16 ;
 contract arr
 { people[] public person ;
    struct people
     {
         uint256 num ;
         string name ;
     }

      function plus() public
     {   
       person.push(new people()); 
     }
 }
