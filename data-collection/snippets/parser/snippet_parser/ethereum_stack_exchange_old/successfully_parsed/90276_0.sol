pragma solidity ^0.5.16;

contract con_H {
  function helloWorld() external pure returns (string memory) {
    return "Hello, World!";
  }
}


contract con_A {
    con_H ins_H;
    
    function fun_A1() external view returns (string memory) {
        return ins_H.helloWorld();
    }
}
