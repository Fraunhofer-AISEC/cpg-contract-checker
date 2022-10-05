pragma solidity ^0.4.19;
contract yourContract{

uint256 public balanceLimit = 999;


   function () payable{
    if (this.balance + msg.value > balanceLimit) {
        throw;
    }
   }
}
