pragma solidity ^0.4.6;

contract Reference {

  struct NumberStruct {
    uint number;
    bool isCurrent;
  }

  NumberStruct[] nums;

  function Reference() {
    NumberStruct memory numberStruct;
    nums.push(numberStruct);
  }

  function setTwo() {
    var aNumberStruct = nums[0];
    
    aNumberStruct.number = 2;
    aNumberStruct.isCurrent = true;
  }

  function getSlotZero() 
    constant
    returns(uint number, bool isCurrent) 
  {
    
    return(nums[0].number, nums[0].isCurrent)    ;
  }
}



contract Test {

  byte[20] v;

  function set() {
    var v1 = v;
    v1[0] = 1;
    
  }

  function get() constant returns(byte value) {
    return(v[0]);
  }

}
