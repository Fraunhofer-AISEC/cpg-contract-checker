pragma solidity ^0.4.10;

contract Mappings {
    mapping(address => mapping(uint256 => Shelf)) bookcase;
    struct Shelf {
      bytes32[] books;
      uint shelfId;
    }
}
