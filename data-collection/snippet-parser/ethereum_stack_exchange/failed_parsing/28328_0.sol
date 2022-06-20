import "./ERC20Token.sol";
Contract Test {
  function Test() {
  }

  function triggerTransfer(address tokenAddress, address to, uint value) {
      ERC20Token tok = ERC20Token(tokenAddress);
      tok.transfer(to, value);
  }
