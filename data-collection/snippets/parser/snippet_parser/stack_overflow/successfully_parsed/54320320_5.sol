pragma solidity ^0.5.1;

contract D {
    uint x;
    constructor (uint a) public  {
        x = a;
    }
    function getX() public view returns(uint a)
    {
        return x;
    }
}

contract C {

    function getValue(address DAddress) public view returns(uint a){
        D d =D(DAddress);
        a=d.getX();
    }
}
