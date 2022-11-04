pragma solidity ^0.4.24;

interface A {
    modifier onlyOwner() {
        require(getOwner() == msg.sender);
        _;
    }
    function getOwner() public returns(address);
    function updateState() public onlyOwner();
 }
