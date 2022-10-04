
pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0-beta.0/contracts/token/ERC721/ERC721Enumerable.sol";
import "./ERC721Metadata.sol";


contract ERC721Full is ERC721Enumerable, ERC721Metadata {
    constructor (string memory name, string memory symbol) public ERC721Metadata(name, symbol) { }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        virtual
        override(ERC721Enumerable, ERC721Metadata)
        internal
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }
} ```
