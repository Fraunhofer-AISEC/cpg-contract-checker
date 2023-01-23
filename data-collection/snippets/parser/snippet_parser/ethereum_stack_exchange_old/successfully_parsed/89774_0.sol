pragma solidity ^0.5.16;


contract Bar {
    uint public b;
    address  owner;

    constructor() public {
        b = 100;

    }

}

contract Thing is Bar {
    uint public foo;
    constructor() public {
        foo = 1;
    }

    function setFoo(uint x) public {
        foo = x;
    }

}

