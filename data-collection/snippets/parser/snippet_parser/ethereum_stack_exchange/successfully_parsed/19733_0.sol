pragma solidity ^0.4.0;

contract test {

  bool test_bool1 = false;

  bool test_bool2 = true;

  modifier test_modifier(bool _test_bool){
      if (_test_bool == false) throw;
      _;
  }

  function test1(uint input1) test_modifier(test_bool1) returns (uint){
      return input1;
  }

   function test2(uint input2) test_modifier(test_bool2) returns (uint){
      return input2;
  }

}
