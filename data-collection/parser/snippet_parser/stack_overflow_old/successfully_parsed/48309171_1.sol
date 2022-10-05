pragma solidity ^0.4.19;

contract MyContract{
    struct MyStruct {
        uint256 foo;
    }
    mapping(address => MyStruct[])  myStruct;
}
