

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFTToken is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;    

    constructor(string memory name, string memory symbol) public ERC721(name, symbol) {}

    function _baseURI() 
        internal 
        pure 
        override 
        returns (string memory) {
        return "API_URL/api/";
    }

    function Mint(address to, bytes memory data)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();

        _safeMint(to, newItemId, data);
        return newItemId;
    }    
}
