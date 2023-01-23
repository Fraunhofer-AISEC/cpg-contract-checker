library LibA {
  function sendTo(address to, uint256 amount) external{
    (bool success,) = payable(to).call{ value: amount }("");
    require(success);
  }
}
