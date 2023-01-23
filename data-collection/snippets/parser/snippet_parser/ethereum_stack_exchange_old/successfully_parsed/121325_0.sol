
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
    constructor() ERC721("NFTforMarket", "NFT") {}

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;


    function mint(string memory tokenURI) public returns (uint256) {
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        _tokenIds.increment();
        return newItemId;
    }


}

