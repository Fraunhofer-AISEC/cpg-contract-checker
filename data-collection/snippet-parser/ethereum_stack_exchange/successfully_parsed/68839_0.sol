pragma solidity ^0.5.0;
contract Byt {
  event bytDone (uint256 a, uint256 b);
  function takeByt(bytes memory byt) public returns (uint256, uint256) {
    (uint256 a, uint256 b) = abi.decode (
      byt,
      (uint256, uint256));
    emit bytDone(a, b);
    return (a, b);
  }
}
