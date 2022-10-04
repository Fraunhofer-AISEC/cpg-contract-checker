pragma solidity ^0.4.0;

contract MyContract {
  address mAdmin;

  modifier adminOnly {
    if (msg.sender == mAdmin) _;
  }

  function MyContract() {
    mAdmin = msg.sender;
  }

  function doSomething() adminOnly {
    ...
  }
}
