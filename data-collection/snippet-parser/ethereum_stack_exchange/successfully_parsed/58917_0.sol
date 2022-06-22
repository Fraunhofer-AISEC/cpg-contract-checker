pragma solidity ^0.4.24;

import "../OrderBook.sol";

contract IdManager {
    uint256 newId;

    function addId() public returns (uint256) {
        newId++;
        return newId;
    }
}
