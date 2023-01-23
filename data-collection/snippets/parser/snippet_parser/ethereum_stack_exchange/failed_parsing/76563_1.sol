# cat l.sol
pragma solidity 0.5.12;
pragma experimental ABIEncoderV2;
library L {
  struct S {address a;}
  function F(S calldata) external pure returns (uint256) {return 0;}
}
# solc --asm l.sol
...
sub_0: assembly {
        
      eq(address, deployTimeAddress())
      mstore(0x40, 0x80)
      jumpi(tag_1, lt(calldatasize, 0x04))
      shr(0xe0, calldataload(0x00))
      dup1
      0xe2a2daa1 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      eq
      tag_2
      jumpi
...
