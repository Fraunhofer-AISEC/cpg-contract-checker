
pragma solidity ^0.8.0;

contract A {

    constructor() {
    }
}

contract B {
    A public contractA;
    constructor() {
    }

    function getContractA(address _addressOfA) public {
        contractA = A(_addressOfA );
    }
}
