pragma solidity >=0.7.0 <0.9.0;

contract testGasLimits{

    uint b;
    constructor(){
        b = 0;
    }

    function testGasA(uint a) public{
        b = a;
    }

    function testGasB() public{

    }

    receive() external payable {}
    fallback() external payable {}
}
