pragma solidity ^0.5.12;
import "./C.sol";
contract A{
   bytes public fname="Yerevan";
   function naming() public returns(string memory){
      return C(0x8fcECc5B8d42EcF099E1cF032B1F505fbDA230A3).rep(fname);
  }
  }
