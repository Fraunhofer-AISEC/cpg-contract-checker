contract A {
   using SafeMath for uint256
}

contract B is A {
   

   function mul () public {
     uint256 test = 1;
     test.mul(3);
   }
}
