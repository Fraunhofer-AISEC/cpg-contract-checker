function doSomething() external payable {
  require(
      msg.value == price,
      'Please send the correct amount of ETH'
  );
  
}
