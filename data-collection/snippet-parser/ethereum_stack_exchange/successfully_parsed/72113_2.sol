pragma solidity ^0.5.1;
import "./Callee.sol";

contract Caller{

    Callee public c;
    constructor() public {
      c = new Callee();
    }
    function someAction() public view returns(uint){
      return c.getValue();
    }
    function inc() public returns(uint){
      return c.increment();
    }
}
