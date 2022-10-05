function _forwardFunds() internal {
  wallet.transfer(address(this).balance);
}
