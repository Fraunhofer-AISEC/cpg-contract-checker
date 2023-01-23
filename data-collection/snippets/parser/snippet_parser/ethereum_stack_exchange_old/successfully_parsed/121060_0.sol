
pragma solidity ^0.6.2;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.4.0/contracts/token/ERC721/ERC721.sol";

contract CryptoGift is ERC721 {
    address public owner;
    uint256 private birtday = block.timestamp +30; 

     constructor()  ERC721("Crypto Gift", "CGT") public {
        owner = msg.sender;       
    }

    function GiftAFriend (address from, address to, uint256 tokenId) public virtual {

       require( block.timestamp >= birtday, "Its NOT your birthday yet!" );
       safeTransferFrom(from, to, tokenId, ""); 
    }

}
