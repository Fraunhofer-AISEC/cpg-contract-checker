pragma solidity ^0.7.6;
import "./Library.sol";
contract A {
    using Library for uint256;
    constructor (){
        uint256 a = 1;
        uint256 b = a.increment();
    }
}
