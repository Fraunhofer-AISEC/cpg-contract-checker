pragma solidity ^0.4.17;

contract Demo{

  string public data;

  function Demo()public{
    data = "Jiu Wei";
  }

  function getData() public view returns (string) {
      return data;
  }
}
