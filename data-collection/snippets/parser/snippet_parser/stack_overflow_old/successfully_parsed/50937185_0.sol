pragma solidity ^0.4.24;

contract TestA {
    uint public someValue;

    function setValue(uint a) public returns (bool){
        someValue = a;
        return true;
    }
}

contract TestB {
    address public recentA;

    function createA() public returns (address) {
        recentA = new TestA();
        return recentA;
    }

    function setA() public returns (bool) {
        TestA(recentA).setValue(6);
        return true;
    }
}
