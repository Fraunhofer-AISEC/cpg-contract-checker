pragma solidity ^0.4.21;

contract A{
    uint public a;
    function setA(uint _a){
        a = _a;
    }
    function getData() constant returns (uint){
        return a;
    }
}

contract B is A {
    function getData() constant returns (uint) {
        return a * 10;
    }
}

contract C {
    A[] internal c;
    function () payable {}
    function makeContract() returns (uint, uint){ 
        c.length = 2;
        A a = new A();
        a.setA(1);
        c[0] = a;
        B b = new B();
        b.setA(1);
        c[1] = b;
        return (c[0].getData(), c[1].getData());
    }
}
