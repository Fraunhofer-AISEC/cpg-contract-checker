
pragma solidity ^0.4.11;

contract tokensale {

  
  uint public maxTokens = 10000;

  
  
  uint public tokenSwap = 10;

  
  
  uint public supply = 0;

  
  
  mapping (address => uint) balance;


  
  
  modifier isTokenAvailable () {
    require (msg.value*tokenSwap + supply <= maxTokens);     
    _;                                                       
  }                                                                      


  



  
  
  
  function balanceOf (address tokenHolder) external constant returns (uint) {
    return balance[tokenHolder];
  }

  
  
  
  
  
  
  

  function buyTokens () external
  payable 
  isTokenAvailable {
    uint tokensAmount = msg.value * tokenSwap;    
    balance [msg.sender] += tokensAmount;
    supply += tokensAmount;
  }
}
