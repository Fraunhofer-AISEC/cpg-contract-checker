

pragma solidity ^0.8.7;

contract contractA{

    string data;
    uint public blocknumber;
    address public owner;

    constructor() payable {
        owner = msg.sender;
    }

    function set_data(string memory _data) public {
        require(owner == msg.sender,"You are not the owner of the contract");
        data = _data;
        blocknumber = block.number;
    }
}
