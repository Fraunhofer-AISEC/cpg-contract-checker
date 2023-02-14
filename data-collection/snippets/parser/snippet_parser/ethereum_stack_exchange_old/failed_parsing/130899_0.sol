

pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;


contract MyCon {
  constructor();

  function myfunc external returns (bool) {
    require(cond1, "condition1 not met");
    

    emit _success();
    return true;

  }
}
