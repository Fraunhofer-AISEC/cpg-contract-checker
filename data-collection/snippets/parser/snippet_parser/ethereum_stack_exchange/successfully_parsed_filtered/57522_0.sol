

pragma solidity ^0.4.0;


contract exercise {

   uint public balance;
   string  name= "Sara"
 int[] public nums=[1,2,3];

   function setBalance(int x) public {
       balance = x;
   }

   function getBalance() public  returns (uint) {
       return balance;
   }


   function doubleBalance() public view returns (uint) {
       balance=2*balance;
       return balance;
   }


}
