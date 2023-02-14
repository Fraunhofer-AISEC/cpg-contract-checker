pragma solidity >=0.7.0 <0.9.0;



interface NFTContract {
    function ownerOf(uint256 tokenId) external view returns (address owner);
    function admin() external view returns (address);
} 

contract callNFT {
    function ownerOf(address _NftContract, uint256 _tokenIndex) public payable returns(address){
        address owner;
        owner = NFTContract(_NftContract).ownerOf(_tokenIndex);
        return owner;
    }

}
