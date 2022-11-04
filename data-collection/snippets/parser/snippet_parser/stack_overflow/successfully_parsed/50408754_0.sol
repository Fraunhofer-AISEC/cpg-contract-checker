pragma solidity ^0.4.0;
contract MyWallet
  {
      struct account
       {
        uint balance;
        uint dailyLimit;
       }

      mapping (address =>account) _accounts;
      
    function () payable {
         _accounts[msg.sender].balance+=msg.value;
       }  

      
    function getBalance() returns (uint){
        return _accounts[msg.sender].balance;
       }

 }
