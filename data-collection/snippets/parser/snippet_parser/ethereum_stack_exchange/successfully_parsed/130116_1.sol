
pragma solidity 0.8.14;    

contract RequireVsRevert {
  function test(uint256 _amount) external pure {
    require(_amount == 0, "Amount should be zero");
  }
}
