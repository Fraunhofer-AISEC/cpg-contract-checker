

pragma solidity ^0.8.13;

interface INft {
    function ownerOf(uint256 tokenId) external view returns (address); 
}

contract Test {
    function getNftTokenOwner(address _nft) external view returns (address){

    return INft(_nft).ownerOf(0);
    }
    








}
