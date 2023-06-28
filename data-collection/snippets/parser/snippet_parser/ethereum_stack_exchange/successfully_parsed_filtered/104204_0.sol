
pragma solidity ^0.6.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/token/ERC721/ERC721.sol";

contract SampleNFTContract is ERC721 {

constructor () public ERC721 ("NFTTest1", "NFT1"){
}


function createNFT(uint256 tokenID, string memory ipfsLink) external {

_safeMint(msg.sender, tokenID);

_setTokenURI(tokenID, ipfsLink);

}


function updateURL(uint256 tokenID, string memory ipfsLink) external {


require(_isApprovedOrOwner(_msgSender(), tokenID), "Only owner can update");

_setTokenURI(tokenID, ipfsLink);

}

}
