import "./MyInterface.sol";

contract MyContract is MyInterface {
  function foo(bytes memory b) public view returns (bool) {
    ...
  }
}
