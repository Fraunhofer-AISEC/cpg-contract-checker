pragma solidity ^0.4.6;

import "./Untitled.sol";

contract pullother {
address public hello;

function g() returns (address){
    hello = new helloworld();
    return hello;
}

function y(address contractadd) returns (uint){
    helloworld h = helloworld(contractadd);
    h.f();
}
}
