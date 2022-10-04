pragma solidity 0.8.9;

contract hodl {

  event printNum(uint num);
  event printValue(uint val);

  function deposit(uint number) payable public {
    emit printNum(number);
    emit printValue(msg.value);
  }
    
}
