pragma solidity ^0.4.24;

contract Fundraiser {
    mapping(address=>uint) balances;

    function withdrawCoins(){ 
      uint withdrawAmount = balances[msg.sender];
      Wallet wallet = Wallet(msg.sender);
      wallet.payout.value(withdrawAmount)();
      balances[msg.sender] = 0;
    }

    function getBalance() constant returns (uint) {
        return address(this).balance;
    }

    function contribute() payable {
        balances[msg.sender] += msg.value;
    }

    function() payable {

    }
}
