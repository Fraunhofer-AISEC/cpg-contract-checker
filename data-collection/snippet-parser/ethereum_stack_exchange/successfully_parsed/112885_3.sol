pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "./3_Ballot.sol";
import "./1_Storage.sol";


contract NFTMarketPlace {
    
    YourToken token;
    NFTToken  NFT;
   
    
   
  
    
    mapping(uint256 => bool) public tokenIdForSale;
    
    
    
    
    mapping(uint256 => address) public nftBuyers;
    
    
    constructor (address tokenAddress, address NFTAddress)  {
        token = YourToken(tokenAddress);
        NFT = NFTToken(NFTAddress);
       
    
    }
    
    function nftSale(uint256 _tokenId,bool forSale) external {
        require(msg.sender == NFT.ownerOf(_tokenId),"Only owners can change this status");
        tokenIdForSale[_tokenId] = forSale;
    }
    
   
    function nftBuy(uint256 _tokenId) payable public {
        require(tokenIdForSale[_tokenId],"Token must be on sale first");
        uint nftPrice = NFT.tokenPrice(_tokenId);
        require(msg.value >= nftPrice, "Insufficient balance.");
        
        token.transfer(payable(NFT.ownerOf(_tokenId)),nftPrice);
        nftBuyers[_tokenId] = msg.sender;
        
    }
    
    
    
}
