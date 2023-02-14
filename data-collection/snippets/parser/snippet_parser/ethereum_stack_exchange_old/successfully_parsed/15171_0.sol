pragma solidity ^0.4.0;  
contract MyContract {

struct FooFighter {  
    bool foo;  
    uint fighters;  
}  
mapping(bytes32 => FooFighter) public fooFighters;  
}