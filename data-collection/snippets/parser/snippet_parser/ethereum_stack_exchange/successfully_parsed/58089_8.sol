pragma solidity ^0.4.22;
import "./Base.sol";
contract Extend is Base {
    uint public num;
    constructor() public {
        Minit(10);
    }   
    function setN() public{
        num = getN();

    }
    function getN() public view returns(uint){
        return num;
    }
}
