
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract ArtifactSBTs is ERC1155URIStorage {
    address owner;
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC1155("") {
        owner = msg.sender;
    }

    function claimAchievement(string memory tokenURI, address addr) public {
        _setURI(10000000, tokenURI);
        _mint(addr, 10000000, 2, bytes(tokenURI));
    }
}
