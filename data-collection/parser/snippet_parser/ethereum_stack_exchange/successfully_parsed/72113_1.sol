pragma solidity ^0.5.1;
import "./Callee.sol";

contract Caller is Callee{

    
    
    
    
    function someAction() public returns(uint){
      return getValue();
    }
    function inc() public returns(uint){
      return increment();
    }

}
