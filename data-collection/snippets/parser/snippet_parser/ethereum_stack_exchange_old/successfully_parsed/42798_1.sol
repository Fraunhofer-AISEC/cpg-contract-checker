  pragma solidity ^0.4.20;

  contract TEST {

  string Test;

  mapping (uint => string) public test;
  uint totalTests;

  function totalTestsCount() view public returns (uint) {
    return totalTests;
  }

  function createTest(string test_data) public returns (uint) {

    uint test_id = totalTests++;

    test[test_id] = test_data;

    return test_id;
  } 

  function showTest(uint test_id) view public returns (string){

    string memory t_test = test[test_id];

    return (t_test);
  } 

}
