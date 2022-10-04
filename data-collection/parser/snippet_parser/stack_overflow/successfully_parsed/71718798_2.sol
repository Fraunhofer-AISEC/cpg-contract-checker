
pragma solidity ^0.8.0;

import "./ERC721Metadata.sol";
import "./ERC721Connector.sol";

contract ERC721 {
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );

    mapping(uint256 => address) private _tokenOwner;
    mapping(address => uint256) private _OwnedTokensCount;

    function _exists(uint256 tokenId) internal view returns (bool) {
        address owner = _tokenOwner[tokenId];
        return owner != address(0);
    }

    function _mint(address to, uint256 tokenId) internal {
        require(to != address(0), "ERC721: minting to the zero address");
        require(
            !_exists(tokenId),
            "ERC721: minting a token that already exists (been minted)"
        );
        _tokenOwner[tokenId] = to;
        _OwnedTokensCount[to] += 1;

        emit Transfer(address(0), to, tokenId);
    }
}

