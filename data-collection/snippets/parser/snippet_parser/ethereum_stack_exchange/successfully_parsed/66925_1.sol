pragma solidity ^0.4.11;
import "./TokenInterface.sol";
contract TokenImpl {
    function transfer(address recipient, uint amount) public returns(bool)
    {
         return true;
    }
}
