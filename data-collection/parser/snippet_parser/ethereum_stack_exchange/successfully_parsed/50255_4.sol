pragma solidity ^0.4.24;
import "./IA.sol";
import "./IB.sol";

contract B is IB {
    IA public a;
    function set(IA _a) external {a = _a;}
    
}
