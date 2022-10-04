
pragma solidity ^0.8.0;

contract Test {
  function under() public pure returns (uint) {
        uint a = 0;
        unchecked {
            return a - 20;
        }
    }
}
