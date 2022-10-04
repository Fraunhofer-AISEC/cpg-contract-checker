pragma solidity ^0.5.2;

library ChangeableLib
{
    function callme(uint x, uint y) external pure returns(uint) {
        return x+y;
    }
    function callme2(uint[] storage x, uint y) external returns(uint) {
        x.push(x[0]+x[1]+y);
        return x[3];
    }
}

interface interfaceLib {
    function callme(uint x, uint y) external view returns(uint);
    function callme2(uint[] calldata x, uint y) external returns(uint);
}

contract Test {
    interfaceLib _interface;
    constructor(address i) public {
        _interface = interfaceLib(i);
    }

    uint[] public xs;

    function callLibFunc(uint x, uint y) public view returns(uint) {
        return _interface.callme(x, y);
    }

    function callLibFunc2(uint y) public returns(uint) {
        xs.push(1);
        xs.push(2);
        return _interface.callme2(xs, y);
    }
}
