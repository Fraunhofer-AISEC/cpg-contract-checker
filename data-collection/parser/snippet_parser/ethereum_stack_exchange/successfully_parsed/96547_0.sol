pragma solidity 0.8.3;

contract TestContract {
  address public foo;
  
  function setFoo(address _foo) external {
    foo = _foo;
  }
  
  function doFoo(address _target, address _foo) external returns (bool success) {
    (success,) = _target.staticcall(abi.encodeWithSignature("setFoo(address)", _foo));
  }
}
