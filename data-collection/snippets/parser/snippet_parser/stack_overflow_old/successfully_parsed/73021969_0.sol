
pragma solidity ^0.8.4;

contract Pagination {
    uint public stringCount;
    mapping (uint => string) public strings;

    function add(string memory item) public {
        stringCount++;
        strings[stringCount]=item;
    }
}
