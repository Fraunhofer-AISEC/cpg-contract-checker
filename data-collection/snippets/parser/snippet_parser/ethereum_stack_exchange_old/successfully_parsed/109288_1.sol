contract Token is ERC20, ERC20Detailed, ERC20Burnable, ERC20Mintable, ERC20Pausable {
  function Token(tokenName, tokenTicker, initialSupply, dexAddress) ERC20Detailed(tokenName, tokenTicker, 18) internal {
    _mint(dexAddress, 1000);
  }
}