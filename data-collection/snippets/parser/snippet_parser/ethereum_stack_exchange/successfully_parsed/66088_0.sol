pragma solidity >0.5.0;
pragma experimental ABIEncoderV2;

contract Foo {
    constructor(address[] memory _addrs) public {}
}

contract FooFactory {
    function createInstance(address[] calldata _addrs) external {
        new Foo(_addrs);
    }
}
