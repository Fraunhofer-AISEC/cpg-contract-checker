

pragma experimental ABIEncoderV2;
pragma solidity >=0.6.0 <0.8.0;
import "../ERC721/ERC721.sol";


contract ezeynftFactory is ERC721 {
    constructor(string memory name, string memory symbol,string memory tokenURI,uint tokenID) 
     ERC721(name,symbol)
    {
        _safeMint(msg.sender, tokenID);
        _setTokenURI(tokenID,tokenURI);
    }
}