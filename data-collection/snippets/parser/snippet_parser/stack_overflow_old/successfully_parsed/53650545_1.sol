pragma solidity ^0.5.1;

contract ContractA {
    ContractB contractB;

    constructor() public {
        contractB = new ContractB();
    }

    function saySomething() external view returns(string memory) {
        return contractB.retunsAString();
    }
}

contract ContractB {
    function retunsAString() public pure returns(string memory) {
        return "Hello to you all!";
    }
}
