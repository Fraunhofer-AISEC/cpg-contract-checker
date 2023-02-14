pragma solidity >=0.4.21 <0.7.0;


contract Owner {
    address public owner;
    address public nextOwner;
    constructor () public {
        owner = msg.sender;
    }
}
