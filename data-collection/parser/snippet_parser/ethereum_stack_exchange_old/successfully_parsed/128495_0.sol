

pragma solidity 0.8.14;

contract Test {
     uint256 public x;

     constructor(uint256 _x) {
          _initialize(_x);
     }

     function foo(uint256 bb) public {
          _initialize(bb);
     }

     function _initialize(uint256 _a) internal {
          x = _a;
     }
}
