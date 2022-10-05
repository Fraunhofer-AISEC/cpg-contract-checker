pragma solidity ^0.4.24;

contract A {

    uint private a;

    function setA(uint _a) external { a = _a; }
    function getA() external view returns(uint) { return a; }
}

contract B {
    A a;

    constructor() public {
        a = new A();

        a.setA(2);
    }

    function getterA() public view returns(uint) { a.getA(); }
}
