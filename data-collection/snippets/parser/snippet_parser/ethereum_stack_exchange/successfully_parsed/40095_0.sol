pragma solidity ^0.4.18;

contract TestAssert {


   uint256 public constant startDate = 1517907600; 
   uint256 public constant endDate = 1522659600; 


  function TestAssert() {

  }

  function assertOneEqualsOne () returns (bool) {
    assert(1 == 1);
  }

  function assertStartDate () constant returns(bool){
    assert(now >= startDate); 
  }

  function assertEndDate () constant returns(bool){
    assert(now <= endDate);
  }

  function returnNow() returns (uint256) {
    return now;
  }

  function () payable {
     
  }

}
