pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract RizerNonRandom is ERC721URIStorage {
    uint256 public tokenCounter;
    constructor () public ERC721 ("RizerSeq", "RZRI"){
        tokenCounter = 0;
    }

    function createRizerNonRandom(string memory tokenURI) public returns (uint256) {
        uint256 newItemId = tokenCounter;
        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        tokenCounter = tokenCounter + 1;
        return newItemId;
    }
}
