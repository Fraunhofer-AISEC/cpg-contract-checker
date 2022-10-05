contract Donation{
  function donate() external payable{}

  function getBalance() external view returns(uint)
  {
    return address(this).balance;
  }
}
