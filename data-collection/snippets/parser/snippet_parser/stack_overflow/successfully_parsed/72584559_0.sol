
pragma solidity ^0.8.0;

contract Demo {
    event Error(string);
    fallback() external {
      emit Error("call of a non-existent function");
    }
}
