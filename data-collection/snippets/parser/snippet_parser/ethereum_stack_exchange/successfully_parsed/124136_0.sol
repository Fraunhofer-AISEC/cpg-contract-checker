

pragma solidity ^0.6.6;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract AdvancedCollectible is ERC721 {

    uint256 public tokenCounter;

    constructor(string memory collectionName, string memory symbol)

        public

        ERC721(collectionName, symbol)

    {

        tokenCounter = 0;

    }

    function createCollectible(string memory tokenUri)

        public

        returns (uint256)

    {

        uint256 newTokenId = tokenCounter;

        _safeMint(msg.sender, newTokenId);

        _setTokenURI(newTokenId, tokenUri);

        tokenCounter += 1;

        return tokenCounter;

    }

}
