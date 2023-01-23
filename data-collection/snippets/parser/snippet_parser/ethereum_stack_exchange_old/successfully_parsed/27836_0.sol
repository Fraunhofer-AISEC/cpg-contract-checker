pragma solidity ^0.4.16; 

library C {
function a() returns (address) {
    return address(this);
}}

contract A {
function a() constant returns (address) {
    return C.a();
}}
