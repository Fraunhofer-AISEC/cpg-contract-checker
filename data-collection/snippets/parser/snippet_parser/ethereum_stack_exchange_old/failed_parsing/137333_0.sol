if (amountToken > 0) {
  (uint minETH) = abi.decode(data, (uint)); 
  token.approve(address(exchangeV1), amountToken);
  uint amountReceived = exchangeV1.tokenToEthSwapInput(amountToken, minETH, uint(-1));
  uint amountRequired = UniswapV2Library.getAmountsIn(factory, amountToken, path)[0];
  assert(amountReceived > amountRequired); 
  WETH.deposit{value: amountRequired}();
  assert(WETH.transfer(msg.sender, amountRequired)); 
  (bool success,) = sender.call{value: amountReceived - amountRequired}(new bytes(0)); 
  assert(success);
} else {
  (uint minTokens) = abi.decode(data, (uint)); 
  WETH.withdraw(amountETH);
  uint amountReceived = exchangeV1.ethToTokenSwapInput{value: amountETH}(minTokens, uint(-1));
  uint amountRequired = UniswapV2Library.getAmountsIn(factory, amountETH, path)[0];
  assert(amountReceived > amountRequired); 
  assert(token.transfer(msg.sender, amountRequired)); 
  assert(token.transfer(sender, amountReceived - amountRequired)); 
}
