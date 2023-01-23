pragma solidity ^0.4.16;

contract ERC20 {
  function balanceOf(address who) constant returns (uint256);
}

contract myTest {

  ERC20 myToken;

  function setToken(address tokenAddress) {
    myToken = ERC20(tokenAddress);
  }

  function getTokenBalanceOf(address h0dler) constant returns (uint balance) {
    return myToken.balanceOf(h0dler);
  }
}
