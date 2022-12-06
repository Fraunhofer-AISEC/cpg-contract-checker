pragma solidity ^0.5.0;

contract TusharCoin {

  uint256 public totalSupply;  
  string public name;  
  string public symbol;  
  uint32 public decimals;
  address public owner;

  mapping(address => uint256 ) balances;

  event Transfer(address to, uint256 amount);

  constructor () public {
    symbol  = "TUSHAR";  
    name = "TusharCoin";  
    decimals = 5;  
    totalSupply = 100000000000;
    owner = msg.sender;  
    balances[msg.sender] = totalSupply;
    emit Transfer(msg.sender, totalSupply);
    }

    function balanceOf(address accountAddress) public view returns (uint256) {
        return balances[accountAddress];
    }
 }
