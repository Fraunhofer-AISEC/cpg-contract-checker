pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Item is ERC721URIStorage {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;
    address contractAddress;

    constructor(address marketAddress) ERC721("Item", "ITM") {
        contractAddress = marketAddress;
    }

    function createToken(string memory _URI)
        public
        returns(uint256)
    {
        _tokenIds.increment();

        uint256 itemId = _tokenIds.current();
        _mint(msg.sender, itemId);
        _setTokenURI(itemId, _URI);
        setApprovalForAll(contractAddress, true);
        return itemId;
    }
}
