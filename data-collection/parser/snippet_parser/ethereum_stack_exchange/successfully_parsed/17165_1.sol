pragma solidity ^0.4.11;

contract c{
 
 mapping (address=>uint) balances;
 
 struct foo  {
     uint vault;
 }
function withdraw() returns (bool) {
    
    foo memory balance; 

    uint customerBalance = balances[msg.sender];
    if(customerBalance == 0) {
      throw;
    }

    balance.vault -= customerBalance;
    balances[msg.sender] = 0;
    return msg.sender.send(customerBalance);
}
}
