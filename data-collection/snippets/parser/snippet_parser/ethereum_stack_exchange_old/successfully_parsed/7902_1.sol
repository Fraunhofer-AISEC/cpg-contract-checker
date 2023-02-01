pragma solidity ^0.4.23;
contract TestExceptionHandling{
    uint public a ;
    constructor(uint _a) public{
        a= _a;
    }
    function increaseA(uint b) public{
        require(b > a, 'new value must be greater than a');
        if (b > 50){
            revert('Very large value');
        }
        a = b;
    }
}
