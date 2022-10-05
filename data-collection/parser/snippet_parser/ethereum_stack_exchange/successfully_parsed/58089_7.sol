pragma solidity ^0.4.22;
import "./Base.sol";
contract Extend{
    Base public base;
    uint public num;
    constructor(address _base) public {
        base = Base(_base);
        base.Minit(10);
    }   
    function setN() public{
        num = base.getN();

    }
    function getN() public view returns(uint){
        return num;
    }
}
