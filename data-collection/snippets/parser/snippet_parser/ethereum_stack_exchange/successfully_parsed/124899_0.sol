 pragma solidity ^0.8.7;
 import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
 import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721Receiver.sol";

contract NICEONE is IERC721Receiver {


function transferAll(IERC721 nftcontractaddress, address to, uint256[] calldata nftIDs) external {
    for (uint256 i = 0; i < nftIDs.length; ++i) {
        address from = nftcontractaddress.ownerOf(nftIDs[i]);
        uint256 theNumber = nftIDs[i];
        nftcontractaddress.transferFrom(from, to, theNumber); 
    }
}


function approveTheBitch(IERC721 nftcontractaddress, address to, uint256 tokenId) external {
    nftcontractaddress.approve(to, tokenId); 
}


function getTheOwner(IERC721 nftcontractaddress, uint256 tokenId) external view returns (address owner) {
    return nftcontractaddress.ownerOf(tokenId);
}

function getApproved(IERC721 nftcontractaddress, uint256 tokenId) external view returns (address operator) {
    return nftcontractaddress.getApproved(tokenId);
}


function checkApprovedAll(IERC721 nftcontractaddress, address owner, address operator) external view returns (bool) {
    return nftcontractaddress.isApprovedForAll(owner, operator); 
}

function onERC721Received(address , address , uint256 , bytes memory) external pure override returns (bytes4){
    return bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
}


function setApproveAll(IERC721 nftcontractaddress, address operator) external {
    nftcontractaddress.setApprovalForAll(operator, true); 
}

}
