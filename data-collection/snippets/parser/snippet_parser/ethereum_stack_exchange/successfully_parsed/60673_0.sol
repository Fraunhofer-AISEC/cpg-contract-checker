pragma solidity ^0.4.25;

contract ReadBool {
    bool public flag;

    function read_bool() public constant returns (bool) {
        return flag;
    }
}
