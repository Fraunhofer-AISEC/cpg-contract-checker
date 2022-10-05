import "./ERC20.sol";

contract myTest {

  ERC20 myToken;

  function setToken(address tokenAddress) {
    myToken = ERC20(tokenAddress);
  }

  function getTokenBalanceOf(address h0dler) constant returns (uint balance) {
    return myToken.balanceOf(h0dler);
  }
}
