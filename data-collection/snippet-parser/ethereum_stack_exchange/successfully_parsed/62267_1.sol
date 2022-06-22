pragma solidity ^0.4.25;

contract Test { 
    mapping(string => bool) seen;

    function add(string foo) external {
        seen[foo] = true;
    }

    function alreadySeen(string foo) external view returns (bool) {
        return seen[foo];
    }
}
