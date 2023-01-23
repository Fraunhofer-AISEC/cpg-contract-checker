pragma solidity ^0.4.18;
...
 function() public {
    if(delegate.delegatecall(msg.data)) {
      this;
    }
  }
