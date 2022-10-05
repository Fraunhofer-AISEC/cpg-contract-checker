pragma solidity ^0.4.2;

contract Registry {
    struct Name {
        string first;
        string last;
    }

    mapping(address => Name) reg;

    function newName(string first, string last) {
        address sender = msg.sender;

        if(reg[sender] != 0) {
            throw;
        }

        reg[sender].first = first;
        reg[sender].last = last;
    }
}
