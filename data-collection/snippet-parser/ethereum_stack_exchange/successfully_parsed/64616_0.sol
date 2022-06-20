pragma solidity ^0.4.24;

import "../openzeppelin-solidity/contracts/token/ERC721/ERC721MetadataMintable.sol";

contract Registry is ERC721MetadataMintable {
    string public name;
    string public symbol;

    constructor(
        string _name,
        string _symbol
    ) ERC721MetadataMintable() public payable {
        name = _name;
        symbol = _symbol;
    }
}
