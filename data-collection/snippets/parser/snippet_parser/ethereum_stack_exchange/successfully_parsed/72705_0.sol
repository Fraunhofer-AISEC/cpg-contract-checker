contract MyContract {
  function createNewToken(string _name) payable returns (address newToken) {
    require(msg.value == 1 ether);
    tokenNames.push(_name);
    ERC20 newToken = new ERC20();
    return address(newToken);
  }
}
