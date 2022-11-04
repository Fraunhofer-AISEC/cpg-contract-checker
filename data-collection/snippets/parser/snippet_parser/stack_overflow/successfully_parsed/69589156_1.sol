pragma solidity ^0.8;

interface ITargetContract {
    function foo() external returns (bool);
}

contract SourceContract {
    function baz() external {
        ITargetContract targetContract = ITargetContract(address(0x123));
        bool returnedValue = targetContract.foo();
    }
}
