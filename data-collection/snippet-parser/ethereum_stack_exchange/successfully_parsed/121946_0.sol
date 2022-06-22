pragma solidity ^0.8.0;

contract TestA {

    function test() public returns (TestB) {
        return new TestB();
    }
}

contract TestB {
    uint256 public somedata = 123;
}
