contract ERC20Token {
  function transferFrom(address from, address to, uint value);
}

contract MyContract {
  function myFunction(address tokenAddr) {
    ERC20Token tok = ERC20Token(tokenAddr);
    tok.transferFrom(_owner, _recipient, 100);
  }
}
