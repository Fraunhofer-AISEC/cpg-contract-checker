pragma solidity ^0.8.17;

contract A{
    bool public dummy;

    function setDummy (bool x) public{
        dummy = x;
    }

    function getDummy () public view returns(bool){
        return dummy;
    }
}


contract B {
    A public aContract;

    function initialize () public{
        aContract = new A();
    }
}
