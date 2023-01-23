pragma solidity ^0.8.0;

import "./contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "./contracts/utils/Counters.sol";
import "./contracts/access/Ownable.sol";

contract Name is ERC721URIStorage,Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("Name", "name") {}

    function mint(address nftowner)
    public
    onlyOwner
    returns(uint256)
    {
        uint256 newItemId = _tokenIds.current();
        _mint(nftowner, newItemId);
        _setTokenURI(newItemId, "https://example.com");
        _tokenIds.increment();
        return newItemId;
    }
}
