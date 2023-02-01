
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";




contract Token is ERC721URIStorage,Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
     uint public _counter;
    event NFTMinted(uint256 indexed _id);

uint public mintPrice = 100;
    constructor() ERC721("Ratofy's Marketplace Tokens", "NFT") {}

    function totalSupply() public view returns (uint256) {
        uint256 totalMintedNFTs = _tokenIds.current();
        return totalMintedNFTs;
    }
    
    function createNFT(address sender, string memory tokenURI) public payable returns(uint256) {
   
    uint256 newItemId = _tokenIds.current();

    _mint(sender, newItemId);
    _setTokenURI(newItemId, tokenURI);
     _tokenIds.increment();
    emit NFTMinted(newItemId);
    return newItemId;
    }

    function transferNFTs(address _from, address _to , uint _tokenId) public {
        safeTransferFrom(_from, _to, _tokenId);
    }
}
