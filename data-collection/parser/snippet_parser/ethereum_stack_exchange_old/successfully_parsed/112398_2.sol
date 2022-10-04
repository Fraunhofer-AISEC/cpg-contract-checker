
pragma solidity >=0.6.0 <0.9.0;

abstract contract GhilOracleInterface {
  function getAmountAvailable() public virtual returns (uint256);
}
