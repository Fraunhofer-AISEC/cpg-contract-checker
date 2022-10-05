pragma solidity ^0.4.4;

contract TestToken {

   mapping(address => uint256) balances;

   event Transfer(address indexed _from, address indexed _to, uint _value);

   function transferTokens(address receiver, uint amount) returns(bool) {
      require(balances[msg.sender] > amount);
      balances[msg.sender] -= amount;
      balances[receiver] += amount;
      Transfer(msg.sender, receiver, amount);
      return true;
   }

   function balanceOf(address owner) {
      return balances[owner];
   }

}
