pragma solidity >0.4.0;

contract HelloWorld{
  uint a;
  uint b;
  function renderHelloWorld () public returns (uint256) {
    a = 0;
    b = a+3;
    return b;
  }
}
