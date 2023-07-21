
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyNFT is ERC721URIStorage, Ownable {

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    ERC20 public _token; 
    uint256 public _mintingFee = 1e18; 
    address tokenAddress = 0xeB3Eb991D39Dac92616da64b7c6D5af5cCFf1627;

    struct NFT {
        string collectionName;
    }

    mapping(uint256 => NFT) private _nfts;

    constructor(uint256 mintingFee) ERC721("MyNFT", "NFT") {
        _token = ERC20(tokenAddress);
        _mintingFee = mintingFee * 1e18;
    }

    function showBUSD() 
        public view 
        returns (uint256)
    {
        return _token.balanceOf(msg.sender);
    }

    function mintNFT(address recipient, string memory tokenURI, string memory _collectionName)
        public onlyOwner 
        returns (uint256)
    {   
        
        require(_token.balanceOf(msg.sender) >= _mintingFee, "Insufficient balance");
        
        
        _token.transferFrom(msg.sender, address(this), _mintingFee);
        
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _nfts[newItemId].collectionName = _collectionName;
        _setTokenURI(newItemId, tokenURI);

        

        return newItemId;
    }

    function getCollectionName(uint256 tokenId) 
        public view 
        returns (string memory) 
    {
        return _nfts[tokenId].collectionName;
    }

    function setMintingFee(uint256 newFee) 
        external onlyOwner 
    {
        _mintingFee = newFee * 1e18;
    }
}
