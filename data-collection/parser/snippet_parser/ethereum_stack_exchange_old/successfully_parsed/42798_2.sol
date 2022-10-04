pragma solidity ^0.4.20;

contract Test {

  string[] public tests;

  event LogAppendedData(address sender, string data);

  function totalTestsCount() view public returns (uint) {
    return tests.length;
  }

  function appendData(string test_data) public returns (uint count) {
    emit LogAppendedData(msg.sender, test_data);
    return tests.push(test_data);
  } 

  function showTest(uint row) view public returns (string){
    return tests[row];
  } 

}
