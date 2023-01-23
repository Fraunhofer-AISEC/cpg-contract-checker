pragma solidity ^0.4.13; 
contract someContract { 
      mapping(address => uint) balances; 
     
      function deposit() payable {
            balances[msg.sender] += msg.value; 
      } 
function withdrawOkayish(uint amount) { 
     if(balances[msg.sender] >= amount) { 
          balances[msg.sender] -= amount;    if(!msg.sender.send(amount)) { throw; } 
   } 
 } 
function withdrawBad2(uint amount) { 
    if(balances[msg.sender] >= amount) { 
        balances[msg.sender] -= amount;   
    if(!msg.sender.call.gas(2500000).value(amount)()) { throw; } 
 } 
} 

}
