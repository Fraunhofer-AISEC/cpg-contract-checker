 pragma solidity ^0.4.16;


contract ERC20Basic {
  uint256 public totalSupply;
  function balanceOf(address who) constant returns (uint256);
  function transfer(address to, uint256 value) returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
}

contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) constant returns (uint256);
  function transferFrom(address from, address to, uint256 value) returns (bool);
  function approve(address spender, uint256 value) returns (bool);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract test{

  ERC20 myToken = ERC20(0xa74476443119A942dE498590Fe1f2454d7D4aC0d);

  function getTokenBalanceOf(address a) constant returns (uint balance) {
    return myToken.balanceOf(a);
  }
}
