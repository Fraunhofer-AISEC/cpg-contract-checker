pragma solidity ^0.4.15;

contract testbalance {

     function() payable {
       address myAddress = this;
       myAddress.balance += msg.value; 
       myAddress.balance += msg.value;   
     }

}
