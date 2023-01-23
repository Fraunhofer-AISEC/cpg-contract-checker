pragma solidity ^0.4.18;

contract A {
  uint256 public balance;

  function() public payable {
    balance = msg.value;
  }
}

contract B is A {
  uint256 i;
  A a;

  function B(address _a) public {
    a = A(_a);
  }

  function receiveForParent() public payable {
    a.transfer(msg.value);
  }

  function getParentBalance() public constant returns (uint256) {
    return a.balance();
  }
}
