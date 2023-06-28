pragma solidity ^0.4.9;
import "./Callee.sol";

contract Caller{
  function call(address callee_address){
    Callee callee = Callee(callee_address);
    callee.callee_function();
  }
}
