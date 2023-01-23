pragma solidity 0.8.15;

contract DemoStoragetoStorageValueTypeAssignment{
  uint stateVar1 = 20;
  uint stateVar2 = 40;
  
  function getUInt() public returns (uint) {
    stateVar1 = stateVar2;
    stateVar2 = 50;
    return stateVar1;     
  }
}
