

pragma solidity ^0.8.13;

interface INft {
    function owner() external view returns (address); 
    function name() external view returns (string calldata); 
    function ownerOf(uint256 tokenId) external view returns (address); 
}

contract Test {
    
    function getNftProjectOwner (address _nft) external view returns (address){
        return INft(_nft).owner();
    }
    
    function getNftProjectName (address _nft) external view returns (string memory){
        return INft(_nft).name();
    }
    
    function getNftTokenOwner(address _nft, uint256 _tokenId) external view returns (address){
        return INft(_nft).ownerOf(_tokenId);
    }
    
}
