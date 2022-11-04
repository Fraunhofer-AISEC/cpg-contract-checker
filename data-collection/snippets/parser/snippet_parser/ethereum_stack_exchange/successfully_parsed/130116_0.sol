
pragma solidity 0.8.14;

error AmountShouldBeZero();

contract RequireVsRevert {
  function test(uint256 _amount) external pure {
    if (_amount != 0) revert AmountShouldBeZero();
  }
}
