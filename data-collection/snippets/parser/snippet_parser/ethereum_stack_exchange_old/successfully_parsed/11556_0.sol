pragma solidity ^0.4.18;

contract SampleOverflow {
  string constant statictext = "HelloStackOverFlow";
  bytes32 constant byteText = "HelloStackOverFlow";
  function  getString() payable public  returns(string){
    return statictext;
  }

  function  getByte() payable public returns(bytes32){
    return byteText;
  }
}
