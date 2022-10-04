pragma solidity ^0.4.22;

contract ContractA {
    ContractB contractB;

    constructor() public {
        contractB = new ContractB();
    }

    function saySomething() external returns(string) {
        return contractB.retunsAString();
    }
}

contract ContractB {
    function retunsAString() public pure returns(string) {
        return "Hello to you all!";
    }
}
