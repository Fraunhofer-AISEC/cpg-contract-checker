
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract SampleNFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address private _marketplace;

    constructor(address marketplace) ERC721("sample nft", "sn") {
        _marketplace = marketplace;
    }

    function mint() public {
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();
        _safeMint(msg.sender, newTokenId);
        setApprovalForAll(_marketplace, true);
    }

    function burn(uint256 tokenId) public {
        _burn(tokenId);
    }
}
