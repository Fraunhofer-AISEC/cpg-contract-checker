pragma solidity ^0.4.0;

contract SimpleTimeStamp {
    uint lastHash;

    function set(uint x) public {
        lastHash = x;
    }
}
