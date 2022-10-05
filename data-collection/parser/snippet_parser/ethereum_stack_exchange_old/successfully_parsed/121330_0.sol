
pragma solidity ^0.6.2;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/token/ERC721/ERC721.sol";

contract CryptoGift is ERC721 {

address public owner;

 constructor()  ERC721("Crypto Gift", "CGT") public {
    owner = msg.sender;

}

function createNFT(uint256 _tokenId) public {
    address NFTOwner = msg.sender;
    
    _mint(NFTOwner, _tokenId);
}

function GiftAFriend ( address _to, uint256 _tokenId) public virtual {
    address from = msg.sender;
    uint256 numberOfTokens = balanceOf(from);
    require(numberOfTokens >= 1, "You dont haven any Tokens!");        
    
    safeTransferFrom(from, _to, _tokenId, ""); 
}

}
