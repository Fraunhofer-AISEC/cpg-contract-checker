contract OneTx {
  mapping(address => string) names;

  function constructor() {
    ERC20 erc20 = ERC20("0x...")
  }

  function doStuff(address from, address to, uint amount, string name) {
    erc20.transferFrom(from, to, amount);
    names[from] = name;
  }
}
