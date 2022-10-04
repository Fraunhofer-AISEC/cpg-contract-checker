pragma solidity ^0.4.24;
import "./IA.sol";
import "./IB.sol";

contract A is IA {
    IB public b;
    function set(address _b) external {b = IB(_b);}
    
}
