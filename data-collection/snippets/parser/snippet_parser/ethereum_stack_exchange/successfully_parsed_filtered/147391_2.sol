
pragma solidity >=0.4.22 <0.9.0;

contract Test1 {
  address owner = 0x00cF2cfa50BD1434C65f00Bf80867499492F5639;
  bytes32 message = keccak256(
      abi.encodePacked(owner)
  );

  function test() public view returns (bytes32) {
    return message;
  }
}
