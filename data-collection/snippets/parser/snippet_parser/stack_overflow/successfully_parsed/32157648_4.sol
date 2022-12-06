

    pragma solidity >=0.5.0 <0.9.0;


   contract AX{
      string public s1 = "aaa";
      string public s2 = "bbb";
      string public new_str;
 
      function concatenate() public {
         new_str = string(abi.encodePacked(s1, s2));
       } 
    }
