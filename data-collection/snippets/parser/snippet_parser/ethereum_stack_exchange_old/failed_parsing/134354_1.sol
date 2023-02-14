
pragma solidity ^0.8.0;

contract Target {
  function someFunc() external returns(uint[] memory numbers, string memory name) {
    numbers = new uint[](3);
    numbers[0] = 10;
    numbers[1] = 20;
    numbers[2] = 30;
    name = 'hahah';
  }
}


contract Test {
  function action(address addr) external {
    (bool success, bytes memory data) =  addr.call(abi.encodeWithSignature("someFunc()"));
    if (success) {
      (uint[] memory numbers, string memory name) = abi.decode(data, (uint[], string));
      ...
    }
  }
}
