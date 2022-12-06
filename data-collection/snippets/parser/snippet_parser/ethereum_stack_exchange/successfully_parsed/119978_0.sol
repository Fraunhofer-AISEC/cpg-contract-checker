contract SimpleContract {

  function doSomething(uint256 exp) external {
    require(now < exp, 'Transaction Expired');
  }
}
