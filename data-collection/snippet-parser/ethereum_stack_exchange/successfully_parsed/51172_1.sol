pragma solidity ^0.4.18;

import './Proxy.sol';

contract Bar is Proxy {
    function baz(uint x) public returns (uint) {
        return  x * x;
    }
}
