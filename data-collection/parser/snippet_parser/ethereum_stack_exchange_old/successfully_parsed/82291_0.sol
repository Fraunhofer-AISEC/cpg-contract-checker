pragma solidity ^0.5.15;

contract Test  {

   address dc = 0xaD6D458402F60fD3Bd25163575031ACDce07538D; 
   uint number;
   event Log(uint256 number, bytes b);


    function balanceOf(address _val) public {
      bool status;
      bytes memory b;
      (status, b) = dc.staticcall(abi.encodePacked(bytes4(keccak256("balanceOf(address)")), _val));
        emit Log(number, b);
    }}
