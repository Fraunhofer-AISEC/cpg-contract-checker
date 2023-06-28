
pragma solidity >=0.8.0 <0.9.0;
pragma experimental ABIEncoderV2;

contract Test {
    constructor() {}
    function multiArray() external pure returns (uint256[2][] memory doubleArray) {
        doubleArray[0] = [uint(12345678),uint(1234567)];
      return doubleArray;
    }
}
