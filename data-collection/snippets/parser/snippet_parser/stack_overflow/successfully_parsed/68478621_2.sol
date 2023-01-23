pragma solidity ^0.8.0;

import "./ERC721.sol";
import "./Counters.sol";

contract MyMintingContract is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("MyToken", "MTK") {}

    function mintToken(address receiver) external returns (uint256) {
        _tokenIds.increment();

        uint256 newTokenId = _tokenIds.current();
        _safeMint(receiver, newTokenId);

        return newTokenId;
    }
}
