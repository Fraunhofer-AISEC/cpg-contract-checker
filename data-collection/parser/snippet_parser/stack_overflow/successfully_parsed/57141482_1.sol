pragma solidity >=0.5.0 <0.6.0;

contract TestProxy {
  address public target;
  bytes data;

  constructor(address _target) public {
    target = _target;
  }

  function() external payable {
    data = msg.data;
  }

  function execute() public returns (bool success, bytes memory response) {
    (success, response) = target.call(data);
  }
}

