pragma solidity ^0.8.8;


import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract NFTChecker {
    function checkNFT(address _wallet, address _nftContractAddress, uint256 _tokenId) public view returns (bool) {
        IERC721 nftContract = IERC721(_nftContractAddress);
        return (nftContract.ownerOf(_tokenId) == _wallet);
    }
}
