    
pragma solidity 0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/IERC721Receiver.sol";

contract Tat is IERC721Receiver {
    
constructor() public {}


function approveAndTransfer(IERC721 nft, uint256 _tokenId, address _from, address _to) public {
    require(nft.ownerOf(_tokenId) == msg.sender, "NOT OWNER");
    nft.isApprovedForAll(_from, address(this));
    nft.safeTransferFrom(msg.sender, _to,_tokenId);
}

function ownerOf(IERC721 nft, uint256 tokenId) external view returns (address owner) {
    return nft.ownerOf(tokenId);
}


function test() public view returns(address sc,address own){
    return (address(this),msg.sender);
}


function onERC721Received(address _operator, address _from, uint256 _tokenId, bytes memory _data) public override returns(bytes4) {
       return 0x150b7a02;
 }

}
