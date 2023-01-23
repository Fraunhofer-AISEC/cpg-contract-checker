
pragma solidity 0.8.9;

contract hodl {
  
  uint num;
  uint value;
    
  constructor() {
      num = 69;
      value = 0;
  }
  
  event showNum(uint num);
  event seeSender(address addy, uint value);

  fallback() external payable {
    emit seeSender(msg.sender, msg.value);
    emit showNum(num);
    num += 1;
  }

  function printNum() public returns (uint y){
    emit showNum(num);
    return num;
  }

  function printValue() public returns (uint y){
    return value;
  }

}
