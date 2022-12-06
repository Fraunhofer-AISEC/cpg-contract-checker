pragma solidity ^0.4.22;
contract Base{
    uint public num;
    event mint(uint n);
    constructor() public {
    }

    function Minit(uint _n) external returns (bool) {
        num = _n;
        emit mint(num);
        return true;
    }
    function getN() external view returns(uint result){
        result =  num;

    }
}
