interface IDefiAdapter {
  function deposit() external payable;
  function withdraw() external;
  function getBalance() external view returns(uint256 balance);
}
