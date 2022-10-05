function newContract(string symbol, string name, ...) public ... {
  
  
  ERC20Contract tokenContract = new ERC20Contract(symbol, name, ...);
  contractAddresses.push(address(TokenContract));
  emit ...
  return ...
}
