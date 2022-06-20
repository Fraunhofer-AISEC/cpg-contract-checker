pragma solidity ^0.8;

interface IContractA {
    function foo() external;
}

contract ContractB {
    IContractA contractA;
    
    constructor(address _contractA) {
        contractA = IContractA(_contractA);
    }

    function callFoo() external {
        contractA.foo();
    }

}
