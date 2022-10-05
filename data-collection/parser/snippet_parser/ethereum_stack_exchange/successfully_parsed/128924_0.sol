
pragma solidity ^0.8.0;


contract Target {

  address immutable _this;

  constructor() {
    _this = address(this);
  }

  function isDelegate() public returns (bool) {
    if (address(this) == _this) {
      
      
    }
    else {
      
      
    }
  }
}
