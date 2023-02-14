
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.5.0/token/ERC721/IERC721.sol";

contract Market {
    function putOnSale(address _nftContract, uint256 _tokenId, uint256 _price) public payable {
        address tokenOwner = ERC721(_nftContract).ownerOf(_tokenId); 
        require(tokenOwner == msg.sender, 'Only owner...');
        
        
    }
}
