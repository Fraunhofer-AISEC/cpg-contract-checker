pragma solidity ^0.4.18;

import './Bar.sol';

contract Foo {
    uint storageData;
    Bar bar;
    address barContractAddress;

    constructor(address _barContractAddress) public {
        barContractAddress = _barContractAddress;
    }

    function set(uint x) public {
        storageData = x;
    }

    function get() view public returns (uint) {
        return storageData;
    }

    function baz() public returns (uint) {
        bar = Bar(barContractAddress);
        storageData = bar.baz(storageData);
    }

}
