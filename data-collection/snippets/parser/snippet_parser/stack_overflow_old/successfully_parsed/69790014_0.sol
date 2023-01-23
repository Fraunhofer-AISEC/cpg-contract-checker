


pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    uint256 mintPrice = 0.025 ether;

    constructor() ERC721("NFT", "ITM"){}

    function mint(address user, string memory tokenURI)
        public
        payable
        returns (uint256)
        {
            require(msg.value == mintPrice, "Not Enough Ether");
            _tokenIds.increment();

            uint256 newItemId = _tokenIds.current();
            _mint(user, newItemId);
            _setTokenURI(newItemId, tokenURI);

            return newItemId;
        }

}
