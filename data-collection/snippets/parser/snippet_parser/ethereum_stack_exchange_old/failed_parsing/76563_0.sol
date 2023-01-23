# cat c.sol
pragma solidity 0.5.12;
pragma experimental ABIEncoderV2;
contract C {
  struct S {address a;}
  function F(S calldata) external pure returns (uint256) {return 0;}
}
# solc --asm c.sol
...
    tag_1:
        
      pop
      jumpi(tag_2, lt(calldatasize, 0x04))
      shr(0xe0, calldataload(0x00))
      dup1
      0xa0b61132 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      eq
      tag_3
      jumpi
...
