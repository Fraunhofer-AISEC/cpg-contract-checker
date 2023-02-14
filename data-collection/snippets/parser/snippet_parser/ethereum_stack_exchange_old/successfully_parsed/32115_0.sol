pragma solidity ^0.4.18;

contract Test {
  string public projName;

  function Test()
  {
    projName = 'Test Proj';
  }

  function getProjName() view public returns(string)
  {
    return projName;
  }
}
