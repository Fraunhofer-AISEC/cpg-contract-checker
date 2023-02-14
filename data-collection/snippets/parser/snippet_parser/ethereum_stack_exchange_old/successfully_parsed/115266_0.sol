pragma solidity ^ 0.8.10;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract EGM_NFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIDs;
    constructor() ERC721("Gato NFT", "GFT") {}

    function createGatoNFT (string memory tokenURI) public returns (uint256) {
        _tokenIDs.increment();
        uint256 newTokenID = _tokenIDs.current();
        _safeMint(msg.sender, newTokenID);
        _setTokenURI(newTokenID, tokenURI);
        return newTokenID;
        
    }

}
