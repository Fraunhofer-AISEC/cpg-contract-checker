pragma solidity ^0.4.0;

contract A {
    constructor(uint paramA) public {

    }
}

contract B is A {
    constructor(address paramB) public {

    }
}

contract C is A {
    constructor(string paramC) public {

    }
}

contract D is B, C {
    constructor(uint paramForA, address paramForB, string paramForC) public 
    {

    }
}
